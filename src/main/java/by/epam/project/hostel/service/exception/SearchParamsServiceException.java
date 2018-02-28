package by.epam.project.hostel.service.exception;

public class SearchParamsServiceException extends ServiceException {
    private String param;

    public SearchParamsServiceException() {
    }

    public SearchParamsServiceException(String message) {
        super(message);
    }

    public SearchParamsServiceException(String message, String errorParam) {
        super(message);
        this.param = errorParam;
    }

    public SearchParamsServiceException(String message, Throwable cause) {
        super(message, cause);
    }

    public SearchParamsServiceException(String message, Throwable cause, String errorParam) {
        super(message, cause);
        this.param = errorParam;
    }

    public SearchParamsServiceException(Throwable cause) {
        super(cause);
    }

    public void addExceptionParam(String errorParam) {
        param = errorParam;
    }

    public String getParam() {
        return param;
    }
}
