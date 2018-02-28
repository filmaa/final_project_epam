package by.epam.project.hostel.controller;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.command.impl.ChangeLocalCommand;
import by.epam.project.hostel.controller.command.impl.booking.BookRoomCommand;
import by.epam.project.hostel.controller.command.impl.booking.DeleteBookingByIdCommand;
import by.epam.project.hostel.controller.command.impl.booking.GetBookingDetailsCommand;
import by.epam.project.hostel.controller.command.impl.booking.GetBookingsCommand;
import by.epam.project.hostel.controller.command.impl.booking.GetUserBookingsCommand;
import by.epam.project.hostel.controller.command.impl.booking.PayBookingCommand;
import by.epam.project.hostel.controller.command.impl.comment.AddCommentCommand;
import by.epam.project.hostel.controller.command.impl.comment.DeleteCommentByIdCommand;
import by.epam.project.hostel.controller.command.impl.comment.GetGuestroomCommentsCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.AddGuestroomCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.AddPicturesGuestroomCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.DeleteGuestroomByIdCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.DeleteGuestroomPictureCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.EditGuestroomCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.GetGuestroomCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.GetGuestroomDescriptionsCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.GetGuestroomsCommand;
import by.epam.project.hostel.controller.command.impl.guestroom.GetRequiredGuestroomsCommand;
import by.epam.project.hostel.controller.command.impl.hostel.AddHostelCommand;
import by.epam.project.hostel.controller.command.impl.hostel.DeleteHostelByIdCommand;
import by.epam.project.hostel.controller.command.impl.hostel.EditHostelCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelNameByGuestroomIdCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelWithDescriptionsCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelsCitiesCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelsCommand;
import by.epam.project.hostel.controller.command.impl.hostel.GetHostelsNameCommand;
import by.epam.project.hostel.controller.command.impl.user.EditRoleBanUserCommand;
import by.epam.project.hostel.controller.command.impl.user.EditUserCommand;
import by.epam.project.hostel.controller.command.impl.user.GetUserByIdCommand;
import by.epam.project.hostel.controller.command.impl.user.GetUsersCommand;
import by.epam.project.hostel.controller.command.impl.user.LoginAdminCommand;
import by.epam.project.hostel.controller.command.impl.user.LoginCommand;
import by.epam.project.hostel.controller.command.impl.user.LogoutCommand;
import by.epam.project.hostel.controller.command.impl.user.RegistrationCommand;

public class CommandFactory {

    private static final String LOGIN_COMMAND = "login-command";
    private static final String REGISTRATION_COMMAND = "registration-command";
    private static final String CHANGE_LOCAL_COMMAND = "change-local-command";
    private static final String LOGIN_ADMIN_COMMAND = "login-admin-command";
    private static final String LOGOUT_COMMAND = "logout-command";
    private static final String EDIT_USER_COMMAND = "edit-role-ban-user-command";
    private static final String GET_USERS_COMMAND = "get-users-command";
    private static final String VIEW_HOSTEL_COMMAND = "view-hostel-command";
    private static final String GET_USER_BOOKINGS_COMMAND = "get-user-bookings-command";
    private static final String VIEW_GUESTROOM_COMMAND = "view-guestroom-command";
    private static final String GET_DESIRED_GUESTROOMS_COMMAND = "get-required-guestrooms-command";
    private static final String GET_HOSTELS_COMMAND = "get-hostels-command";
    private static final String BOOKING_ROOM_COMMAND = "booking-room-command";
    private static final String GET_HOTELS_COMMAND = "get-hotels-command";
    private static final String DELETE_HOSTEL_BY_ID_COMMAND = "delete-hostel-by-id-command";
    private static final String GET_GUESTROOMS_COMMAND = "get-guestrooms-command";
    private static final String GET_HOSTELS_NAMES_COMMAND = "get-hostels-names-command";
    private static final String DELETE_GUESTROOM_COMMAND = "delete-guestroom-command";
    private static final String GET_HOSTELS_CITIES_COMMAND = "get-hostels-cities-command";
    private static final String ADD_GUESTROOM_COMMAND = "add-guestroom-command";
    private static final String GET_GUESTROOM_BY_ID_COMMAND = "get-guestroom-by-id-command";
    private static final String EDIT_GUESTROOM_COMMAND = "edit-guestroom-command";
    private static final String GET_GUESTROOM_DESCRIPTIONS_COMMAND = "get-guestroom-descriptions-command";
    private static final String GET_HOSTEL_NAME_BY_ID_COMMAND = "get-hostel-name-by-id-command";
    private static final String ADD_PICTURE_GUESTROOM_COMMAND = "add-picture-guestroom-command";
    private static final String GET_HOSTEL_WITH_DESCRIPTIONS_COMMAND = "get-hostel-with-descriptions-command";
    private static final String DELETE_GUESTROOM_IMG_COMMAND = "delete-guestroom-img-command";
    private static final String ADD_HOSTEL_COMMAND = "add-hostel-command";
    private static final String EDIT_HOSTEL_COMMAND = "edit-hostel-command";
    private static final String GET_BOOKING_DETAILS_COMMAND = "get-booking-details-command";
    private static final String DELETE_BOOKING_BY_ID_COMMAND = "delete-booking-by-id-command";
    private static final String PAY_BOOKING_COMMAND = "pay-booking-command";
    private static final String EDIT_USER_COMMAND1 = "edit-user-command";
    private static final String GET_GUESTROOM_COMMENTS_COMMAND = "get-guestroom-comments-command";
    private static final String GET_USER_BY_ID_COMMAND = "get-user-by-id-command";
    private static final String ADD_COMMENT_COMMAND = "add-comment-command";
    private static final String DELETE_COMMENT_BY_ID_COMMAND = "delete-comment-by-id-command";
    private static final String GET_BOOKINS_COMMAND = "get-bookins-command";

