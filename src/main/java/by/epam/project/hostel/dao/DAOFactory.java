package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.impl.BookingDAOImpl;
import by.epam.project.hostel.dao.impl.CommentDAOImpl;
import by.epam.project.hostel.dao.impl.GuestroomDAOImpl;
import by.epam.project.hostel.dao.impl.HostelDAOImpl;
import by.epam.project.hostel.dao.impl.UserDAOImpl;

public class DAOFactory {
    private final static DAOFactory instance = new DAOFactory();

    private UserDAO userDAO;
    private HostelDAO hostelDAO;
    private GuestroomDAO guestroomDAO;
    private BookingDAO bookingDAO;
    private CommentDAO commentDAO;

    private DAOFactory() {
        userDAO = new UserDAOImpl();
        userDAO.setSingleton();
        hostelDAO = new HostelDAOImpl();
        hostelDAO.setSingleton();
        guestroomDAO = new GuestroomDAOImpl();
        guestroomDAO.setSingleton();
        bookingDAO = new BookingDAOImpl();
        bookingDAO.setSingleton();
        commentDAO = new CommentDAOImpl();
        commentDAO.setSingleton();
    }

    public static DAOFactory getInstance() {
        return instance;
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public HostelDAO getHostelDAO() {
        return hostelDAO;
    }

    public GuestroomDAO getGuestroomDAO() {
        return guestroomDAO;
    }

    public BookingDAO getBookingDAO() {
        return bookingDAO;
    }

    public CommentDAO getCommentDAO() {
        return commentDAO;
    }

    public HostelDAO createHostelDAO() {
        HostelDAOImpl hostelDAO = new HostelDAOImpl();
        hostelDAO.setTransactional();
        return hostelDAO;
    }

    public UserDAO createUserDAO() {
        UserDAOImpl userDAO = new UserDAOImpl();
        userDAO.setTransactional();
        return userDAO;
    }

    public GuestroomDAO createGuestroomDAO() {
        GuestroomDAOImpl guestroomDAO = new GuestroomDAOImpl();
        guestroomDAO.setTransactional();
        return guestroomDAO;
    }

    public CommentDAO createCommentDAO() {
        CommentDAOImpl commentDAO = new CommentDAOImpl();
        commentDAO.setTransactional();
        return commentDAO;
    }

    public BookingDAO createBookingDAO() {
        BookingDAOImpl bookingDAO = new BookingDAOImpl();
        bookingDAO.setTransactional();
        return bookingDAO;
    }

}


