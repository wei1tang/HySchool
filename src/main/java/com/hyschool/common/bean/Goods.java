package com.hyschool.common.bean;

import java.util.Date;

public class Goods {
    private Integer id;

    private Integer categoryId;

    private String vipEmail;

    private String name;

    private Integer state;

    private Double price;

    private Integer stock;

    private String description;

    private String transactionAddress;

    private Byte isOffTheShelf;

    private Date createTime;

    private Date onlineTime;

    private Date offTheShelfTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getVipEmail() {
        return vipEmail;
    }

    public void setVipEmail(String vipEmail) {
        this.vipEmail = vipEmail == null ? null : vipEmail.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getTransactionAddress() {
        return transactionAddress;
    }

    public void setTransactionAddress(String transactionAddress) {
        this.transactionAddress = transactionAddress == null ? null : transactionAddress.trim();
    }

    public Byte getIsOffTheShelf() {
        return isOffTheShelf;
    }

    public void setIsOffTheShelf(Byte isOffTheShelf) {
        this.isOffTheShelf = isOffTheShelf;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getOnlineTime() {
        return onlineTime;
    }

    public void setOnlineTime(Date onlineTime) {
        this.onlineTime = onlineTime;
    }

    public Date getOffTheShelfTime() {
        return offTheShelfTime;
    }

    public void setOffTheShelfTime(Date offTheShelfTime) {
        this.offTheShelfTime = offTheShelfTime;
    }
}