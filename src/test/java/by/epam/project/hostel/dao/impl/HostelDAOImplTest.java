package by.epam.project.hostel.dao.impl;

import by.epam.project.hostel.dao.DAOFactory;
import by.epam.project.hostel.dao.db.connection.ConnectionProvider;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Hostel;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static by.epam.project.hostel.controller.constant.Constant.Language.EN;
import static by.epam.project.hostel.controller.constant.Constant.Language.RU;

public class HostelDAOImplTest {

    @Before
    public void init() {
        try {
            ConnectionProvider.getInstance().initPoolData();
        } catch (ConnectionPoolException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void addHostel() {
        Map<String, Hostel> hostel = new HashMap<>();
        hostel.put(RU, new Hostel(5, "Montana", "Канада", "Оттава", "прекрасное место", "img/1.jpg", "Ла"));
        hostel.put(EN, new Hostel(5, "Montana", "Canada", "Ottava", "beautiful place", "img/1.jpg", "La"));
        try {
            DAOFactory.getInstance().getHostelDAO().addHostel(hostel);
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }

    @After
    public void dispose() {
        ConnectionProvider.getInstance().dispose();
    }

}