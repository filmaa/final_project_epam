package by.epam.project.hostel.dao.db.transaction;

import by.epam.project.hostel.dao.exception.DAOException;

public interface Transaction {
    void commit() throws DAOException;

    void rollback() throws DAOException;

    void endTransaction() throws DAOException;
}
