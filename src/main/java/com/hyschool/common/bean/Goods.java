package com.hyschool.common.bean;

import java.util.Date;

public class Goods {
    private Integer id;

    private Integer categoryId;

    private Integer vipId;

    private String name;

    private Integer state;

    private Double price;

    private Integer stock;

    private String description;

    private String transactionAddress;

    private Date createTime;

    private Date onlineTime;

    private Date offTheShelfTime;

    //额外添加的页面展示元素
    private String category;

    private String onlineTimeFormatted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVipId() {
        return vipId;
    }

    public void setVipId(Integer vipId) {
        this.vipId = vipId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        this.description = description;
    }

    public String getTransactionAddress() {
        return transactionAddress;
    }

    public void setTransactionAddress(String transactionAddress) {
        this.transactionAddress = transactionAddress;
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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getOnlineTimeFormatted() {
        return onlineTimeFormatted;
    }

    public void setOnlineTimeFormatted(String onlineTimeFormatted) {
        this.onlineTimeFormatted = onlineTimeFormatted;
    }
}