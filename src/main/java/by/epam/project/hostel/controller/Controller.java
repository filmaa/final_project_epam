package by.epam.project.hostel.controller;

import by.epam.project.hostel.controller.command.Command;
import by.epam.project.hostel.controller.exception.ConnectionPoolNotInitializedRuntimeException;
import by.epam.project.hostel.dao.db.connection.ConnectionProvider;
import by.epam.project.hostel.dao.exception.ConnectionPoolException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@MultipartConfig
public class Controller extends HttpServlet {

    private static final String COMMAND = "command";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commandName = request.getParameter(COMMAND);
        Command command = CommandFactory.getInstance().getCommand(commandName);
        command.execute(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commandName = request.getParameter(COMMAND);
        Command command = CommandFactory.getInstance().getCommand(commandName);
        command.execute(request, response);
    }

    @Override
    public void destroy() {
        ConnectionProvider.getInstance().dispose();
    }

    @Override
    public void init() {
        try {
            ConnectionProvider.getInstance().initPoolData();
        } catch (ConnectionPoolException e) {
            throw new ConnectionPoolNotInitializedRuntimeException("error during init connection pool provider", e);
        }
    }
}
