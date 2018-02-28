package by.epam.project.hostel.service;

import by.epam.project.hostel.entity.Comment;
import by.epam.project.hostel.service.exception.ServiceException;

import java.util.List;

public interface CommentService extends EntityService {
    List<Comment> getCommentsByRoomId(Integer guestroomId) throws ServiceException;

    List<Comment> getCommentsByHostelId(Integer hostelId) throws ServiceException;

    void addComment(Comment comment) throws ServiceException;

    void deleteCommentById(Integer commentId) throws ServiceException;
}
