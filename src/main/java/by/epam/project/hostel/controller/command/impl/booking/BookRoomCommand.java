package by.epam.project.hostel.controller.command.impl.booking;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Booking;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.ID;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;
import static by.epam.project.hostel.controller.constant.Constant.SearchParams.DATE_FROM;
import static by.epam.project.hostel.controller.constant.Constant.SearchParams.DATE_TO;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;

public class BookRoomCommand implements Command {

    private static final Logger logger = LogManager.getLogger(BookRoomCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer roomId = Integer.valueOf(request.getParameter(ID));

        try {
            ServiceFactory instance = ServiceFactory.getInstance();
            BigDecimal nightPrice = instance.getGuestroomService().getNightPriceByRoomId(roomId);
            User user = (User) request.getSession().getAttribute(USER);
            Integer userId = user.getId();
            LocalDate lastDate = LocalDate.parse(request.getParameter(DATE_TO));
            LocalDate startDay = LocalDate.parse(request.getParameter(DATE_FROM));
            LocalDate today = LocalDate.now();
            Booking booking = new Booking(nightPrice, startDay, lastDate, today, userId, roomId);
            instance.getBookingService().bookRoom(booking);
            response.sendRedirect("/user/bookings?page=1");
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.book.room");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during booking room", e);
        }
    }
}
