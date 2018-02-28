package by.epam.project.hostel.service.validation.impl;

import by.epam.project.hostel.entity.Hostel;
import by.epam.project.hostel.service.exception.ValidationException;
import by.epam.project.hostel.service.validation.Validator;

public class HostelValidatorImpl implements Validator<Hostel> {


    @Override
    public Hostel validate(Hostel hostel) throws ValidationException {

        validate(hostel.getAddress(), hostel.getCity(), hostel.getCountry(), hostel.getDescription(), hostel.getImgPath(), hostel.getName());

        if (hostel.getStars() > 5 || hostel.getStars() < 1) {
            throw new ValidationException("not correct count of stars = " + hostel.getStars());
        }
        return hostel;
    }
}
