package by.epam.project.hostel.dao.impl;

import by.epam.project.hostel.dao.BaseDAO;
import by.epam.project.hostel.dao.HostelDAO;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Hostel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static by.epam.project.hostel.controller.constant.Constant.Language.EN;
import static by.epam.project.hostel.controller.constant.Constant.Language.RU;


public class HostelDAOImpl extends BaseDAO implements HostelDAO {


    private static final String SELECT_HOSTEL_BY_ID = "SELECT  stars,  imgPath,  name,  country,  city,  description,  address,  t.hostel_id FROM hostel  INNER JOIN thostel t ON hostel.id = t.hostel_id INNER JOIN language l ON t.language_id = l.id WHERE l.language = ? AND hostel.id = ?";
    private static final String SELECT_HOSTEL_BY_ROOM_ID = "SELECT  stars,  imgPath,  name,  country,  city,  description,  address,  t.hostel_id FROM hostel  INNER JOIN thostel t ON hostel.id = t.hostel_id INNER JOIN language l ON t.language_id = l.id  INNER JOIN guestrooms g ON hostel.id = g.hostel_id WHERE g.id = ? AND l.language = ?";
    private static final String SELECT_ALL_HOSTELS = "SELECT stars,  imgPath,  name,  country,  city,  description,  address,  t.hostel_id FROM hostel INNER JOIN thostel t ON hostel.id = t.hostel_id INNER JOIN language l ON t.language_id = l.id WHERE language=?";
    private static final String DELETE_HOSTEL_BY_ID = "DELETE FROM hostel WHERE id = ?";
    private static final String INSERT_THOSTEL = "INSERT INTO thostel(language_id, hostel_id, country, city, description, address) VALUES (?,?,?,?,?,?)";
    private static final String DELETE_EN_RU_HOSTEL_PART = "DELETE FROM thostel WHERE hostel_id = ?";
    private static final String INSERT_HOSTEL = "INSERT INTO hostel (stars, imgPath, name) VALUES (?,?,?)";
    private static final String SELECT_CITIES = "SELECT city FROM thostel INNER JOIN language l ON thostel.language_id = l.id WHERE language = ?";
    private static final String SELECT_NAME_FROM_HOSTEL = "SELECT name FROM hostel";
    private static final String SELECT_ID_FROM_HOSTEL_BY_NAME = "SELECT id FROM hostel WHERE name = ?";
    private static final String SELECT_NAME_FROM_HOSTEL_BY_GUESTROOM_ID = "SELECT name FROM hostel INNER JOIN guestrooms g ON hostel.id = g.hostel_id WHERE g.id = ?";
    private static final String UPDATE_HOSTEL_DESCRIPTION = "UPDATE thostel SET country=?,city=?,description=?,address=? WHERE language_id=? AND hostel_id=?";
    private static final String UPDATE_HOSTEL = "UPDATE hostel SET stars=?,imgPath=?,name=? WHERE id=?";
    private static final String HOSTEL = "hostel";

