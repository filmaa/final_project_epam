package by.epam.project.hostel.controller.command.impl.comment;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Booking.GUESTROOM_ID;
import static by.epam.project.hostel.controller.constant.Constant.Comment.ID;
import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;

public class DeleteCommentByIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(DeleteCommentByIdCommand.class);
    private static final String GUESTROOM_JSP_ID = "/guestroom.jsp?id=";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer commentId = Integer.valueOf(request.getParameter(ID));
        Integer guestroomId = Integer.valueOf(request.getParameter(GUESTROOM_ID));
        try {
            ServiceFactory.getInstance().getCommentService().deleteCommentById(commentId);
            response.sendRedirect(GUESTROOM_JSP_ID + guestroomId);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.delete.comment");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during delete comment by id", e);
        }

    }
}
