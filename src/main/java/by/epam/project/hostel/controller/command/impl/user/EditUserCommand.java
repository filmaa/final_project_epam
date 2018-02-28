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

import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;
import static by.epam.project.hostel.controller.constant.Constant.User.EMAIL;
import static by.epam.project.hostel.controller.constant.Constant.User.LOGIN;
import static by.epam.project.hostel.controller.constant.Constant.User.NAME;
import static by.epam.project.hostel.controller.constant.Constant.User.NUMBER;
import static by.epam.project.hostel.controller.constant.Constant.User.PASSWORD;
import static by.epam.project.hostel.controller.constant.Constant.User.SURNAME;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;

public class EditUserCommand implements Command {

    private static final Logger logger = LogManager.getLogger(EditUserCommand.class);
    private static final String USER_ACCOUNT = "/user/account";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = createUser(request);
        try {
            ServiceFactory.getInstance().getUserService().updateUser(user);
            User newUser = ServiceFactory.getInstance().getUserService().getUserById(user.getId());
            request.getSession().removeAttribute(USER);
            request.getSession().setAttribute(USER, newUser);
            response.sendRedirect(USER_ACCOUNT);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.edit.user");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during edit user", e);
        }
    }

    private User createUser(HttpServletRequest request) {
        String name = request.getParameter(NAME);
        String surname = request.getParameter(SURNAME);
        String login = request.getParameter(LOGIN);
        String password = request.getParameter(PASSWORD);
        String email = request.getParameter(EMAIL);
        String number = request.getParameter(NUMBER);
        Integer id = ((User) request.getSession().getAttribute(USER)).getId();
        User user = new User();
        user.setId(id);
        user.setNumber(number);
        user.setName(name);
        user.setSurname(surname);
        user.setLogin(login);
        user.setPassword(password);
        user.setEmail(email);
        return user;
    }
}
