package by.epam.project.hostel.dao.impl;

import by.epam.project.hostel.dao.BaseDAO;
import by.epam.project.hostel.dao.BookingDAO;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Booking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import static by.epam.project.hostel.controller.pagination.PageWrapper.MAX_ENTRIES_PER_PAGE;

public class BookingDAOImpl extends BaseDAO implements BookingDAO {

    private static final String SELECT_BOOKINGS = "SELECT  bookings.id AS booking_id,  guestrooms_id,  bookings.night_price,  start_day,  last_day,  payed,  book_day, all_price, user_id FROM bookings INNER JOIN guestrooms g ON bookings.guestrooms_id = g.id LIMIT ?,?";
    private static final String DELETE_BOOKING_BY_ID = "DELETE FROM bookings WHERE id = ?";
    private static final String SELECT_BOOKINGS_BY_USER_ID_LIMIT = "SELECT  bookings.id AS booking_id,  guestrooms_id,  bookings.night_price,  start_day,  last_day,  payed,  book_day, all_price, user_id FROM bookings INNER JOIN guestrooms g ON bookings.guestrooms_id = g.id WHERE user_id = ? LIMIT ?,?";
    private static final String INSERT_BOOKING = "INSERT INTO bookings(user_id, guestrooms_id, night_price, start_day, last_day, book_day, all_price) VALUES (?,?,?,?,?,?,?)";
    private static final String UPDATE_BOOKINGS_SET_PAYED = "UPDATE bookings SET payed = 1 WHERE id = ?";
    private static final String BOOKINGS = "bookings";
    private static final String SELECT_BOOKING_BY_ID = "SELECT id,  guestrooms_id,  bookings.night_price,  start_day,  last_day,  payed,  book_day, all_price, user_id FROM bookings WHERE id = ?";

    @Override
    public List<Booking> getBookings(int currentPage) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_BOOKINGS)) {
            ps.setInt(1, (currentPage - 1) * MAX_ENTRIES_PER_PAGE);
            ps.setInt(2, MAX_ENTRIES_PER_PAGE);
            try (ResultSet rs = ps.executeQuery()) {
                return createBookings(rs);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting user's bookings", e);
        }
    }

    @Override
    public List<Booking> getUserBookings(int userId, int currentPage) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_BOOKINGS_BY_USER_ID_LIMIT)) {
            ps.setInt(1, userId);
            ps.setInt(2, (currentPage - 1) * MAX_ENTRIES_PER_PAGE);
            ps.setInt(3, MAX_ENTRIES_PER_PAGE);
            try (ResultSet rs = ps.executeQuery()) {
                return createBookings(rs);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting user's bookings", e);
        }
    }

    @Override
    public void deleteBookingById(Integer bookingId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_BOOKING_BY_ID)) {
            ps.setInt(1, bookingId);
            ps.executeUpdate();
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during deleting booking by id = " + bookingId, e);
        }
    }

    @Override
    public void bookRoom(Booking booking) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(INSERT_BOOKING)) {
            ps.setInt(1, booking.getUserId());
            ps.setInt(2, booking.getGuestroomId());
            ps.setBigDecimal(3, booking.getNightPrice());
            ps.setDate(4, Date.valueOf(booking.getStartDay()));
            ps.setDate(5, Date.valueOf(booking.getLastDay()));
            ps.setDate(6, Date.valueOf(booking.getBookDay().toString()));
            ps.setBigDecimal(7, booking.getFinalCost());
            ps.executeUpdate();
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during inserting booking into db", e);
        }
    }

    @Override
    public void payBooking(int bookingId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_BOOKINGS_SET_PAYED)) {
            ps.setInt(1, bookingId);
            ps.executeUpdate();
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during set booking payed with id = " + bookingId, e);
        }
    }

    @Override
    public Booking getBookingById(int id) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_BOOKING_BY_ID)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                return createBooking(rs);
            }
        } catch (SQLException e) {
            throw new DAOException("error during getting bookings by id = " + id, e);
        }
    }

    private List<Booking> createBookings(ResultSet rs) throws SQLException {
        List<Booking> bookings = new ArrayList<>();
        while (rs.next()) {
            bookings.add(createBooking(rs));
        }
        return bookings;
    }

    private Booking createBooking(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setId(rs.getInt(1));
        booking.setGuestroomId(rs.getInt(2));
        booking.setNightPrice(rs.getBigDecimal(3));
        booking.setStartDay(rs.getDate(4).toLocalDate());
        booking.setLastDay(rs.getDate(5).toLocalDate());
        booking.setPayed(rs.getInt(6));
        booking.setBookDay(rs.getDate(7).toLocalDate());
        booking.setFinalCost(rs.getBigDecimal(8));
        booking.setNightsCount(Period.between(booking.getStartDay(), booking.getLastDay()).getDays());
        booking.setUserId(rs.getInt(9));
        return booking;
    }

    @Override
    protected String getTableName() {
        return BOOKINGS;
    }

}
