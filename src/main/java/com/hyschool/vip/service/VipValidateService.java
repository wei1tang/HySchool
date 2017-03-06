package com.hyschool.vip.service;

import com.hyschool.vip.bean.VipValidate;

/**
 * Created by LJW on 2017/1/16.
 */
public interface VipValidateService {

    void createVipValidate(String email,String validateCode);

    void updateVipValidate(String email,String validateCode);

    VipValidate findByValidateCode(String validateCode);

}
