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

import static by.epam.project.hostel.controller.constant.Constant.User.ID;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;

public class GetUserByIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetUserByIdCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userId = Integer.valueOf(request.getParameter(ID));
        try {
            User user = ServiceFactory.getInstance().getUserService().getUserById(userId);
            request.setAttribute(USER, user);
        } catch (ServiceException e) {
            logger.error("error during getting user by id", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }


    }
}
