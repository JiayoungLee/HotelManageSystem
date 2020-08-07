package com.hqyj.pojo;

public class House1 extends MyPage{
    private Integer hId;

    private String hName;

    private Integer hAmount;

    private Double hPrice;

    private Integer floorId;

    private Integer hState;

    private Integer customerId;

    private String hInfo;

    private Customer1 cst;

    private Enter1 enter;

    public Enter1 getEnter() {
        return enter;
    }

    public void setEnter(Enter1 enter) {
        this.enter = enter;
    }

    public Customer1 getCst() {
        return cst;
    }

    public void setCst(Customer1 cst) {
        this.cst = cst;
    }

    public Integer gethId() {
        return hId;
    }

    public void sethId(Integer hId) {
        this.hId = hId;
    }

    public String gethName() {
        return hName;
    }

    public void sethName(String hName) {
        this.hName = hName;
    }

    public Integer gethAmount() {
        return hAmount;
    }

    public void sethAmount(Integer hAmount) {
        this.hAmount = hAmount;
    }

    public Double gethPrice() {
        return hPrice;
    }

    public void sethPrice(Double hPrice) {
        this.hPrice = hPrice;
    }

    public Integer getFloorId() {
        return floorId;
    }

    public void setFloorId(Integer floorId) {
        this.floorId = floorId;
    }

    public Integer gethState() {
        return hState;
    }

    public void sethState(Integer hState) {
        this.hState = hState;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String gethInfo() {
        return hInfo;
    }

    public void sethInfo(String hInfo) {
        this.hInfo = hInfo;
    }

    @Override
    public String toString() {
        return "House1{" +
                "hId=" + hId +
                ", hName='" + hName + '\'' +
                ", hAmount=" + hAmount +
                ", hPrice=" + hPrice +
                ", floorId=" + floorId +
                ", hState=" + hState +
                ", customerId=" + customerId +
                ", hInfo='" + hInfo + '\'' +
                ", cst=" + cst +
                '}';
    }
}