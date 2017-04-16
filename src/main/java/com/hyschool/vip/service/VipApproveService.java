package com.hyschool.vip.service;

import com.hyschool.vip.bean.VipApprove;

/**
 * Created by LJW on 2017/4/16.
 */
public interface VipApproveService {

    VipApprove byVipIdAndPass(Integer vipId);

}
