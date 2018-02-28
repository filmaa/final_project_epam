package by.epam.project.hostel.service.exception;

public class ServiceInitException extends ServiceException {
    public ServiceInitException() {
    }

    public ServiceInitException(String message) {
        super(message);
    }

    public ServiceInitException(String message, Throwable cause) {
        super(message, cause);
    }

    public ServiceInitException(Throwable cause) {
        super(cause);
    }
}
