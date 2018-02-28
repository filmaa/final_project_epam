package by.epam.project.hostel.controller.command.impl.user;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.LoginDuplicatedException;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Exception.ERROR;
import static by.epam.project.hostel.controller.constant.Constant.Exception.TRUE;
import static by.epam.project.hostel.controller.constant.Constant.Page.INDEX_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Page.REGISTRATION_JSP;
import static by.epam.project.hostel.controller.constant.Constant.User.EMAIL;
import static by.epam.project.hostel.controller.constant.Constant.User.LOGIN;
import static by.epam.project.hostel.controller.constant.Constant.User.NAME;
import static by.epam.project.hostel.controller.constant.Constant.User.NUMBER;
import static by.epam.project.hostel.controller.constant.Constant.User.PASSWORD;
import static by.epam.project.hostel.controller.constant.Constant.User.SURNAME;

public class RegistrationCommand implements Command {

    private static final Logger logger = LogManager.getLogger(RegistrationCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter(NAME);
        String surname = request.getParameter(SURNAME);
        String login = request.getParameter(LOGIN);
        String password = request.getParameter(PASSWORD);
        String email = request.getParameter(EMAIL);
        String number = request.getParameter(NUMBER);
        try {
            ServiceFactory.getInstance().getUserService().registerUser(name, surname, login, password, email, number);
            response.sendRedirect(INDEX_JSP);
        } catch (LoginDuplicatedException e) {
            request.setAttribute(ERROR, e.getErrorParam());
            logger.error("such login exist", e);
            request.getRequestDispatcher(REGISTRATION_JSP).forward(request, response);
        } catch (ServiceException | IOException e) {
            request.setAttribute(ERROR, TRUE);
            logger.error("error during registration", e);
            request.getRequestDispatcher(REGISTRATION_JSP).forward(request, response);
        }
    }
}
