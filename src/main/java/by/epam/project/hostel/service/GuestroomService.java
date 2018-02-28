package by.epam.project.hostel.service;

import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.entity.search.SearchGuestroomsParams;
import by.epam.project.hostel.service.exception.ServiceException;

import java.math.BigDecimal;
import java.util.List;

public interface GuestroomService extends EntityService {

    Guestroom getGuestroomById(int id, String language) throws ServiceException;

    List<Guestroom> getGuestroomBySearchParam(int currentPage, SearchGuestroomsParams searchParams, String language) throws ServiceException;

    Integer getTotalRowCount(SearchGuestroomsParams searchParams, String language) throws ServiceException;

    void deleteGuestroomById(Integer guestroomId) throws ServiceException;

    void addGuestroom(Guestroom guestroom, String descriptionEn, String descriptionRu) throws ServiceException;

    void addImage(Integer guestroomId, String imgPath) throws ServiceException;

    void deleteImageById(String imgPath) throws ServiceException;

    List<Guestroom> getGuestrooms(String language, Integer currentPage) throws ServiceException;

    List<Guestroom> getGuestroomByHostelId(Integer hostelId, String language, Integer currentPage) throws ServiceException;

    List<Guestroom> getGuestroomsByHostelName(String hostelName, Integer currentPage) throws ServiceException;

    Integer getTotalRowCount(String hostelName) throws ServiceException;

    void editGuestroom(Guestroom guestroom, String descriptionEn, String descriptionRu) throws ServiceException;

    String getGuestroomDescription(Integer guestroomId, String language) throws ServiceException;

    BigDecimal getNightPriceByRoomId(Integer roomId) throws ServiceException;
}
