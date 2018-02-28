package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.db.connection.ConnectionProvider;
import by.epam.project.hostel.dao.exception.DAOException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class BaseDAO implements by.epam.project.hostel.dao.EntityDAO {

    private static final ConnectionProvider connectionProvider = ConnectionProvider.getInstance();

    private Connection connection;

    protected GetConnection provider;

    private boolean isTransactional = true;

    public int getTotalRowCount() throws DAOException {
        String selectCount = "SELECT COUNT(*) FROM " + getTableName();
        try (Connection connection = provider.connection();
             Statement ps = connection.createStatement();
             ResultSet rs = ps.executeQuery(selectCount)) {
            rs.next();
            return rs.getInt(1);

        } catch (SQLException e) {
            throw new DAOException("Error during getting total count from table " + getTableName(), e);
        }
    }

    @Override
    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public boolean isTransactional() {
        return isTransactional;
    }

    public void setTransactional() {
        provider = this::connection;
        isTransactional = true;
    }

    public void setSingleton() {
        provider = connectionProvider::takeConnection;
        isTransactional = false;
    }

    protected abstract String getTableName();

    private Connection connection() {
        return connection;
    }
}
