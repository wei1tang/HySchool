package com.hyschool.service.vip;

import com.hyschool.bean.vip.VipAddress;

/**
 * Created by LJW on 2017/4/19.
 */
public interface VipAddressService {

    void createVipAddress(VipAddress vipAddress);

    void updateVipAddress(VipAddress vipAddress);

    void setAddressDefault(Integer id);

    void deleteVipAddress(Integer id);

}
