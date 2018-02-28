package by.epam.project.hostel.controller.command.impl.user;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.pagination.PageWrapper;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.entity.pagination.Page;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.UserService;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Page.CURRENT_PAGE;
import static by.epam.project.hostel.controller.constant.Constant.Page.PAGE;


public class GetUsersCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetUsersCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        ServiceFactory instance = ServiceFactory.getInstance();
        UserService userService = instance.getUserService();
        try {
            String page = request.getParameter(CURRENT_PAGE);
            int currentPage = (page == null || page.isEmpty()) ? 1 : Integer.valueOf(page);
            List<User> users = userService.getUsers(currentPage);
            int totalRowCount = userService.getTotalRowCount();
            Page<User> usersPage = PageWrapper.wrapList(users, currentPage, totalRowCount);
            request.setAttribute(PAGE, usersPage);
        } catch (ServiceException e) {
            logger.error("error during getting page with users", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }

    }
}
