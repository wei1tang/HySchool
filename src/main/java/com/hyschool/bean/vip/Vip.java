package com.hyschool.bean.vip;

import java.util.Calendar;
import java.util.Date;

public class Vip {
    private Integer id;

    private String email;

    private String password;

    private String name;

    private Integer state;

    private Double starRating;

    private Integer userType;

    private String avatarUrl;

    private String selfIntroduction;

    private Date birthday;

    private Date createTime;

    private Date updateTime;

    private Date resetPasswordTime;

    //userType的String显示
    private String stringUserType;

    public String getStringUserType() {
        return stringUserType;
    }

    public void setStringUserType(String stringUserType) {
        this.stringUserType = stringUserType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
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

    public Double getStarRating() {
        return starRating;
    }

    public void setStarRating(Double starRating) {
        this.starRating = starRating;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getSelfIntroduction() {
        return selfIntroduction;
    }

    public void setSelfIntroduction(String selfIntroduction) {
        this.selfIntroduction = selfIntroduction;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getResetPasswordTime() {
        return resetPasswordTime;
    }

    public void setResetPasswordTime(Date resetPasswordTime) {
        this.resetPasswordTime = resetPasswordTime;
    }


    /**
     * 注册激活码的最后有效时间
     * @return
     */
    public Date getLastActivateTime() {
        Calendar cl = Calendar.getInstance();
        cl.setTime(createTime);
        cl.add(Calendar.DATE , 1);
        return cl.getTime();
    }

    /**
     * 重置密码激活码的最后有效时间
     * @return
     */
    public Date getResetLastActivateTime() {
        Calendar cl = Calendar.getInstance();
        cl.setTime(resetPasswordTime);
        cl.add(Calendar.DATE , 1);
        return cl.getTime();
    }
}