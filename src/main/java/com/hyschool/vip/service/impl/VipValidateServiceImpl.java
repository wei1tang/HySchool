package com.hyschool.vip.service.impl;

import com.hyschool.vip.bean.VipValidate;
import com.hyschool.vip.dao.VipValidateMapper;
import com.hyschool.vip.service.VipValidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by LJW on 2017/1/16.
 */
@Service
public class VipValidateServiceImpl implements VipValidateService {

    @Autowired
    VipValidateMapper vipValidateMapper;

    @Override
    public void createVipValidate(String email, String validateCode) {
        VipValidate vipValidate = new VipValidate();
        vipValidate.setEmail(email);
        vipValidate.setValidateCode(validateCode);
        vipValidateMapper.createVipValidate(vipValidate);
    }

    @Override
    public void updateVipValidate(String email, String validateCode) {
        VipValidate vipValidate = new VipValidate();
        vipValidate.setEmail(email);
        vipValidate.setValidateCode(validateCode);
        vipValidateMapper.updateVipValidate(vipValidate);
    }

    @Override
    public VipValidate findByValidateCode(String validateCode) {
        return vipValidateMapper.findByValidateCode(validateCode);
    }
}
