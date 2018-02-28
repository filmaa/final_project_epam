package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;

import java.sql.Connection;

public interface EntityDAO {
    int getTotalRowCount() throws DAOException;

    void setConnection(Connection connection);

    boolean isTransactional();

    void setTransactional();

    void setSingleton();
}
