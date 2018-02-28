package by.epam.project.hostel.controller.command.impl.booking;

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
import java.time.LocalDate;
import java.util.Map;

import static by.epam.project.hostel.controller.constant.Constant.Booking.FINAL_COST;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.GUESTROOM;
import static by.epam.project.hostel.controller.constant.Constant.SearchParams.DATE_FROM;
import static by.epam.project.hostel.controller.constant.Constant.SearchParams.DATE_TO;

public class GetBookingDetailsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetBookingDetailsCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDate dateFrom = LocalDate.parse(request.getParameter(DATE_FROM));
        LocalDate dateTo = LocalDate.parse(request.getParameter(DATE_TO));
        Guestroom guestroom = (Guestroom) request.getAttribute(GUESTROOM);
        Map<String, Object> bookingDetails;
        try {
            bookingDetails = ServiceFactory.getInstance().getBookingService().getBookingDetails(dateFrom, dateTo, guestroom);
            request.setAttribute(FINAL_COST, bookingDetails.get(FINAL_COST));
        } catch (ServiceException e) {
            logger.error("error during getting booking details command", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
