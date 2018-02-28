package by.epam.project.hostel.entity.pagination;

import java.util.List;

public class Page<T> {

    private static final long serialVersionUID = 1L;

    private int currentPage;
    private int numberOfPages;
    private List<T> entity;

    public Page() {
    }

    public Page(int currentPage, int numberOfPages, List<T> entity) {
        this.currentPage = currentPage;
        this.numberOfPages = numberOfPages;
        this.entity = entity;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Override
    public int hashCode() {
        int result = getCurrentPage();
        result = 31 * result + getNumberOfPages();
        result = 31 * result + (getEntity() != null ? getEntity().hashCode() : 0);
        return result;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Page<?> page = (Page<?>) o;

        if (getCurrentPage() != page.getCurrentPage()) {
            return false;
        }
        if (getNumberOfPages() != page.getNumberOfPages()) {
            return false;
        }
        return getEntity() != null ? getEntity().equals(page.getEntity()) : page.getEntity() == null;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(int numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    public List<T> getEntity() {
        return entity;
    }

    public void setEntity(List<T> entity) {
        this.entity = entity;
    }

    @Override
    public String toString() {
        return "Page{" +
                "currentPage=" + currentPage +
                ", numberOfPages=" + numberOfPages +
                ", entity=" + entity +
                '}';
    }
}
