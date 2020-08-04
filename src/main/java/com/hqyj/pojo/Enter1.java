package com.hqyj.pojo;

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

    private List<Fee1> fee1List;

    public List<Fee1> getFee1List() {
        return fee1List;
    }

    public void setFee1List(List<Fee1> fee1List) {
        this.fee1List = fee1List;
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
                ", fee1=" + fee1List +
                '}'+"\n";
    }
}