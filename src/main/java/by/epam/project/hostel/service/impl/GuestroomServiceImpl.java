package by.epam.project.hostel.service.impl;

import by.epam.project.hostel.dao.CommentDAO;
import by.epam.project.hostel.dao.DAOFactory;
import by.epam.project.hostel.dao.GuestroomDAO;
import by.epam.project.hostel.dao.db.transaction.Transaction;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.entity.search.SearchGuestroomsParams;
import by.epam.project.hostel.service.GuestroomService;
import by.epam.project.hostel.service.exception.ServiceException;
import by.epam.project.hostel.service.validation.Validator;
import by.epam.project.hostel.service.validation.impl.GuestroomValidatorImpl;
import by.epam.project.hostel.service.validation.impl.SearchParamsValidatorImpl;

import java.math.BigDecimal;
import java.util.List;

public class GuestroomServiceImpl extends BaseService implements GuestroomService {

    private static final DAOFactory instance = DAOFactory.getInstance();
    private static final GuestroomDAO guestroomDAO = instance.getGuestroomDAO();
    private static final Validator<Guestroom> validator = new GuestroomValidatorImpl();
    private static final Validator<SearchGuestroomsParams> validateSearchParams = new SearchParamsValidatorImpl();

    @Override
    public Guestroom getGuestroomById(int id, String language) throws ServiceException {
        validator.validateID(id);
        validator.validate(language);
        try {
            return guestroomDAO.getGuestroomById(id, language);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestroom by id = " + id, e);
        }
    }

    @Override
    public List<Guestroom> getGuestroomBySearchParam(int currentPage, SearchGuestroomsParams searchParams, String language) throws ServiceException {
        validator.validate(language);
        validator.validateCurrentPage(currentPage);
        validateSearchParams.validate(searchParams);
        try {
            return guestroomDAO.getGuestroomBySearchParam(currentPage, searchParams, language);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestrooms by search params", e);
        }
    }

    @Override
    public Integer getTotalRowCount(SearchGuestroomsParams searchParams, String language) throws ServiceException {
        validateSearchParams.validate(searchParams);
        try {
            return guestroomDAO.getTotalRowCount(searchParams, language);
        } catch (DAOException e) {
            throw new ServiceException("error during getting total row count", e);
        }
    }

    @Override
    public void deleteGuestroomById(Integer guestroomId) throws ServiceException {
        validator.validateID(guestroomId);
        GuestroomDAO guestroomDAO = instance.createGuestroomDAO();
        CommentDAO commentDAO = instance.createCommentDAO();
        try {
            Transaction transaction = transactionManager.beginTransaction(guestroomDAO, commentDAO);
            try {
                guestroomDAO.deleteImagesByGuestroomId(guestroomId);
                guestroomDAO.deleteDescriptionsByGuestroomId(guestroomId);
                guestroomDAO.deleteGuestroomById(guestroomId);
                commentDAO.deleteCommentsByGuestroomId(guestroomId);
                transaction.commit();
            } catch (DAOException e) {
                transaction.rollback();
                throw e;
            } finally {
                transaction.endTransaction();
            }
        } catch (DAOException e) {
            throw new ServiceException("error during delete guestroom by id", e);
        }
    }

    @Override
    public void addGuestroom(Guestroom guestroom, String descriptionEn, String descriptionRu) throws ServiceException {
        validator.validate(descriptionEn, descriptionRu);
        validator.validate(guestroom);
        GuestroomDAO guestroomDAO = instance.createGuestroomDAO();
        try {
            Transaction transaction = transactionManager.beginTransaction(guestroomDAO);
            try {
                int guestroomId = guestroomDAO.addGuestroom(guestroom);
                guestroomDAO.addDescription(guestroomId, descriptionEn, descriptionRu);
                guestroomDAO.addImage(guestroomId, guestroom.getImgPath());
                transaction.commit();
            } catch (DAOException e) {
                transaction.rollback();
                throw e;
            } finally {
                transaction.endTransaction();
            }
        } catch (DAOException e) {
            throw new ServiceException("error during adding guestroom", e);
        }
    }

    @Override
    public void addImage(Integer guestroomId, String imgPath) throws ServiceException {
        validator.validateID(guestroomId);
        validator.validate(imgPath);
        try {
            guestroomDAO.addImage(guestroomId, imgPath);
        } catch (DAOException e) {
            throw new ServiceException("error during adding image", e);
        }
    }

    @Override
    public void deleteImageById(String imgPath) throws ServiceException {
        validator.validate(imgPath);
        try {
            guestroomDAO.deleteImage(imgPath);
        } catch (DAOException e) {
            throw new ServiceException("error during delete image by id", e);
        }

    }

    @Override
    public List<Guestroom> getGuestrooms(String language, Integer currentPage) throws ServiceException {
        validator.validate(language);
        validator.validateCurrentPage(currentPage);
        try {
            return guestroomDAO.getGuestrooms(language, currentPage);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestrooms", e);
        }
    }

    @Override
    public List<Guestroom> getGuestroomByHostelId(Integer hostelId, String language, Integer currentPage) throws ServiceException {
        validator.validateID(hostelId);
        validator.validateCurrentPage(currentPage);
        validator.validate(language);
        try {
            return guestroomDAO.getGuestroomsByHostelId(hostelId, language, currentPage);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestroom by hostel id", e);
        }
    }

    @Override
    public List<Guestroom> getGuestroomsByHostelName(String hostelName, Integer currentPage) throws ServiceException {
        validator.validate(hostelName);
        validator.validateCurrentPage(currentPage);
        try {
            return guestroomDAO.getGuestroomsByHostelName(hostelName, currentPage);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestroom by hostel name", e);
        }

    }

    @Override
    public Integer getTotalRowCount(String hostelName) throws ServiceException {
        validator.validate(hostelName);
        try {
            return guestroomDAO.getTotalRowCount(hostelName);
        } catch (DAOException e) {
            throw new ServiceException("error during getting total row count with hostel name = " + hostelName, e);
        }
    }

    @Override
    public void editGuestroom(Guestroom guestroom, String descriptionEn, String descriptionRu) throws ServiceException {
        validator.validate(guestroom);
        validator.validate(descriptionEn, descriptionRu);
        try {
            GuestroomDAO guestroomDAO = instance.createGuestroomDAO();
            Transaction transaction = transactionManager.beginTransaction(guestroomDAO);
            try {
                guestroomDAO.editGuestroomDescriptions(guestroom.getId(), descriptionEn, descriptionRu);
                guestroomDAO.editGuestroom(guestroom);
                transaction.commit();
            } catch (DAOException e) {
                transaction.rollback();
            } finally {
                transaction.endTransaction();
            }
        } catch (DAOException e) {
            throw new ServiceException("error during editing guestroom", e);
        }

    }

    @Override
    public String getGuestroomDescription(Integer guestroomId, String language) throws ServiceException {
        validator.validate(language);
        validator.validateID(guestroomId);
        try {
            return guestroomDAO.getGuestroomDescription(guestroomId, language);
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestroom description ", e);
        }
    }

    @Override
    public BigDecimal getNightPriceByRoomId(Integer roomId) throws ServiceException {
        validator.validateID(roomId);
        try {
            return guestroomDAO.getNightPriceByRoomId(roomId);
        } catch (DAOException e) {
            throw new ServiceException("error during getting night price by room id ", e);
        }
    }

    @Override
    public int getTotalRowCount() throws ServiceException {
        try {
            return guestroomDAO.getTotalRowCount();
        } catch (DAOException e) {
            throw new ServiceException("error during getting guestroom's total row count", e);
        }
    }
}
