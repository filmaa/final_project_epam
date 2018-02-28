package by.epam.project.hostel.service.impl;

import by.epam.project.hostel.dao.db.transaction.TransactionManager;
import by.epam.project.hostel.dao.db.transaction.TransactionManagerImpl;

public abstract class BaseService {
    protected static final TransactionManager transactionManager = new TransactionManagerImpl();
}
