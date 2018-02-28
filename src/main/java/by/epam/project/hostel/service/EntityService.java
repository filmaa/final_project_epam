package by.epam.project.hostel.service;

import by.epam.project.hostel.service.exception.ServiceException;

public interface EntityService {
    int getTotalRowCount() throws ServiceException;
}
