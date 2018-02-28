package by.epam.project.hostel.controller.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import static by.epam.project.hostel.controller.constant.Constant.Language.RU;
import static by.epam.project.hostel.controller.constant.Constant.Page.LOCAL;

public class SessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        httpSessionEvent.getSession().setAttribute(LOCAL, RU);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

    }
}
