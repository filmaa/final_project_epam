package by.epam.project.hostel.dao;

import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Hostel;

import java.util.List;
import java.util.Map;

public interface HostelDAO extends EntityDAO {
    Hostel getHostelById(int id, String language) throws DAOException;

    Hostel getHostelByRoomId(int id, String language) throws DAOException;

    List<Hostel> getHostels(String language) throws DAOException;

    void deleteHostelById(Integer hostelId) throws DAOException;

    int addHostel(Map<String, Hostel> hostel) throws DAOException;

    void addHostelLanguageParams(Map<String, Hostel> hostel, int hostelId) throws DAOException;

    void deleteHostelDescription(Integer hostelId) throws DAOException;

    List<String> getHostelsName() throws DAOException;

    List<String> getHostelsCities(String language) throws DAOException;

    Integer getHostelIdByName(String hostelName) throws DAOException;

    String getHostelNameByGuestroomId(Integer hostelId) throws DAOException;

    void updateHostelDescriptions(String language, Hostel hostel) throws DAOException;

    void updateHostel(Map<String, Hostel> hostel) throws DAOException;
}
