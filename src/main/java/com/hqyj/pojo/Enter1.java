package com.hqyj.pojo;

import java.util.Date;

public class Enter1 {
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

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTimeEstimate() {
        return endTimeEstimate;
    }

    public void setEndTimeEstimate(Date endTimeEstimate) {
        this.endTimeEstimate = endTimeEstimate;
    }

    public Date getEndTimeActual() {
        return endTimeActual;
    }

    public void setEndTimeActual(Date endTimeActual) {
        this.endTimeActual = endTimeActual;
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
}