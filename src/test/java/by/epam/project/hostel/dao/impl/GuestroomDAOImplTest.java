package by.epam.project.hostel.dao.impl;

import by.epam.project.hostel.dao.db.connection.ConnectionProvider;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;
import by.epam.project.hostel.dao.exception.DAOException;
import by.epam.project.hostel.entity.Guestroom;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class GuestroomDAOImplTest {
    @Before
    public void init() {
        try {
            ConnectionProvider.getInstance().initPoolData();
        } catch (ConnectionPoolException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getGuestRoomById() throws DAOException {

        GuestroomDAOImpl guestroomDAO = new GuestroomDAOImpl();
        Guestroom guestroom = guestroomDAO.getGuestroomById(4, "en");
        System.out.println(guestroom.toString());
    }

    @After
    public void dispose() {
        ConnectionProvider.getInstance().dispose();
    }
}