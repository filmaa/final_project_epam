package by.epam.project.hostel.controller.command.impl.guestroom;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Guestroom.GUESTROOMS;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.HOSTEL_ID;
import static by.epam.project.hostel.controller.constant.Constant.Page.CURRENT_PAGE;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;

public class GetGuestroomsByHostelIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetGuestroomsByHostelIdCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String language = (String) request.getSession().getAttribute(LOCAL);
        String page = request.getParameter(CURRENT_PAGE);
        Integer currentPage = (page == null || page.isEmpty()) ? 1 : Integer.valueOf(page);
        Integer hostelId = Integer.valueOf(request.getParameter(HOSTEL_ID));

        try {
            List<Guestroom> guestrooms = ServiceFactory.getInstance().getGuestroomService().getGuestroomByHostelId(hostelId, language, currentPage);
            request.setAttribute(GUESTROOMS, guestrooms);
        } catch (ServiceException e) {
            logger.error("error during getting guestroom by hostel id", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
