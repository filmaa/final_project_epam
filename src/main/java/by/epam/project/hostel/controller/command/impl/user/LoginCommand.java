package by.epam.project.hostel.controller.command.impl.user;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Exception.ERROR_USER_NOT_LOGGED;
import static by.epam.project.hostel.controller.constant.Constant.Page.BLOCK_PAGE_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Page.INDEX_JSP;
import static by.epam.project.hostel.controller.constant.Constant.URL;
import static by.epam.project.hostel.controller.constant.Constant.User.LOGIN;
import static by.epam.project.hostel.controller.constant.Constant.User.PASSWORD;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;


public class LoginCommand implements Command {

    private static final Logger logger = LogManager.getLogger(LoginCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        Boolean error = true;
        try {
            String login = request.getParameter(LOGIN);
            String password = request.getParameter(PASSWORD);
            User user = ServiceFactory.getInstance().getUserService().singIn(login, password);
            if (user != null && !user.isBanned()) {
                request.getSession().setAttribute(USER, user);
                error = false;
            } else if (user != null && user.isBanned()) {
                request.getSession().setAttribute(ERROR_USER_NOT_LOGGED, false);
                response.sendRedirect(BLOCK_PAGE_JSP);
                return;
            }
        } catch (ServiceException | IOException e) {
            logger.error("error during login command", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
        try {
            request.setAttribute(ERROR_USER_NOT_LOGGED, error);
            String url = (String) request.getSession().getAttribute(URL);
            if (url != null && !url.isEmpty()) {
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                request.getRequestDispatcher(INDEX_JSP).forward(request, response);
            }
        } catch (ServletException | IOException e) {
            logger.error("error during forward in login command", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
