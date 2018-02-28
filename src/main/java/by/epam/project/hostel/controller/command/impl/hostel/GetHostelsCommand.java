package by.epam.project.hostel.controller.command.impl.hostel;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Hostel;
import by.epam.project.hostel.service.HostelService;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ServiceException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static by.epam.project.hostel.controller.constant.Constant.Hostel.HOSTELS;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;

public class GetHostelsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetHostelsCommand.class);


    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String language = (String) request.getSession().getAttribute(LOCAL);
        HostelService hostelService = ServiceFactory.getInstance().getHostelService();
        try {
            List<Hostel> hostels = hostelService.getHostels(language);
            request.setAttribute(HOSTELS, hostels);
        } catch (ServiceException e) {
            logger.error("error during getting whole hostels", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}