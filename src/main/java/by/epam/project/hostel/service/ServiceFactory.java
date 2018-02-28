package by.epam.project.hostel.service;

import by.epam.project.hostel.service.impl.BookingServiceImpl;
import by.epam.project.hostel.service.impl.CommentServiceImpl;
import by.epam.project.hostel.service.impl.GuestroomServiceImpl;
import by.epam.project.hostel.service.impl.HostelServiceImpl;
import by.epam.project.hostel.service.impl.UserServiceImpl;

public class ServiceFactory {
    private static final ServiceFactory instance = new ServiceFactory();

    private UserService userService = new UserServiceImpl();
    private HostelService hostelService = new HostelServiceImpl();
    private GuestroomService guestroomService = new GuestroomServiceImpl();
    private BookingService bookingService = new BookingServiceImpl();
    private CommentService commentService = new CommentServiceImpl();


    private ServiceFactory() {
    }

    public static ServiceFactory getInstance() {
        return instance;
    }

    public UserService getUserService() {
        return userService;
    }

    public HostelService getHostelService() {
        return hostelService;
    }

    public GuestroomService getGuestroomService() {
        return guestroomService;
    }

    public BookingService getBookingService() {
        return bookingService;
    }

    public CommentService getCommentService() {
        return commentService;
    }
}
