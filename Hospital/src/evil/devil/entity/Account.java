package evil.devil.entity;

import java.util.Date;

public class Account {
    private Integer id;

    private Integer userId;

    private Integer doctorId;

    private Date dateTime;

    private Date accountTime;

    private Integer price;

    private Integer payType;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public Date getAccountTime() {
        return accountTime;
    }

    public void setAccountTime(Date accountTime) {
        this.accountTime = accountTime;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

	@Override
	public String toString() {
		return "Account [id=" + id + ", userId=" + userId + ", doctorId=" + doctorId + ", dateTime=" + dateTime
				+ ", accountTime=" + accountTime + ", price=" + price + ", payType=" + payType + "]";
	}
}