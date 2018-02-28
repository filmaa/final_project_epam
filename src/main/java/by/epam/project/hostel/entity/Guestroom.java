package by.epam.project.hostel.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Guestroom extends Entity implements Serializable {
    private static final long serialVersionUID = -8053748141053902283L;

    private int hostelId;
    private BigDecimal nightPrice;
    private boolean tv;
    private boolean wifi;
    private boolean bath;
    private int capacity;
    private String description;
    private List<String> imgPath;

    public Guestroom() {
    }

    public Guestroom(
            int id, int hostelId, BigDecimal nightPrice, boolean tv,
            boolean wifi, boolean bath, int capacity, String description,
            List<String> imgPath) {
        this.id = id;
        this.hostelId = hostelId;
        this.nightPrice = nightPrice;
        this.tv = tv;
        this.wifi = wifi;
        this.bath = bath;
        this.capacity = capacity;
        this.description = description;
        this.imgPath = imgPath;
    }

    public void setTv(String tv) {
        if (tv == null || tv.isEmpty()) {
            this.tv = false;
        } else {
            this.tv = Boolean.valueOf(tv);
        }
    }

    public void setWifi(String wifi) {
        if (wifi == null || wifi.isEmpty()) {
            this.wifi = false;
        } else {
            this.wifi = Boolean.valueOf(wifi);
        }
    }

    public void setTv(boolean tv) {
        this.tv = tv;
    }

    public void setBath(String bath) {
        if (bath == null || bath.isEmpty()) {
            this.bath = false;
        } else {
            this.bath = Boolean.valueOf(bath);
        }
    }

    public void setWifi(boolean wifi) {
        this.wifi = wifi;
    }

    public void setImgPath(String imgPath) {
        if (this.imgPath == null) {
            this.imgPath = new ArrayList<>();
        }
        this.imgPath.add(imgPath);
    }

    public void setBath(boolean bath) {
        this.bath = bath;
    }

    @Override
    public int hashCode() {
        int result = getId();
        result = 31 * result + getHostelId();
        result = 31 * result + (getNightPrice() != null ? getNightPrice().hashCode() : 0);
        result = 31 * result + (isTv() ? 1 : 0);
        result = 31 * result + (isWifi() ? 1 : 0);
        result = 31 * result + (isBath() ? 1 : 0);
        result = 31 * result + getCapacity();
        result = 31 * result + (getDescription() != null ? getDescription().hashCode() : 0);
        result = 31 * result + (getImgPath() != null ? getImgPath().hashCode() : 0);
        return result;
    }

    public int getHostelId() {
        return hostelId;
    }

    public void setHostelId(int hostelId) {
        this.hostelId = hostelId;
    }

    public BigDecimal getNightPrice() {
        return nightPrice;
    }

    public void setNightPrice(BigDecimal nightPrice) {
        this.nightPrice = nightPrice;
    }

    public boolean isTv() {
        return tv;
    }

    public void setTv(int tv) {
        if (tv == 0) {
            this.tv = false;
        } else if (tv == 1) {
            this.tv = true;
        }
    }

    public boolean isWifi() {
        return wifi;
    }

    public void setWifi(int wifi) {
        if (wifi == 0) {
            this.wifi = false;
        } else if (wifi == 1) {
            this.wifi = true;
        }
    }

    public boolean isBath() {
        return bath;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getImgPath() {
        return imgPath;
    }

    public void setImgPath(List<String> imgPath) {
        this.imgPath = imgPath;
    }

    public void setBath(int bath) {
        if (bath == 0) {
            this.bath = false;
        } else if (bath == 1) {
            this.bath = true;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Guestroom guestroom = (Guestroom) o;

        if (getId() != guestroom.getId()) {
            return false;
        }
        if (getHostelId() != guestroom.getHostelId()) {
            return false;
        }
        if (isTv() != guestroom.isTv()) {
            return false;
        }
        if (isWifi() != guestroom.isWifi()) {
            return false;
        }
        if (isBath() != guestroom.isBath()) {
            return false;
        }
        if (getCapacity() != guestroom.getCapacity()) {
            return false;
        }
        if (getNightPrice() != null ? !getNightPrice().equals(guestroom.getNightPrice()) : guestroom.getNightPrice() != null) {
            return false;
        }
        if (getDescription() != null ? !getDescription().equals(guestroom.getDescription()) : guestroom.getDescription() != null) {
            return false;
        }
        return getImgPath() != null ? getImgPath().equals(guestroom.getImgPath()) : guestroom.getImgPath() == null;
    }

    @Override
    public String toString() {
        return "Guestroom{" +
                "id=" + id +
                ", hostelId=" + hostelId +
                ", nightPrice=" + nightPrice +
                ", tv=" + tv +
                ", wifi=" + wifi +
                ", bath=" + bath +
                ", capacity=" + capacity +
                ", description='" + description + '\'' +
                ", imgPath=" + imgPath +
                '}';
    }
}
