package by.epam.project.hostel.dao.db.transaction;

import by.epam.project.hostel.dao.EntityDAO;
import by.epam.project.hostel.dao.db.connection.ConnectionProvider;
import by.epam.project.hostel.dao.exception.DAOException;

import java.sql.Connection;
import java.sql.SQLException;

public class TransactionManagerImpl implements TransactionManager {

    @Override
    public Transaction beginTransaction(EntityDAO... daos) throws DAOException {
        Connection connection = ConnectionProvider.getInstance().takeConnection();
        try {
            connection.setAutoCommit(false);
            for (EntityDAO dao : daos) {
                if (!dao.isTransactional()) {
                    throw new IllegalArgumentException("Not transactional dao!");//TODO exception
                }
                dao.setConnection(connection);
            }
            return new TransactionImpl(connection);
        } catch (SQLException e) {
            throw new DAOException("error during begin transaction", e);
        }
    }

}
