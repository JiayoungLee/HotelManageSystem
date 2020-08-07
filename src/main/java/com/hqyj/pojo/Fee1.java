package com.hqyj.pojo;

public class Fee1 {
    private Integer fId;

    private Integer enterId;

    private String direct;

    private String coustomerName;

    private Double money;

    private Integer userId;

    private String houseName;

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

    public Integer getEnterId() {
        return enterId;
    }

    public void setEnterId(Integer enterId) {
        this.enterId = enterId;
    }

    public String getDirect() {
        return direct;
    }

    public void setDirect(String direct) {
        this.direct = direct;
    }

    public String getCoustomerName() {
        return coustomerName;
    }

    public void setCoustomerName(String coustomerName) {
        this.coustomerName = coustomerName;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    @Override
    public String toString() {
        return "Fee1{" +
                "fId=" + fId +
                ", enterId=" + enterId +
                ", direct='" + direct + '\'' +
                ", coustomerName='" + coustomerName + '\'' +
                ", money=" + money +
                ", userId=" + userId +
                ", houseName='" + houseName + '\'' +
                '}';
    }
}