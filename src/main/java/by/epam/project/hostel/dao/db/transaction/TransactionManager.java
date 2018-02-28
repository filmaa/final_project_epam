package by.epam.project.hostel.dao.db.transaction;

import by.epam.project.hostel.dao.EntityDAO;
import by.epam.project.hostel.dao.exception.DAOException;

public interface TransactionManager {
    Transaction beginTransaction(EntityDAO... daos) throws DAOException;
}
