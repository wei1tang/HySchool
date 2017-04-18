package com.hyschool.service.vip;

import com.hyschool.bean.vip.VipValidate;

/**
 * Created by LJW on 2017/1/16.
 */
public interface VipValidateService {

    void createVipValidate(String email,String validateCode);

    void updateVipValidate(String email,String validateCode);

    VipValidate findByValidateCode(String validateCode);

}
