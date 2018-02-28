package by.epam.project.hostel.dao.exception;

public class NoDBDriverFound extends DAOException {
    public NoDBDriverFound() {
    }

    public NoDBDriverFound(String message) {
        super(message);
    }

    public NoDBDriverFound(String message, Throwable cause) {
        super(message, cause);
    }

    public NoDBDriverFound(Throwable cause) {
        super(cause);
    }
}
