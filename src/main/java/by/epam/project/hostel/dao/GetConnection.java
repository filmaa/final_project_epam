package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.ConnectionPoolException;

import java.sql.Connection;

public interface GetConnection {
    Connection connection() throws ConnectionPoolException;
}
