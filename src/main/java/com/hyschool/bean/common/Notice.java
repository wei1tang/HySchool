package com.hyschool.bean.common;

import java.util.Date;

public class Notice {
    private Integer id;

    private Integer toVipId;

    private Integer fromVipId;

    private String content;

    private Integer type;

    private String url;

    private Boolean haveRead;

    private Boolean isDeleted;

    private Integer annId;

    private Date createTime;

    private Date readTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getToVipId() {
        return toVipId;
    }

    public void setToVipId(Integer toVipId) {
        this.toVipId = toVipId;
    }

    public Integer getFromVipId() {
        return fromVipId;
    }

    public void setFromVipId(Integer fromVipId) {
        this.fromVipId = fromVipId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Boolean getHaveRead() {
        return haveRead;
    }

    public void setHaveRead(Boolean haveRead) {
        this.haveRead = haveRead;
    }

    public Boolean getDeleted() {
        return isDeleted;
    }

    public void setDeleted(Boolean deleted) {
        isDeleted = deleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getReadTime() {
        return readTime;
    }

    public void setReadTime(Date readTime) {
        this.readTime = readTime;
    }

    public Integer getAnnId() {
        return annId;
    }

    public void setAnnId(Integer annId) {
        this.annId = annId;
    }
}