package by.epam.project.hostel.controller.constant;

public final class Constant {
    public static final String URL = "url";
    public static final String MESSAGE = "message";
    public static final String ERROR_JSP = "/error.jsp";

    private Constant() {
    }


    public class Exception {
        public static final String ERROR_USER_NOT_LOGGED = "errorParam";
        public static final String ERROR = "error";
        public static final String TRUE = "true";
        public static final String FALSE = "false";

        private Exception() {
        }
    }

    public class Success {
        public static final String SUCCESS = "success";

        private Success() {
        }
    }

    public class User {
        public static final String NOT_BANNED = "0";
        public static final String ID = "id";
        public static final String ROLE = "role";
        public static final String BANNED = "banned";
        public static final String NAME = "name";
        public static final String SURNAME = "surname";
        public static final String LOGIN = "login";
        public static final String PASSWORD = "password";
        public static final String EMAIL = "email";
        public static final String NUMBER = "number";
        public static final String USER = "user";

        private User() {
        }
    }

    public class Hostel {

        public static final String NAME = "name";
        public static final String NAMES = "names";
        public static final String STARS = "stars";
        public static final String COUNTRY_RU = "countryRu";
        public static final String DESCRIPTION_RU = "descriptionRu";
        public static final String ADDRESS_RU = "addressRu";
        public static final String CITY_RU = "cityRu";
        public static final String COUNTRY_EN = "countryEn";
        public static final String DESCRIPTION_EN = "descriptionEn";
        public static final String ADDRESS_EN = "addressEn";
        public static final String CITY_EN = "cityEn";
        public static final String HOSTEL = "hostel";
        public static final String HOSTELS = "hostels";
        public static final String ID = "id";
        public static final String CITIES = "cities";
        public static final String HOSTEL_NAME = "hostelName";

        private Hostel() {
        }

    }

    public class Page {

        public static final String BLOCK_PAGE_JSP = "/block_page.jsp";
        public static final String REGISTRATION_JSP = "registration.jsp";
        public static final String PAGE = "page";
        public static final String LOCAL = "local";
        public static final String CURRENT_PAGE = "page";
        public static final String ADMIN_ADMIN_USERS = "/admin/admin_users";
        public static final String INDEX_JSP = "index.jsp";
        public static final String ADMIN_ENTRY = "admin/admin_entry";
        public static final String ADMIN_SIGN_IN = "admin_sign_in.jsp";
        public static final String LOGIN_JSP = "login.jsp";
        public static final String SEARCH_JSP = "search.jsp";

        private Page() {
        }


    }

    public class Language {
        public static final String RU = "ru";
        public static final String EN = "en";

        private Language() {
        }
    }


    public class Guestroom {
        public static final String ID = "id";
        public static final String GUESTROOM = "guestroom";
        public static final String SORT = "sort";

        public static final String HOSTEL_ID = "hostelId";
        public static final String NIGHT_PRICE = "nightPrice";
        public static final String TV = "tv";
        public static final String WIFI = "wifi";
        public static final String BATH = "bath";
        public static final String CAPACITY = "capacity";
        public static final String IMG_PATH = "imgPath";

        public static final String DESCRIPTION_RU = "descriptionRu";
        public static final String DESCRIPTION_EN = "descriptionEn";

        public static final String GUESTROOMS = "guestrooms";


    }

    public class SearchParams {
        public static final String NIGHT_PRICE_FROM = "priceFrom";
        public static final String NIGHT_PRICE_TO = "priceTo";
        public static final String DATE_FROM = "dateFrom";
        public static final String DATE_TO = "dateTo";
        public static final String WIFI = "wifi";
        public static final String TV = "tv";
        public static final String SHOWER = "shower";
        public static final String CAPACITY_FROM = "capacityFrom";
        public static final String CAPACITY_TO = "capacityTo";
        public static final String CITY = "city";
        public static final String SEARCH = "search";
    }

    public class Booking {
        public static final String ID = "id";
        public static final String BOOKING = "booking";
        public static final String NIGHT_PRICE = "nightPrice";
        public static final String START_DATE = "startDay";
        public static final String LAST_DATE = "lastDay";
        public static final String GUESTROOM_ID = "guestroomId";
        public static final String PAYED = "payed";
        public static final String BOOK_DAY = "bookDay";
        public static final String FINAL_COST = "finalCost";
        public static final String USER_ID = "userId";
        public static final String NIGHTS_COUNT = "nightsCount";

        private Booking() {
        }
    }

    public class Comment {
        public static final String RATE = "rate";
        public static final String COMMENT = "comment";
        public static final String COMMENTS = "comments";
        public static final String ID = "id";

        private Comment() {
        }
    }
}
