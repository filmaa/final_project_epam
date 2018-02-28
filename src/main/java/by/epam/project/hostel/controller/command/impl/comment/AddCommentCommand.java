package by.epam.project.hostel.controller.command.impl.comment;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Comment;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

import static by.epam.project.hostel.controller.constant.Constant.Comment.COMMENT;
import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.ID;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;


public class AddCommentCommand implements Command {

    private static final Logger logger = LogManager.getLogger(AddCommentCommand.class);
    private static final String GUESTROOM_JSP_ID = "/guestroom.jsp?id=";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer guestroomId = Integer.valueOf(request.getParameter(ID));
        Integer userId = ((User) request.getSession().getAttribute(USER)).getId();
        String commentText = request.getParameter(COMMENT);
        LocalDate localDate = LocalDate.now();
        Comment comment = new Comment(userId, guestroomId, commentText, localDate);
        try {
            ServiceFactory.getInstance().getCommentService().addComment(comment);
            response.sendRedirect(GUESTROOM_JSP_ID + guestroomId);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.add.comment");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during adding comment in db", e);
        }
    }
}
