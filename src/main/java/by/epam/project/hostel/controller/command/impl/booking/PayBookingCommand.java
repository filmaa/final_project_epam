package by.epam.project.hostel.controller.command.impl.booking;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.mail.MailSender;
import by.epam.project.hostel.entity.Booking;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import static by.epam.project.hostel.controller.constant.Constant.Booking.ID;
import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;

public class PayBookingCommand implements Command {

    private static final Logger logger = LogManager.getLogger(PayBookingCommand.class);
    private static final ServiceFactory instance = ServiceFactory.getInstance();
    private static final String USER_BOOKINGS = "/user/bookings";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer bookingId = Integer.valueOf(request.getParameter(ID));
        try {
            ServiceFactory.getInstance().getBookingService().payBooking(bookingId);
            Booking booking = instance.getBookingService().getBookingById(bookingId);
            String content = generateMessage(request, booking);
            User user = instance.getUserService().getUserById(booking.getUserId());
            MailSender.sendMessage("Booking is payed", content, user.getEmail());
            response.sendRedirect(USER_BOOKINGS);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.pay.booking");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during pay booking", e);
        }
    }

    private String generateMessage(HttpServletRequest request, Booking booking) throws ServiceException {
        String language = (String) request.getSession().getAttribute(LOCAL);
        Guestroom guestroom = ServiceFactory.getInstance().getGuestroomService().getGuestroomById(booking.getGuestroomId(), language);
        StringBuilder message = new StringBuilder();
        message.append("Your booking is payed.");
        message.append("\n");
        message.append("Guestroom price for night: ").append(guestroom.getNightPrice());
        message.append("\n");
        message.append("Booking final cost:").append(booking.getFinalCost());
        message.append("\n");
        message.append("Dates: ").append(booking.getStartDay()).append(" - ").append(booking.getLastDay());
        message.append("\n");
        message.append("\n");
        message.append("your best hostel").append("\n");
        message.append(LocalDateTime.now().toString());
        return message.toString();
    }
}
