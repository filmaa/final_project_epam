package by.epam.project.hostel.controller.command.impl.booking;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Booking.ID;
import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;

public class DeleteBookingByIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(DeleteBookingByIdCommand.class);
    private static final String USER_BOOKINGS = "/user/bookings";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bookingId = Integer.valueOf(request.getParameter(ID));
        try {
            ServiceFactory.getInstance().getBookingService().deleteBookingById(bookingId);
            response.sendRedirect(USER_BOOKINGS);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.delete.booking");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during deleting booking by id", e);
        }
    }
}
