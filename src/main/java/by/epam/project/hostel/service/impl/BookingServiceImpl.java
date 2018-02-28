package by.epam.project.hostel.service.impl;

import by.epam.project.hostel.dao.BookingDAO;
import by.epam.project.hostel.dao.DAOFactory;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Booking;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.service.BookingService;
import by.epam.project.hostel.service.exception.ServiceException;
import by.epam.project.hostel.service.validation.Validator;
import by.epam.project.hostel.service.validation.impl.BookingValidatorImpl;
import by.epam.project.hostel.service.validation.impl.GuestroomValidatorImpl;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static by.epam.project.hostel.controller.constant.Constant.Booking.FINAL_COST;

public class BookingServiceImpl extends BaseService implements BookingService {

    private static final BookingDAO bookingDAO = DAOFactory.getInstance().getBookingDAO();
    private static final Validator<Booking> validator = new BookingValidatorImpl();

    @Override
    public int getTotalRowCount() throws ServiceException {
        try {
            return bookingDAO.getTotalRowCount();
        } catch (DAOException e) {
            throw new ServiceException("error during getting booking's total row count", e);
        }
    }

    @Override
    public List<Booking> getBookings(int currentPage) throws ServiceException {
        validator.validateCurrentPage(currentPage);
        try {
            return bookingDAO.getBookings(currentPage);
        } catch (DAOException e) {
            throw new ServiceException("error during getting user's bookings", e);
        }
    }

    @Override
    public List<Booking> getUserBookings(int userId, int currentPage) throws ServiceException {
        validator.validateID(userId);
        validator.validateCurrentPage(currentPage);
        try {
            return bookingDAO.getUserBookings(userId, currentPage);
        } catch (DAOException e) {
            throw new ServiceException("error during getting user's bookings", e);
        }
    }

    @Override
    public void deleteBookingById(Integer bookingId) throws ServiceException {
        validator.validateID(bookingId);
        try {
            bookingDAO.deleteBookingById(bookingId);
        } catch (DAOException e) {
            throw new ServiceException("error during deleting booking by id = " + bookingId, e);
        }
    }

    @Override
    public void bookRoom(Booking booking) throws ServiceException {
        validator.validate(booking);
        try {
            bookingDAO.bookRoom(booking);
        } catch (DAOException e) {
            throw new ServiceException("error during booking room", e);
        }
    }

    @Override
    public Map<String, Object> getBookingDetails(LocalDate dateFrom, LocalDate dateTo, Guestroom guestroom) throws ServiceException {
        ((BookingValidatorImpl) validator).validateDates(dateFrom, dateTo);
        Validator<Guestroom> guestroomValidator = new GuestroomValidatorImpl();
        guestroomValidator.validate(guestroom);
        Map<String, Object> bookingDetails = new HashMap<>();
        Booking booking = new Booking();
        booking.setFinalCost(dateFrom, dateTo, guestroom.getNightPrice());
        bookingDetails.put(FINAL_COST, booking.getFinalCost());
        return bookingDetails;
    }

    @Override
    public void payBooking(Integer bookingId) throws ServiceException {
        validator.validateID(bookingId);
        try {
            bookingDAO.payBooking(bookingId);
        } catch (DAOException e) {
            throw new ServiceException("error during set booking payed", e);
        }
    }

    @Override
    public Booking getBookingById(Integer id) throws ServiceException {
        validator.validateID(id);
        try {
            return bookingDAO.getBookingById(id);
        } catch (DAOException e) {
            throw new ServiceException("error during getting booking by id", e);
        }
    }
}
