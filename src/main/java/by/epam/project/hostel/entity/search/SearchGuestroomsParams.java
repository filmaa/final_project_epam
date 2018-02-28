package by.epam.project.hostel.entity.search;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;

public class SearchGuestroomsParams implements Serializable {

    private static final long serialVersionUID = 1L;

    private String sorting = "none";
    private BigDecimal nightPriceFrom;
    private BigDecimal nightPriceTo;
    private LocalDate dateFrom;
    private LocalDate dateTo;
    private Boolean wifi = false;
    private Boolean tv = false;
    private Boolean shower = false;
    private Integer capacityFrom;
    private Integer capacityTo;
    private String city;
    private String order = "ascending";
    private Boolean search;

    public SearchGuestroomsParams() {
    }

    public SearchGuestroomsParams(String sorting, BigDecimal nightPriceFrom, BigDecimal nightPriceTo, LocalDate dateFrom, LocalDate dateTo, Boolean wifi, Boolean tv, Boolean shower, Integer capacityFrom, Integer capacityTo, String city, String order, Boolean search) {
        this.sorting = sorting;
        this.nightPriceFrom = nightPriceFrom;
        this.nightPriceTo = nightPriceTo;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.wifi = wifi;
        this.tv = tv;
        this.shower = shower;
        this.capacityFrom = capacityFrom;
        this.capacityTo = capacityTo;
        this.city = city;
        this.order = order;
        this.search = search;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    @Override
    public int hashCode() {
        int result = getSorting() != null ? getSorting().hashCode() : 0;
        result = 31 * result + (getNightPriceFrom() != null ? getNightPriceFrom().hashCode() : 0);
        result = 31 * result + (getNightPriceTo() != null ? getNightPriceTo().hashCode() : 0);
        result = 31 * result + (getDateFrom() != null ? getDateFrom().hashCode() : 0);
        result = 31 * result + (getDateTo() != null ? getDateTo().hashCode() : 0);
        result = 31 * result + (getWifi() != null ? getWifi().hashCode() : 0);
        result = 31 * result + (getTv() != null ? getTv().hashCode() : 0);
        result = 31 * result + (getShower() != null ? getShower().hashCode() : 0);
        result = 31 * result + (getCapacityFrom() != null ? getCapacityFrom().hashCode() : 0);
        result = 31 * result + (getCapacityTo() != null ? getCapacityTo().hashCode() : 0);
        result = 31 * result + (getCity() != null ? getCity().hashCode() : 0);
        result = 31 * result + (getOrder() != null ? getOrder().hashCode() : 0);
        result = 31 * result + (getSearch() != null ? getSearch().hashCode() : 0);
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

        SearchGuestroomsParams that = (SearchGuestroomsParams) o;

        if (getSorting() != null ? !getSorting().equals(that.getSorting()) : that.getSorting() != null) {
            return false;
        }
        if (getNightPriceFrom() != null ? !getNightPriceFrom().equals(that.getNightPriceFrom()) : that.getNightPriceFrom() != null) {
            return false;
        }
        if (getNightPriceTo() != null ? !getNightPriceTo().equals(that.getNightPriceTo()) : that.getNightPriceTo() != null) {
            return false;
        }
        if (getDateFrom() != null ? !getDateFrom().equals(that.getDateFrom()) : that.getDateFrom() != null) {
            return false;
        }
        if (getDateTo() != null ? !getDateTo().equals(that.getDateTo()) : that.getDateTo() != null) {
            return false;
        }
        if (getWifi() != null ? !getWifi().equals(that.getWifi()) : that.getWifi() != null) {
            return false;
        }
        if (getTv() != null ? !getTv().equals(that.getTv()) : that.getTv() != null) {
            return false;
        }
        if (getShower() != null ? !getShower().equals(that.getShower()) : that.getShower() != null) {
            return false;
        }
        if (getCapacityFrom() != null ? !getCapacityFrom().equals(that.getCapacityFrom()) : that.getCapacityFrom() != null) {
            return false;
        }
        if (getCapacityTo() != null ? !getCapacityTo().equals(that.getCapacityTo()) : that.getCapacityTo() != null) {
            return false;
        }
        if (getCity() != null ? !getCity().equals(that.getCity()) : that.getCity() != null) {
            return false;
        }
        if (getOrder() != null ? !getOrder().equals(that.getOrder()) : that.getOrder() != null) {
            return false;
        }
        return getSearch() != null ? getSearch().equals(that.getSearch()) : that.getSearch() == null;
    }

    public String getSorting() {
        return sorting;
    }

    public void setSorting(String sorting) {
        this.sorting = sorting;
    }

    public BigDecimal getNightPriceFrom() {
        return nightPriceFrom;
    }

    public void setNightPriceFrom(BigDecimal nightPriceFrom) {
        this.nightPriceFrom = nightPriceFrom;
    }

    public BigDecimal getNightPriceTo() {
        return nightPriceTo;
    }

    public void setNightPriceTo(BigDecimal nightPriceTo) {
        this.nightPriceTo = nightPriceTo;
    }

    public LocalDate getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(LocalDate dateFrom) {
        this.dateFrom = dateFrom;
    }

    public LocalDate getDateTo() {
        return dateTo;
    }

    public void setDateTo(LocalDate dateTo) {
        this.dateTo = dateTo;
    }

    public Boolean getWifi() {
        return wifi;
    }

    public void setWifi(Boolean wifi) {
        if (wifi == null) {
            this.wifi = false;
        }
        this.wifi = wifi;
    }

    public Boolean getTv() {
        return tv;
    }

    public void setTv(Boolean tv) {
        if (tv == null) {
            this.tv = false;
        }
        this.tv = tv;
    }

    public Boolean getShower() {
        return shower;
    }

    public void setShower(Boolean shower) {
        if (shower == null) {
            this.shower = false;
        }
        this.shower = shower;
    }

    public Integer getCapacityFrom() {
        return capacityFrom;
    }

    public void setCapacityFrom(Integer capacityFrom) {
        this.capacityFrom = capacityFrom;
    }

    public Integer getCapacityTo() {
        return capacityTo;
    }

    public void setCapacityTo(Integer capacityTo) {
        this.capacityTo = capacityTo;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public Boolean getSearch() {
        return search;
    }

    public void setSearch(Boolean search) {
        this.search = search;
    }
}
