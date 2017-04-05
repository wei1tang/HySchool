package com.hyschool.vip.service;

import com.hyschool.vip.bean.Vip;

import java.util.Date;

/**
 * Created by LJW on 2017/1/15.
 */
public interface VipService {

    Vip findAvailableVip(String mail);

    Vip findInvalidVip(String mail);

    void createVip(String name, String email, String password, Date createTime);

    void updateInvalidVip(String name, String email,String password, Date createTime);

    void updateResetPasswordTime(Date resetPasswordTime,String email);

    void resetPassword(String password,String email);

    void updateInfo(Vip vip);
}
