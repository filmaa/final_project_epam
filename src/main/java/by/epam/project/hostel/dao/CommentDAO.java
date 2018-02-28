package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Comment;

import java.util.List;

public interface CommentDAO extends EntityDAO {
    List<Comment> getCommentsByRoomId(Integer guestroomId) throws DAOException;

    List<Comment> getCommentsByHostelId(Integer hostelId) throws DAOException;

    void addComment(Comment comment) throws DAOException;

    void deleteCommentById(Integer commentId) throws DAOException;

    void deleteCommentsByGuestroomId(Integer guestroomId) throws DAOException;

    void deleteCommentsByHostelId(Integer hostelId) throws DAOException;
}
