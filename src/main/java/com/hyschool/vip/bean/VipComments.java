package com.hyschool.vip.bean;

import java.util.Date;

public class VipComments {
    private Integer id;

    private String sallerEmail;

    private String buyerEmail;

    private Double star;

    private Integer state;

    private String content;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSallerEmail() {
        return sallerEmail;
    }

    public void setSallerEmail(String sallerEmail) {
        this.sallerEmail = sallerEmail == null ? null : sallerEmail.trim();
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail == null ? null : buyerEmail.trim();
    }

    public Double getStar() {
        return star;
    }

    public void setStar(Double star) {
        this.star = star;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}