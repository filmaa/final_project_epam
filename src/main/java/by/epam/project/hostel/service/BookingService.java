package by.epam.project.hostel.service;

import by.epam.project.hostel.entity.Booking;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.service.exception.ServiceException;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface BookingService extends EntityService {

    List<Booking> getBookings(int currentPage) throws ServiceException;

    List<Booking> getUserBookings(int userId, int currentPage) throws ServiceException;

    void deleteBookingById(Integer bookingId) throws ServiceException;

    void bookRoom(Booking booking) throws ServiceException;

    Map<String, Object> getBookingDetails(LocalDate dateFrom, LocalDate dateTo, Guestroom guestroom) throws ServiceException;

    void payBooking(Integer bookingId) throws ServiceException;

    Booking getBookingById(Integer id) throws ServiceException;
}
