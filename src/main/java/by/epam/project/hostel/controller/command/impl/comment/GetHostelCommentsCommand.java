package by.epam.project.hostel.controller.command.impl.comment;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Comment;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Comment.COMMENTS;
import static by.epam.project.hostel.controller.constant.Constant.Hostel.ID;

public class GetHostelCommentsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetHostelCommentsCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer hostelId = Integer.valueOf(request.getParameter(ID));
        try {
            List<Comment> comments = ServiceFactory.getInstance().getCommentService().getCommentsByHostelId(hostelId);
            request.setAttribute(COMMENTS, comments);
        } catch (ServiceException e) {
            logger.error("error during getting comments by hostel id" + hostelId, e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
