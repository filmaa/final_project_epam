package by.epam.project.hostel.controller.command.impl.hostel;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.entity.Hostel;
import by.epam.project.hostel.service.HostelService;
import by.epam.project.hostel.service.ServiceFactory;
import by.epam.project.hostel.service.exception.ValidationException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Hostel.ID;
import static by.epam.project.hostel.controller.constant.Constant.Language.EN;
import static by.epam.project.hostel.controller.constant.Constant.Language.RU;


public class GetHostelWithDescriptionsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetHostelWithDescriptionsCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer hostelId = Integer.valueOf(request.getParameter(ID));
        try {
            HostelService hostelService = ServiceFactory.getInstance().getHostelService();
            Hostel hostelRu = hostelService.getHostelById(hostelId, RU);
            Hostel hostelEn = hostelService.getHostelById(hostelId, EN);
            request.setAttribute("hostelRu", hostelRu);
            request.setAttribute("hostelEn", hostelEn);
        } catch (ValidationException e) {
            logger.error("error during getting whole hostel with descriptions ", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
