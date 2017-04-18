package com.hyschool.service.vip.impl;

import com.hyschool.bean.vip.VipAddress;
import com.hyschool.dao.vip.VipAddressMapper;
import com.hyschool.service.vip.VipAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by LJW on 2017/4/19.
 */
@Service
public class VipAddressServiceImpl implements VipAddressService {

    @Autowired
    VipAddressMapper vipAddressMapper;

    @Override
    public void createVipAddress(VipAddress vipAddress) {
        vipAddress.setCreateTime(new Date());
        vipAddress.setIsDefault(false);
        vipAddress.setIsDeleted(false);
        vipAddressMapper.createVipAddress(vipAddress);
    }

    @Override
    public void updateVipAddress(VipAddress vipAddress) {
        vipAddressMapper.updateVipAddress(vipAddress);
    }

    @Override
    public void setAddressDefault(Integer id) {
        vipAddressMapper.setAddressDefault(id);
    }

    @Override
    public void deleteVipAddress(Integer id) {
        Date deleteTime = new Date();
        vipAddressMapper.deleteVipAddress(id, deleteTime);
    }
}
