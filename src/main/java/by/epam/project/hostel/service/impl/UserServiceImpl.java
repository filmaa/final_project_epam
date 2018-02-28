package by.epam.project.hostel.service.impl;

import by.epam.project.hostel.dao.DAOFactory;
import by.epam.project.hostel.dao.UserDAO;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.dao.exception.SuchLoginExistException;
import by.epam.project.hostel.entity.User;
import by.epam.project.hostel.service.UserService;
import by.epam.project.hostel.service.constant.Constants;
import by.epam.project.hostel.service.exception.LoginDuplicatedException;
import by.epam.project.hostel.service.exception.ServiceException;
import by.epam.project.hostel.service.exception.ValidationException;
import by.epam.project.hostel.service.validation.Validator;
import by.epam.project.hostel.service.validation.impl.UserValidatorImpl;

import java.util.List;

public class UserServiceImpl extends BaseService implements UserService {

    private static final UserDAO userDAO = DAOFactory.getInstance().getUserDAO();
    private static final Validator<User> validator = new UserValidatorImpl();


    @Override
    public User singIn(String login, String password) throws ServiceException {
        try {
            validator.validate(login, password);
            String validatePassword = ((UserValidatorImpl) validator).validatePassword(password);
            User user = userDAO.signIn(login, validatePassword);
            if (user != null && User.Role.USER.equals(user.getRole())) {
                return user;
            } else {
                return null;
            }
        } catch (DAOException e) {
            throw new ValidationException("user validation failed", e);
        }
    }

    @Override
    public User adminSignIn(String login, String password) throws ServiceException {
        validator.validate(login, password);
        String validatePassword = ((UserValidatorImpl) validator).validatePassword(password);
        try {
            User admin = userDAO.signIn(login, validatePassword);
            if (admin != null && User.Role.ADMIN.equals(admin.getRole())) {
                return admin;
            } else {
                return null;
            }
        } catch (DAOException e) {
            throw new ServiceException("admin's signing in failed", e);
        }
    }

    @Override
    public List<User> getUsers(int currentPage) throws ServiceException {
        try {
            return userDAO.getUsers(currentPage);
        } catch (DAOException e) {
            throw new ServiceException("fetching user's page failed, current page: " + currentPage, e);
        }
    }

    @Override
    public void registerUser(String name, String surname, String login, String password, String email, String number) throws ServiceException {
        validator.validate(name, surname, login, password, email, number);
        String passwordMD5 = ((UserValidatorImpl) validator).validatePassword(password);
        try {
            userDAO.register(name, surname, login, passwordMD5, email, number);
        } catch (SuchLoginExistException e) {
            throw new LoginDuplicatedException("such login exist: " + login, e, Constants.ErrorParamMessages.LOGIN_DUPLICATE);
        } catch (DAOException e) {
            throw new ServiceException("registration failed", e);
        }
    }

    @Override
    public void updateUser(int id, String role, int banned) throws ServiceException {
        validator.validateID(id);
        ((UserValidatorImpl) validator).validateBanned(banned);
        ((UserValidatorImpl) validator).validateRole(role);
        try {
            userDAO.editUser(id, role, banned);
        } catch (DAOException e) {
            throw new ServiceException("updateUser failed", e);
        }
    }

    @Override
    public void updateUser(User user) throws ServiceException {
        User validateUser = validator.validate(user);
        try {
            userDAO.editUser(validateUser);
        } catch (DAOException e) {
            throw new ServiceException("error during update user", e);
        }
    }

    @Override
    public void deleteUserById(Integer userId) throws ServiceException {
        validator.validateID(userId);
        try {
            userDAO.deleteUserById(userId);
        } catch (DAOException e) {
            throw new ServiceException("error during delete user", e);
        }
    }

    @Override
    public User getUserById(Integer userId) throws ServiceException {
        validator.validateID(userId);
        try {
            return userDAO.getUserById(userId);
        } catch (DAOException e) {
            throw new ServiceException("error during getting user by id", e);
        }

    }

    @Override
    public int getTotalRowCount() throws ServiceException {
        try {
            return userDAO.getTotalRowCount();
        } catch (DAOException e) {
            throw new ServiceException("error during getting user's total row count", e);
        }
    }
}
