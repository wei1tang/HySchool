package com.hyschool.common.bean;

import java.util.Date;

public class GoodsComments {
    private Integer id;

    private Integer goodsId;

    private String makerEmail;

    private String replyEmail;

    private String content;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getMakerEmail() {
        return makerEmail;
    }

    public void setMakerEmail(String makerEmail) {
        this.makerEmail = makerEmail == null ? null : makerEmail.trim();
    }

    public String getReplyEmail() {
        return replyEmail;
    }

    public void setReplyEmail(String replyEmail) {
        this.replyEmail = replyEmail == null ? null : replyEmail.trim();
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