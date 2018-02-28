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
import static by.epam.project.hostel.controller.constant.Constant.MESSAGE;

public class DeleteGuestroomByIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(DeleteGuestroomByIdCommand.class);
    private static final String ADMIN_ADMIN_GUESTROOMS = "/admin/admin_guestrooms";

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer guestroomId = Integer.valueOf(request.getParameter(ID));
        try {
            ServiceFactory.getInstance().getGuestroomService().deleteGuestroomById(guestroomId);
            response.sendRedirect(ADMIN_ADMIN_GUESTROOMS);
        } catch (ServiceException e) {
            request.setAttribute(MESSAGE, "local.error.delete.guestroom");
            request.getRequestDispatcher(ERROR_JSP).forward(request, response);
            logger.error("error during delete guestroom by id", e);
        }
    }
}
