package by.epam.project.hostel.controller.command.impl.guestroom;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Guestroom;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.BATH;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.CAPACITY;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.DESCRIPTION_EN;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.DESCRIPTION_RU;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.ID;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.NIGHT_PRICE;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.TV;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.WIFI;
import static by.epam.project.hostel.controller.constant.Constant.Hostel.NAME;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;

public class EditGuestroomCommand implements Command {

    private static final Logger logger = LogManager.getLogger(EditGuestroomCommand.class);
    private static final String ADMIN_ADMIN_GUESTROOMS = "/admin/admin_guestrooms";


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Guestroom guestroom = createGuestroom(request);
            String descriptionRu = request.getParameter(DESCRIPTION_RU);
            String descriptionEn = request.getParameter(DESCRIPTION_EN);
            ServiceFactory.getInstance().getGuestroomService().editGuestroom(guestroom, descriptionEn, descriptionRu);
            response.sendRedirect(ADMIN_ADMIN_GUESTROOMS);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.edit.guestroom");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during edit guestroom ", e);
        }
    }

    private Guestroom createGuestroom(HttpServletRequest request) throws IOException, ServletException, ServiceException {
        Guestroom guestroom = new Guestroom();
        String hostelName = request.getParameter(NAME);
        Integer hostelId = ServiceFactory.getInstance().getHostelService().getHostelIdByName(hostelName);
        BigDecimal nightPrice = BigDecimal.valueOf(Double.valueOf(request.getParameter(NIGHT_PRICE)));
        Integer guestroomId = Integer.valueOf(request.getParameter(ID));
        String tv = request.getParameter(TV);
        String wifi = request.getParameter(WIFI);
        String bath = request.getParameter(BATH);
        Integer capacity = Integer.valueOf(request.getParameter(CAPACITY));

        guestroom.setId(guestroomId);
        guestroom.setHostelId(hostelId);
        guestroom.setTv(tv);
        guestroom.setWifi(wifi);
        guestroom.setBath(bath);
        guestroom.setCapacity(capacity);
        guestroom.setNightPrice(nightPrice);

        return guestroom;
    }
}
