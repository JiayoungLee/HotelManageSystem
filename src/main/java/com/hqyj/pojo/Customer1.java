package com.hqyj.pojo;

public class Customer1 {
    private Integer cId;

    private String cName;

    private String cCard;

    private String cPhone;

    private String cAccount;

    private String cPassword;

    private String role;

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcCard() {
        return cCard;
    }

    public void setcCard(String cCard) {
        this.cCard = cCard;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }

    public String getcAccount() {
        return cAccount;
    }

    public void setcAccount(String cAccount) {
        this.cAccount = cAccount;
    }

    public String getcPassword() {
        return cPassword;
    }

    public void setcPassword(String cPassword) {
        this.cPassword = cPassword;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Customer1{" +
                "cId=" + cId +
                ", cName='" + cName + '\'' +
                ", cCard='" + cCard + '\'' +
                ", cPhone='" + cPhone + '\'' +
                ", cAccount='" + cAccount + '\'' +
                ", cPassword='" + cPassword + '\'' +
                ", role='" + role + '\'' +
                '}';
    }
}