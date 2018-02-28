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

import static by.epam.project.hostel.controller.constant.Constant.Guestroom.ID;
import static by.epam.project.hostel.controller.constant.Constant.Language.EN;
import static by.epam.project.hostel.controller.constant.Constant.Language.RU;

public class GetGuestroomDescriptionsCommand implements Command {

    private static final Logger logger = LogManager.getLogger(GetGuestroomDescriptionsCommand.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer guestroomId = Integer.valueOf(request.getParameter(ID));
        try {
            String descriptionRu = ServiceFactory.getInstance().getGuestroomService().getGuestroomDescription(guestroomId, RU);
            String descriptionEn = ServiceFactory.getInstance().getGuestroomService().getGuestroomDescription(guestroomId, EN);
            request.setAttribute("descriptionRu", descriptionRu);
            request.setAttribute("descriptionEn", descriptionEn);
        } catch (ServiceException e) {
            logger.error("error during getting guestroom's descriptions", e);
            try {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (IOException err) {
                logger.error("error during sending error", err);
            }
        }
    }
}