    @Override
    public Hostel getHostelById(int id, String language) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_HOSTEL_BY_ID)) {
            ps.setString(1, language);
            ps.setInt(2, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                return createHostel(rs);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting hostel by id", e);
        }
    }

    @Override
    public Hostel getHostelByRoomId(int id, String language) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_HOSTEL_BY_ROOM_ID)) {
            ps.setInt(1, id);
            ps.setString(2, language);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                return createHostel(rs);
            }

        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during get hostel by room id", e);
        }
    }

    @Override
    public List<Hostel> getHostels(String language) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_HOSTELS)) {
            ps.setString(1, language);
            try (ResultSet rs = ps.executeQuery()) {
                List<Hostel> hostels = new ArrayList<>();
                while (rs.next()) {
                    hostels.add(createHostel(rs));
                }
                return hostels;
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting hostels", e);
        }
    }

    @Override
    public void deleteHostelById(Integer hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_HOSTEL_BY_ID)) {
            ps.setInt(1, hostelId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during delete hostel by id ", e);
        }
    }

    @Override
    public int addHostel(Map<String, Hostel> hostel) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(INSERT_HOSTEL, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, hostel.get(RU).getStars());
            ps.setString(2, hostel.get(RU).getImgPath());
            ps.setString(3, hostel.get(RU).getName());
            ps.executeUpdate();
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new DAOException("cannot get id of inserting hostel");
                }
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during inserting hostel", e);
        }
    }


    @Override
    public void addHostelLanguageParams(Map<String, Hostel> hostel, int hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(INSERT_THOSTEL)) {
            ps.setInt(1, 1);
            ps.setInt(2, hostelId);
            ps.setString(3, hostel.get(EN).getCountry());
            ps.setString(4, hostel.get(EN).getCity());
            ps.setString(5, hostel.get(EN).getDescription());
            ps.setString(6, hostel.get(EN).getAddress());
            ps.executeUpdate();
            ps.setInt(1, 2);
            ps.setInt(2, hostelId);
            ps.setString(3, hostel.get(RU).getCountry());
            ps.setString(4, hostel.get(RU).getCity());
            ps.setString(5, hostel.get(RU).getDescription());
            ps.setString(6, hostel.get(RU).getAddress());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during adding hostel's params into thostel", e);
        }
    }

    @Override
    public void deleteHostelDescription(Integer hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(DELETE_EN_RU_HOSTEL_PART)) {
            ps.setInt(1, hostelId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during delete hostel descriptions", e);
        }
    }

    @Override
    public List<String> getHostelsName() throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_NAME_FROM_HOSTEL)) {
            return getList(ps);
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting whole hostels name", e);
        }
    }


    @Override
    public List<String> getHostelsCities(String language) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_CITIES)) {
            ps.setString(1, language);
            return getList(ps);
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting hostels' cities", e);
        }
    }

    @Override
    public Integer getHostelIdByName(String hostelName) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ID_FROM_HOSTEL_BY_NAME)) {
            ps.setString(1, hostelName);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                return rs.getInt(1);
            }
        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting hostel id by name", e);
        }
    }

    @Override
    public String getHostelNameByGuestroomId(Integer hostelId) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(SELECT_NAME_FROM_HOSTEL_BY_GUESTROOM_ID)) {
            ps.setInt(1, hostelId);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) {
                    return null;
                }
                return rs.getString(1);
            }

        } catch (SQLException | ConnectionPoolException e) {
            throw new DAOException("error during getting hostel name by guestroom id", e);
        }
    }

    @Override
    public void updateHostelDescriptions(String language, Hostel hostel) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_HOSTEL_DESCRIPTION)) {
            ps.setString(1, hostel.getCountry());
            ps.setString(2, hostel.getCity());
            ps.setString(3, hostel.getDescription());
            ps.setString(4, hostel.getAddress());
            ps.setInt(5, language.equals(EN) ? 1 : 2);
            ps.setInt(6, hostel.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during update hostel descripton", e);
        }
    }

    @Override
    public void updateHostel(Map<String, Hostel> hostel) throws DAOException {
        try (Connection connection = provider.connection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_HOSTEL)) {
            Hostel hostelEntity = hostel.get(RU);
            ps.setInt(1, hostelEntity.getStars());
            ps.setString(2, hostelEntity.getImgPath());
            ps.setString(3, hostelEntity.getName());
            ps.setInt(4, hostelEntity.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("error during update hostel ", e);
        }
    }

    private List<String> getList(PreparedStatement ps) throws SQLException {
        try (ResultSet rs = ps.executeQuery()) {
            List<String> hostelNames = new ArrayList<>();
            while (rs.next()) {
                hostelNames.add(rs.getString(1));
            }
            return hostelNames;
        }
    }

    private Hostel createHostel(ResultSet rs) throws SQLException {
        Hostel hostel = new Hostel();
        hostel.setStars(rs.getInt(1));
        hostel.setImgPath(rs.getString(2));
        hostel.setName(rs.getString(3));
        hostel.setCountry(rs.getString(4));
        hostel.setCity(rs.getString(5));
        hostel.setDescription(rs.getString(6));
        hostel.setAddress(rs.getString(7));
        hostel.setId(rs.getInt(8));
        return hostel;
    }

    @Override
    protected String getTableName() {
        return HOSTEL;
    }
}
