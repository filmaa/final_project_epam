package by.epam.project.hostel.service.validation.impl;

import by.epam.project.hostel.entity.Comment;
import by.epam.project.hostel.service.exception.EmptyParamServiceException;
import by.epam.project.hostel.service.exception.ValidationException;
import by.epam.project.hostel.service.validation.Validator;

import java.time.LocalDate;

public class CommentValidatorImpl implements Validator<Comment> {

    public Comment validate(Comment comment) throws ValidationException {
        if (comment == null) {
            throw new EmptyParamServiceException("comment is empty");
        }
        validateID(comment.getGuestroomId());
        validateID(comment.getUserId());
        validate(comment.getComment());
        validateDate(comment.getCommentDate());
        return comment;
    }

    public void validateDate(LocalDate date) throws EmptyParamServiceException {
        if (date == null) {
            throw new EmptyParamServiceException("date is empty");
        }
    }

    public void validateRate(Integer rate) throws ValidationException {
        if (rate == null) {
            throw new EmptyParamServiceException("rate is null");
        }
        if (rate > 5 || rate < 1) {
            throw new ValidationException("invalid rate value, rate = " + rate);
        }
    }
}
