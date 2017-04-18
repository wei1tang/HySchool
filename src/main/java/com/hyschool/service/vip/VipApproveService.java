package com.hyschool.service.vip;

import com.hyschool.bean.vip.VipApprove;

/**
 * Created by LJW on 2017/4/16.
 */
public interface VipApproveService {

    VipApprove byVipIdAndPass(Integer vipId);

}
