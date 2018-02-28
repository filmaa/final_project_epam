package by.epam.project.hostel.controller.command.impl.user;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.constant.Constant;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.UserService;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;
import static by.epam.project.hostel.controller.constant.Constant.Page.ADMIN_ADMIN_USERS;
import static by.epam.project.hostel.controller.constant.Constant.User.BANNED;
import static by.epam.project.hostel.controller.constant.Constant.User.NOT_BANNED;
import static by.epam.project.hostel.controller.constant.Constant.User.ROLE;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;


public class EditRoleBanUserCommand implements Command {

    private static final Logger logger = LogManager.getLogger(EditRoleBanUserCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.valueOf(request.getParameter(Constant.User.ID));
        String role = request.getParameter(ROLE);
        if (role == null) {
            role = USER;
        }
        String banned = request.getParameter(BANNED);
        if (banned == null) {
            banned = NOT_BANNED;
        }
        ServiceFactory instance = ServiceFactory.getInstance();
        UserService userService = instance.getUserService();
        try {
            userService.updateUser(id, role, Integer.valueOf(banned));
            response.sendRedirect(ADMIN_ADMIN_USERS);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.edit.role.ban.user");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during editing user", e);
        }
    }

}
