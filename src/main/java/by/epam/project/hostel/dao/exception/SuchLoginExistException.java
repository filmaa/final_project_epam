package by.epam.project.hostel.dao.exception;

public class SuchLoginExistException extends DAOException {
    public SuchLoginExistException() {
    }

    public SuchLoginExistException(String message) {
        super(message);
    }

    public SuchLoginExistException(String message, Throwable cause) {
        super(message, cause);
    }

    public SuchLoginExistException(Throwable cause) {
        super(cause);
    }
}
