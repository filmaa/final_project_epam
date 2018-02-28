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
import static by.epam.project.hostel.controller.constant.Constant.Exception.FALSE;
import static by.epam.project.hostel.controller.constant.Constant.Exception.TRUE;
import static by.epam.project.hostel.controller.constant.Constant.Page.ADMIN_ENTRY;
import static by.epam.project.hostel.controller.constant.Constant.Page.ADMIN_SIGN_IN;
import static by.epam.project.hostel.controller.constant.Constant.User.LOGIN;
import static by.epam.project.hostel.controller.constant.Constant.User.PASSWORD;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;

public class LoginAdminCommand implements Command {

    private static final Logger logger = LogManager.getLogger(LoginAdminCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String error = TRUE;
        String forwardPage = ADMIN_SIGN_IN;
        try {
            String login = request.getParameter(LOGIN);
            String password = request.getParameter(PASSWORD);
            User user = ServiceFactory.getInstance().getUserService().adminSignIn(login, password);
            if (user != null) {
                request.getSession().setAttribute(USER, user);
                error = FALSE;
                forwardPage = ADMIN_ENTRY;
            }
        } catch (ServiceException e) {
            logger.error("error during longing admin command", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
        try {
            request.getSession().setAttribute(ERROR_USER_NOT_LOGGED, error);
            response.sendRedirect(forwardPage);
        } catch (IOException e) {
            logger.error("error during forward in LoginAdminCommand", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
