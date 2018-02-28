package by.epam.project.hostel.controller.pagination;


import by.epam.project.hostel.entity.pagination.Page;

import java.util.List;

public class PageWrapper {
    public static final int MAX_ENTRIES_PER_PAGE = 5;

    public static <T> Page<T> wrapList(List<T> list, int currentPage, int countOfRows) {
        Page<T> page = new Page<>();
        page.setCurrentPage(currentPage);
        if (countOfRows % MAX_ENTRIES_PER_PAGE > 0) {
            page.setNumberOfPages(countOfRows / MAX_ENTRIES_PER_PAGE + 1);
        } else {
            page.setNumberOfPages(countOfRows / MAX_ENTRIES_PER_PAGE);
        }
        page.setEntity(list);
        return page;
    }
}
