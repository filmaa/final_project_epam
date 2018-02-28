package by.epam.project.hostel.controller.exception;

public class ConnectionPoolNotInitializedRuntimeException extends RuntimeException {
    public ConnectionPoolNotInitializedRuntimeException() {
    }

    public ConnectionPoolNotInitializedRuntimeException(String message) {
        super(message);
    }

    public ConnectionPoolNotInitializedRuntimeException(String message, Throwable cause) {
        super(message, cause);
    }

    public ConnectionPoolNotInitializedRuntimeException(Throwable cause) {
        super(cause);
    }
}
