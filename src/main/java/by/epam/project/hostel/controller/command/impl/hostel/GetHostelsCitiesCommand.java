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
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Hostel.CITIES;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;

public class GetHostelsCitiesCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetHostelsCitiesCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String language = (String) request.getSession().getAttribute(LOCAL);
        try {
            List<String> hostelsCities = ServiceFactory.getInstance().getHostelService().getHostelsCities(language);
            request.setAttribute(CITIES, hostelsCities);
        } catch (ServiceException e) {
            logger.error("error during getting hostels' cities", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
