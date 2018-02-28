package by.epam.project.hostel.service;

import by.epam.project.hostel.entity.Hostel;
import by.epam.project.hostel.service.exception.ServiceException;
import by.epam.project.hostel.service.exception.ValidationException;

import javax.security.sasl.SaslException;
import java.util.List;
import java.util.Map;

public interface HostelService extends EntityService {
    Hostel getHostelById(int id, String language) throws ValidationException;

    List<Hostel> getHostels(String language) throws ServiceException;

    void deleteHostelById(Integer hostelId) throws ServiceException;

    void addHostel(Map<String, Hostel> hostel) throws ServiceException;

    List<String> getHostelsName() throws ServiceException;

    List<String> getHostelsCities(String language) throws ServiceException;

    Integer getHostelIdByName(String hostelName) throws ServiceException;

    String getHostelNameByGuestroomId(Integer hostelId) throws ServiceException;

    void editHostel(Map<String, Hostel> hostel) throws SaslException, ServiceException;

}