    private static CommandFactory instance = null;

    private CommandFactory() {
    }

    public static CommandFactory getInstance() {
        if (instance == null) {
            instance = new CommandFactory();
        }
        return instance;
    }

    public Command getCommand(String commandName) {
        switch (commandName) {
            case LOGIN_COMMAND:
                return new LoginCommand();
            case REGISTRATION_COMMAND:
                return new RegistrationCommand();
            case CHANGE_LOCAL_COMMAND:
                return new ChangeLocalCommand();
            case LOGIN_ADMIN_COMMAND:
                return new LoginAdminCommand();
            case LOGOUT_COMMAND:
                return new LogoutCommand();
            case EDIT_USER_COMMAND:
                return new EditRoleBanUserCommand();
            case GET_USERS_COMMAND:
                return new GetUsersCommand();
            case VIEW_HOSTEL_COMMAND:
                return new GetHostelCommand();
            case GET_USER_BOOKINGS_COMMAND:
                return new GetUserBookingsCommand();
            case VIEW_GUESTROOM_COMMAND:
                return new GetGuestroomCommand();
            case GET_DESIRED_GUESTROOMS_COMMAND:
                return new GetRequiredGuestroomsCommand();
            case GET_HOSTELS_COMMAND:
                return new GetHostelsCommand();
            case BOOKING_ROOM_COMMAND:
                return new BookRoomCommand();
            case GET_HOTELS_COMMAND:
                return new GetHostelsCommand();
            case DELETE_HOSTEL_BY_ID_COMMAND:
                return new DeleteHostelByIdCommand();
            case GET_GUESTROOMS_COMMAND:
                return new GetGuestroomsCommand();
            case GET_HOSTELS_NAMES_COMMAND:
                return new GetHostelsNameCommand();
            case DELETE_GUESTROOM_COMMAND:
                return new DeleteGuestroomByIdCommand();
            case GET_HOSTELS_CITIES_COMMAND:
                return new GetHostelsCitiesCommand();
            case ADD_GUESTROOM_COMMAND:
                return new AddGuestroomCommand();
            case EDIT_GUESTROOM_COMMAND:
                return new EditGuestroomCommand();
            case GET_GUESTROOM_BY_ID_COMMAND:
                return new GetGuestroomCommand();
            case GET_GUESTROOM_DESCRIPTIONS_COMMAND:
                return new GetGuestroomDescriptionsCommand();
            case GET_HOSTEL_NAME_BY_ID_COMMAND:
                return new GetHostelNameByGuestroomIdCommand();
            case ADD_PICTURE_GUESTROOM_COMMAND:
                return new AddPicturesGuestroomCommand();
            case DELETE_GUESTROOM_IMG_COMMAND:
                return new DeleteGuestroomPictureCommand();
            case GET_HOSTEL_WITH_DESCRIPTIONS_COMMAND:
                return new GetHostelWithDescriptionsCommand();
            case EDIT_HOSTEL_COMMAND:
                return new EditHostelCommand();
            case ADD_HOSTEL_COMMAND:
                return new AddHostelCommand();
            case GET_BOOKING_DETAILS_COMMAND:
                return new GetBookingDetailsCommand();
            case DELETE_BOOKING_BY_ID_COMMAND:
                return new DeleteBookingByIdCommand();
            case PAY_BOOKING_COMMAND:
                return new PayBookingCommand();
            case EDIT_USER_COMMAND1:
                return new EditUserCommand();
            case GET_GUESTROOM_COMMENTS_COMMAND:
                return new GetGuestroomCommentsCommand();
            case GET_USER_BY_ID_COMMAND:
                return new GetUserByIdCommand();
            case ADD_COMMENT_COMMAND:
                return new AddCommentCommand();
            case DELETE_COMMENT_BY_ID_COMMAND:
                return new DeleteCommentByIdCommand();
            case GET_BOOKINS_COMMAND:
                return new GetBookingsCommand();
        }
        return null;
    }
}
