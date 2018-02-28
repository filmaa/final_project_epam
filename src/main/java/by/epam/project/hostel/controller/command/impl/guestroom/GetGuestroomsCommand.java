package by.epam.project.hostel.controller.command.impl.guestroom;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.pagination.PageWrapper;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.entity.pagination.Page;
import by.epam.project.hostel.service.GuestroomService;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Hostel.NAME;
import static by.epam.project.hostel.controller.constant.Constant.Page.CURRENT_PAGE;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;
import static by.epam.project.hostel.controller.constant.Constant.Page.PAGE;

public class GetGuestroomsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetGuestroomCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String language = (String) request.getSession().getAttribute(LOCAL);
        String hostelName = request.getParameter(NAME);
        String curPage = request.getParameter(CURRENT_PAGE);
        Integer currentPage = (curPage == null || curPage.isEmpty()) ? 1 : Integer.valueOf(curPage);
        try {
            GuestroomService guestroomService = ServiceFactory.getInstance().getGuestroomService();
            List<Guestroom> guestrooms;
            Integer totalRowCount;
            if ((hostelName == null || hostelName.isEmpty())) {
                guestrooms = guestroomService.getGuestrooms(language, currentPage);
                totalRowCount = guestroomService.getTotalRowCount();
            } else {
                guestrooms = guestroomService.getGuestroomsByHostelName(hostelName, currentPage);
                totalRowCount = guestroomService.getTotalRowCount(hostelName);
            }
            Page<Guestroom> page = PageWrapper.wrapList(guestrooms, currentPage, totalRowCount);
            request.setAttribute(PAGE, page);
        } catch (ServiceException e) {
            logger.error("error during getting guestrooms", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
