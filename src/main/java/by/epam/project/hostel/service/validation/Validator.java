package by.epam.project.hostel.service.validation;

import by.epam.project.hostel.service.exception.EmptyParamServiceException;
import by.epam.project.hostel.service.exception.SearchParamsServiceException;
import by.epam.project.hostel.service.exception.ValidationException;

public interface Validator<T> {

    T validate(T entity) throws ValidationException, SearchParamsServiceException;

    default void validate(String... params) throws EmptyParamServiceException {
        if (params != null) {
            for (String parm : params) {
                if (parm == null || parm.isEmpty()) {
                    throw new EmptyParamServiceException("empty param" + parm);
                }
            }
        } else {
            throw new EmptyParamServiceException("not contains params");
        }
    }

    default void validateID(int id) throws ValidationException {
        if (id < 0) {
            throw new ValidationException("error during validation id: " + id);
        }
    }

    default void validateCurrentPage(int currentPage) throws ValidationException {
        if (currentPage < 1) {
            throw new ValidationException("error during validation currentPage: " + currentPage);
        }
    }
}
