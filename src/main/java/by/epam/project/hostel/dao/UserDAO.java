package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.User;

import java.util.List;

public interface UserDAO extends EntityDAO {
    User signIn(String login, String password) throws DAOException;

    List<User> getUsers(int page) throws DAOException;

    void editUser(int id, String role, int banned) throws DAOException;

    void register(String name, String surname, String login, String password, String email, String number) throws DAOException;

    void editUser(User user) throws DAOException;

    void deleteUserById(Integer userId) throws DAOException;

    User getUserById(Integer userId) throws DAOException;
}
