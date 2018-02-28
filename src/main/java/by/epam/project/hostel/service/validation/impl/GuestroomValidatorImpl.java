package by.epam.project.hostel.service.validation.impl;

import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.service.exception.EmptyParamServiceException;
import by.epam.project.hostel.service.exception.ValidationException;
import by.epam.project.hostel.service.validation.Validator;

public class GuestroomValidatorImpl implements Validator<Guestroom> {


    @Override
    public Guestroom validate(Guestroom guestroom) throws ValidationException {
        if (guestroom == null) {
            throw new EmptyParamServiceException("guestroom is empty");
        }
        if (guestroom.getNightPrice().doubleValue() < 0) {
            throw new ValidationException("night price has incorrect value = " + guestroom.getNightPrice());
        }
        if (guestroom.getCapacity() < 1) {
            throw new ValidationException("room capacity cannot by less then 1, capacity = " + guestroom.getCapacity());
        }
        return guestroom;
    }
}

