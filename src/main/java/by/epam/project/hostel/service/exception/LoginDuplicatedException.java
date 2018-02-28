package by.epam.project.hostel.service.exception;

public class LoginDuplicatedException extends ServiceException {
    private String errorParam;

    public LoginDuplicatedException() {
    }

    public LoginDuplicatedException(String message) {
        super(message);
    }

    public LoginDuplicatedException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginDuplicatedException(Throwable cause) {
        super(cause);
    }

    public LoginDuplicatedException(String message, Throwable e, String errorParam) {
        super(message, e);
        this.errorParam = errorParam;
    }

    public String getErrorParam() {
        return errorParam;
    }
}
