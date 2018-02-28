package by.epam.project.hostel.service.validation.impl;

import by.epam.project.hostel.entity.Booking;
import by.epam.project.hostel.service.exception.EmptyParamServiceException;
import by.epam.project.hostel.service.exception.ValidationException;
import by.epam.project.hostel.service.validation.Validator;

import java.time.LocalDate;

public class BookingValidatorImpl implements Validator<Booking> {
    @Override
    public Booking validate(Booking entity) throws ValidationException {
        if (entity == null) {
            throw new EmptyParamServiceException("booking is empty");
        }
        validateID(entity.getGuestroomId());
        validateID(entity.getUserId());
        if (entity.getStartDay() == null || entity.getLastDay() == null) {
            throw new EmptyParamServiceException("last day of start day cannot be null");
        }
        validateDates(entity.getStartDay(), entity.getLastDay());
        return entity;

    }

    public void validateDates(LocalDate startDay, LocalDate lastDay) throws ValidationException {
        if (startDay.isAfter(lastDay)) {
            throw new ValidationException("start day can not be after last day");
        }
    }
}
