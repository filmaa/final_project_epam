package by.epam.project.hostel.dao.db.connection;

import java.util.ResourceBundle;

public class DBResourceManager {

    private static final String PATH = "db";

    private static DBResourceManager instance = new DBResourceManager();

    private ResourceBundle bundle = ResourceBundle.getBundle(PATH);

    private DBResourceManager() {
    }

    public static DBResourceManager getInstance() {
        return instance;
    }

    public String getValue(String key) {
        return bundle.getString(key);
    }
}
