package by.epam.project.hostel.controller.command.impl.guestroom;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.ERROR_JSP;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.ID;
import static by.epam.project.hostel.controller.constant.Constant.Guestroom.IMG_PATH;
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;

public class DeleteGuestroomPictureCommand implements Command {

    private static final Logger logger = LogManager.getLogger(DeleteGuestroomPictureCommand.class);
    private static final String ADMIN_EDIT_GUESTROOM_ID = "/admin/edit_guestroom?id=";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imgP = request.getParameter(IMG_PATH);
        String roomId = request.getParameter(ID);
        try {
            ServiceFactory.getInstance().getGuestroomService().deleteImageById(imgP);
            response.sendRedirect(ADMIN_EDIT_GUESTROOM_ID + roomId);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.delete.guestroom.picture");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during delete image", e);
        }
    }
}
