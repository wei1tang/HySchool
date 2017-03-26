package com.hyschool.common.bean;

import java.util.Date;

public class Notice {
    private Integer id;

    private String toEmail;

    private String fromEmail;

    private String content;

    private Integer type;

    private String url;

    private Byte haveRead;

    private Byte idDelete;

    private Byte idPublicAll;

    private Date createTime;

    private Date readTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getToEmail() {
        return toEmail;
    }

    public void setToEmail(String toEmail) {
        this.toEmail = toEmail == null ? null : toEmail.trim();
    }

    public String getFromEmail() {
        return fromEmail;
    }

    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail == null ? null : fromEmail.trim();
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

    public Byte getHaveRead() {
        return haveRead;
    }

    public void setHaveRead(Byte haveRead) {
        this.haveRead = haveRead;
    }

    public Byte getIdDelete() {
        return idDelete;
    }

    public void setIdDelete(Byte idDelete) {
        this.idDelete = idDelete;
    }

    public Byte getIdPublicAll() {
        return idPublicAll;
    }

    public void setIdPublicAll(Byte idPublicAll) {
        this.idPublicAll = idPublicAll;
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
}