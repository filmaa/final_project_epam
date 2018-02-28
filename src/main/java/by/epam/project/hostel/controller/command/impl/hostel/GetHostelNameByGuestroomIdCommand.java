package by.epam.project.hostel.controller.command.impl.hostel;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Hostel.HOSTEL_NAME;
import static by.epam.project.hostel.controller.constant.Constant.Hostel.ID;

public class GetHostelNameByGuestroomIdCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetHostelNameByGuestroomIdCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer hostelId = Integer.valueOf(request.getParameter(ID));
        try {
            String hostelName = ServiceFactory.getInstance().getHostelService().getHostelNameByGuestroomId(hostelId);
            request.setAttribute(HOSTEL_NAME, hostelName);
        } catch (ServiceException e) {
            logger.error("error during getting hostel name by guestroom id ", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
