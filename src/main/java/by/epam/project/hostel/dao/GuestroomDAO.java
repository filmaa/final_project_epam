package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.entity.search.SearchGuestroomsParams;

import java.math.BigDecimal;
import java.util.List;

public interface GuestroomDAO extends EntityDAO {
    List<Guestroom> getGuestroomsByHostelId(int id, String language, int page) throws DAOException;

    Guestroom getGuestroomById(int id, String language) throws DAOException;

    List<Guestroom> getGuestroomBySearchParam(int currentPage, SearchGuestroomsParams searchParams, String language) throws DAOException;

    Integer getTotalRowCount(SearchGuestroomsParams searchParams, String language) throws DAOException;

    void deleteGuestroomById(Integer guestroomId) throws DAOException;

    void addImage(Integer guestroomId, String imgPath) throws DAOException;

    void deleteImage(String imgPath) throws DAOException;

    List<Guestroom> getGuestrooms(String language, Integer currentPage) throws DAOException;

    int addGuestroom(Guestroom guestroom) throws DAOException;

    void addImage(int guestroomId, List<String> imgPath) throws DAOException;

    void addDescription(int guestroomId, String descriptionEn, String descriptionRu) throws DAOException;

    void deleteImagesByGuestroomId(Integer guestroomId) throws DAOException;

    void deleteDescriptionsByGuestroomId(Integer guestroomId) throws DAOException;

    void deleteGuestroomsDescriptionByHostelId(Integer hostelId) throws DAOException;

    void deleteGuestroomsPicturesByHostelId(Integer hostelId) throws DAOException;

    void deleteGuestroomsByHostelId(Integer hostelId) throws DAOException;

    List<Guestroom> getGuestroomsByHostelName(String hostelName, Integer currentPage) throws DAOException;

    Integer getTotalRowCount(String hostelName) throws DAOException;

    void editGuestroomDescriptions(int guestroomId, String descriptionEn, String descriptionRu) throws DAOException;

    void editGuestroom(Guestroom guestroom) throws DAOException;

    String getGuestroomDescription(int guestroomId, String language) throws DAOException;

    BigDecimal getNightPriceByRoomId(Integer roomId) throws DAOException;
}
