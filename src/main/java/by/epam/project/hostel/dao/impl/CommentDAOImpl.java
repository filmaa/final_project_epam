package by.epam.project.hostel.dao.impl;

import by.epam.project.hostel.dao.BaseDAO;
import by.epam.project.hostel.dao.CommentDAO;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Comment;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImpl extends BaseDAO implements CommentDAO {

    private static final String SELECT_COMMENTS_BY_ROOM_ID = "SELECT id,comment,date,rate,user_id FROM comments WHERE guestrooms_id =?;";
    private static final String SELECT_COMMENTS_BY_HOSTEL_ID = "SELECT   comments.id,  comment,  date,  rate,user_id FROM comments  INNER JOIN guestrooms g ON comments.guestrooms_id = g.id  INNER JOIN hostel h ON g.hostel_id = h.id WHERE h.id = ?";
    private static final String INSERT_COMMENT = "INSERT comments(guestrooms_id, user_id, comment, date) VALUES (?,?,?,?);";
    private static final String DELETE_COMMENT_BY_ID = "DELETE FROM comments WHERE id = ?";
    private static final String DELETE_PICTURES_BY_HOSTEL_ID = "DELETE p FROM picture p INNER JOIN guestrooms g ON p.guestrooms_id = g.id  INNER JOIN hostel h ON g.hostel_id = h.id WHERE h.id = ?";
    private static final String DELETE_COMMENTS_BY_ROOM_ID = "DELETE FROM comments WHERE guestrooms_id = ?";
    private static final String COMMENTS = "comments";

    @Override
    public List<Comment> getCommentsByRoomId(Integer guestroomId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_COMMENTS_BY_ROOM_ID)) {
            ps.setInt(1, guestroomId);
            return createCommentsList(ps);
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting comments by room id = " + guestroomId, e);
        }
    }

    @Override
    public List<Comment> getCommentsByHostelId(Integer hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_COMMENTS_BY_HOSTEL_ID)) {
            ps.setInt(1, hostelId);
            return createCommentsList(ps);
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting comments by hostel id = " + hostelId, e);
        }
    }

    @Override
    public void addComment(Comment comment) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(INSERT_COMMENT)) {
            ps.setInt(1, comment.getGuestroomId());
            ps.setInt(2, comment.getUserId());
            ps.setString(3, comment.getComment());
            ps.setDate(4, Date.valueOf(comment.getCommentDate()));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during inserting comment in db", e);
        }
    }

    @Override
    public void deleteCommentById(Integer commentId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_COMMENT_BY_ID)) {
            ps.setInt(1, commentId);
            ps.executeUpdate();
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during delete comment by id = " + commentId, e);
        }
    }

    @Override
    public void deleteCommentsByGuestroomId(Integer guestroomId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_COMMENTS_BY_ROOM_ID)) {
            ps.setInt(1, guestroomId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during delete comments", e);
        }

    }

    @Override
    public void deleteCommentsByHostelId(Integer hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_PICTURES_BY_HOSTEL_ID)) {
            ps.setInt(1, hostelId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during delete comments by hostel id", e);
        }
    }

    private List<Comment> createCommentsList(PreparedStatement ps) throws SQLException {
        try (ResultSet rs = ps.executeQuery()) {
            List<Comment> comments = new ArrayList<>();
            while (rs.next()) {
                comments.add(createComment(rs));
            }
            return comments;
        }
    }

    private Comment createComment(ResultSet rs) throws SQLException {
        Comment comment = new Comment();
        comment.setId(rs.getInt(1));
        comment.setComment(rs.getString(2));
        comment.setCommentDate(LocalDate.parse(rs.getString(3)));
        comment.setRate(rs.getInt(4));
        comment.setUserId(rs.getInt(5));
        return comment;
    }

    /**
     * @return
     */
    @Override
    protected String getTableName() {
        return COMMENTS;
    }
}
