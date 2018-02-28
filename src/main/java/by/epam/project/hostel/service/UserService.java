package by.epam.project.hostel.service;

import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.exception.ServiceException;

import java.util.List;

public interface UserService extends EntityService {
    User singIn(String login, String password) throws ServiceException;

    User adminSignIn(String login, String password) throws ServiceException;

    List<User> getUsers(int currentPage) throws ServiceException;

    void registerUser(String name, String surname, String login, String password, String email, String number) throws ServiceException;

    void updateUser(int id, String role, int banned) throws ServiceException;

    void updateUser(User user) throws ServiceException;

    void deleteUserById(Integer userId) throws ServiceException;

    User getUserById(Integer userId) throws ServiceException;
}
