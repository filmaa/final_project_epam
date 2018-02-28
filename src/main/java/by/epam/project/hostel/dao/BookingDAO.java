package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Booking;

import java.util.List;

public interface BookingDAO extends EntityDAO {

    List<Booking> getBookings(int currentPage) throws DAOException;

    List<Booking> getUserBookings(int userId, int currentPage) throws DAOException;

    void deleteBookingById(Integer bookingId) throws DAOException;

    void bookRoom(Booking booking) throws DAOException;

    void payBooking(int bookingId) throws DAOException;

    Booking getBookingById(int id) throws DAOException;
}
