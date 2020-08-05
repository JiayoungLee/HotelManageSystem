package com.hqyj.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Enter1 extends MyPage{
    private Integer eId;

    private Integer houseId;

    private Integer customerId;

    private String customerInfo;

    private Date startTime;

    private Date endTimeEstimate;

    private Date endTimeActual;

    private Integer orderCustomerId;

    private Double feeTotal;

    private Integer userId;

    private Integer eState;

    private Double ePrice;

    private Customer1 customer1;

    private House1 house1;

    private User1 user1;


    public User1 getUser1() {
        return user1;
    }

    public void setUser1(User1 user1) {
        this.user1 = user1;
    }

    public House1 getHouse1() {
        return house1;
    }

    public void setHouse1(House1 house1) {
        this.house1 = house1;
    }

    public Customer1 getCustomer1() {
        return customer1;
    }

    public void setCustomer1(Customer1 customer1) {
        this.customer1 = customer1;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public Integer getHouseId() {
        return houseId;
    }

    public void setHouseId(Integer houseId) {
        this.houseId = houseId;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerInfo() {
        return customerInfo;
    }

    public void setCustomerInfo(String customerInfo) {
        this.customerInfo = customerInfo;
    }

    public String getStartTime() {
        if (this.startTime!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return simpleDateFormat.format(this.startTime);
        }
        return "";
    }

    public void setStartTime(String startTime) throws ParseException {
        if (startTime!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parseTime = simpleDateFormat.parse(startTime);
            this.startTime = parseTime;
        }else {
            this.startTime = new Date();
        }
    }

    public String getEndTimeEstimate() {
        if (this.endTimeEstimate!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return simpleDateFormat.format(this.endTimeEstimate);
        }
        return "";
    }

    public void setEndTimeEstimate(String endTimeEstimate) throws ParseException {
        if (endTimeEstimate!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parseTime = simpleDateFormat.parse(endTimeEstimate);
            this.endTimeEstimate = parseTime;
        }else {
            this.endTimeEstimate = new Date();
        }
    }

    public String getEndTimeActual() {
        if (this.endTimeActual!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return simpleDateFormat.format(this.endTimeActual);
        }
        return "";
    }

    public void setEndTimeActual(String endTimeActual) throws ParseException {
        if (endTimeActual!=null){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date parseTime = simpleDateFormat.parse(endTimeActual);
            this.endTimeActual = parseTime;
        }else {
            this.endTimeActual = new Date();
        }
    }

    public Integer getOrderCustomerId() {
        return orderCustomerId;
    }

    public void setOrderCustomerId(Integer orderCustomerId) {
        this.orderCustomerId = orderCustomerId;
    }

    public Double getFeeTotal() {
        return feeTotal;
    }

    public void setFeeTotal(Double feeTotal) {
        this.feeTotal = feeTotal;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer geteState() {
        return eState;
    }

    public void seteState(Integer eState) {
        this.eState = eState;
    }

    public Double getePrice() {
        return ePrice;
    }

    public void setePrice(Double ePrice) {
        this.ePrice = ePrice;
    }

    @Override
    public String toString() {
        return "Enter1{" +
                "eId=" + eId +
                ", houseId=" + houseId +
                ", customerId=" + customerId +
                ", customerInfo='" + customerInfo + '\'' +
                ", startTime=" + startTime +
                ", endTimeEstimate=" + endTimeEstimate +
                ", endTimeActual=" + endTimeActual +
                ", orderCustomerId=" + orderCustomerId +
                ", feeTotal=" + feeTotal +
                ", userId=" + userId +
                ", eState=" + eState +
                ", ePrice=" + ePrice +
                ", customer1=" + customer1 +
                ", house1=" + house1 +
                ", user1=" + user1 +
                '}';
    }
}