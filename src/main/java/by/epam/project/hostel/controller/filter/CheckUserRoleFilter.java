package by.epam.project.hostel.controller.filter;

import by.epam.project.hostel.entity.User;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static by.epam.project.hostel.controller.constant.Constant.Exception.ERROR_USER_NOT_LOGGED;
import static by.epam.project.hostel.controller.constant.Constant.Page.BLOCK_PAGE_JSP;
import static by.epam.project.hostel.controller.constant.Constant.URL;
import static by.epam.project.hostel.controller.constant.Constant.User.USER;

public class CheckUserRoleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        User user = (User) httpRequest.getSession().getAttribute(USER);
        if (user != null && User.Role.USER.equals(user.getRole()) && !user.isBanned()) {
            chain.doFilter(request, response);
        } else if (user != null && user.isBanned()) {
            ((HttpServletResponse) response).sendRedirect(BLOCK_PAGE_JSP);
        } else {
            request.setAttribute(ERROR_USER_NOT_LOGGED, true);
            request.getRequestDispatcher((String) ((HttpServletRequest) request).getSession().getAttribute(URL)).forward(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
