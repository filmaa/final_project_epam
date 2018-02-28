package by.epam.project.hostel.entity;

import java.io.Serializable;
import java.time.LocalDate;

public class Comment extends Entity implements Serializable {
    private static final long serialVersionUID = -8053748141053902283L;

    private int userId;
    private int guestroomId;
    private String comment;
    private LocalDate commentDate;
    private int rate;

    public Comment() {
    }

    public Comment(int userId, int guestroomId, String comment, LocalDate commentDate) {
        this.userId = userId;
        this.guestroomId = guestroomId;
        this.comment = comment;
        this.commentDate = commentDate;
    }

    public Comment(int userId, int guestroomId, String comment, LocalDate commentDate, int rate) {
        this.userId = userId;
        this.guestroomId = guestroomId;
        this.comment = comment;
        this.commentDate = commentDate;
        this.rate = rate;
    }

    public Comment(int id, int userId, int guestroomId, String comment, LocalDate commentDate, int rate) {
        this.id = id;
        this.userId = userId;
        this.guestroomId = guestroomId;
        this.comment = comment;
        this.commentDate = commentDate;
        this.rate = rate;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getUserId();
        result = 31 * result + getGuestroomId();
        result = 31 * result + (getComment() != null ? getComment().hashCode() : 0);
        result = 31 * result + (getCommentDate() != null ? getCommentDate().hashCode() : 0);
        result = 31 * result + getRate();
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Comment comment1 = (Comment) o;

        if (getId() != comment1.getId()) {
            return false;
        }
        if (getUserId() != comment1.getUserId()) {
            return false;
        }
        if (getGuestroomId() != comment1.getGuestroomId()) {
            return false;
        }
        if (getRate() != comment1.getRate()) {
            return false;
        }
        if (getComment() != null ? !getComment().equals(comment1.getComment()) : comment1.getComment() != null) {
            return false;
        }
        return getCommentDate() != null ? getCommentDate().equals(comment1.getCommentDate()) : comment1.getCommentDate() == null;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGuestroomId() {
        return guestroomId;
    }

    public void setGuestroomId(int guestroomId) {
        this.guestroomId = guestroomId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDate getCommentDate() {
        return commentDate;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public void setCommentDate(LocalDate commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", guestroomId=" + guestroomId +
                ", comment='" + comment + '\'' +
                ", commentDate=" + commentDate +
                ", rate=" + rate +
                '}';
    }
}
