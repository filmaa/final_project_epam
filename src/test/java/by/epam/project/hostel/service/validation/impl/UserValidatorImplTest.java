package by.epam.project.hostel.service.validation.impl;

import by.epam.project.hostel.service.exception.ValidationException;
import org.junit.Test;

public class UserValidatorImplTest {

    @Test
    public void validatePassword() {
        UserValidatorImpl userValidator = new UserValidatorImpl();
        try {
            System.out.println(userValidator.validatePassword("2345"));
        } catch (ValidationException e) {
            e.printStackTrace();
        }
    }
}