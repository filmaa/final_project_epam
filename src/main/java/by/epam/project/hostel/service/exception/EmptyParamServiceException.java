package by.epam.project.hostel.service.exception;

public class EmptyParamServiceException extends ValidationException {
    public EmptyParamServiceException() {
    }

    public EmptyParamServiceException(String message) {
        super(message);
    }

    public EmptyParamServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public EmptyParamServiceException(Throwable cause) {
        super(cause);
    }
}
