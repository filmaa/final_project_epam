package by.epam.project.hostel.dao.db.transaction;

import by.epam.project.hostel.dao.exception.DAOException;

import java.sql.Connection;
import java.sql.SQLException;

public class TransactionImpl implements Transaction {

    private Connection connection;

    TransactionImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void commit() throws DAOException {
        try {
            connection.commit();
        } catch (SQLException e) {
            throw new DAOException("error during commit transaction", e);
        }
    }

    @Override
    public void rollback() throws DAOException {
        try {
            connection.rollback();
        } catch (SQLException e) {
            throw new DAOException("error during rollback", e);
        }
    }

    @Override
    public void endTransaction() throws DAOException {
        try {
            connection.setAutoCommit(true);
            connection.close();
        } catch (SQLException e) {
            throw new DAOException("error during end transaction", e);
        }
    }
}
