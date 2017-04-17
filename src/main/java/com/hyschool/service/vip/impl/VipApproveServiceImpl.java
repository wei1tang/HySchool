package com.hyschool.service.vip.impl;

import com.hyschool.utils.ConstantsUtil;
import com.hyschool.bean.vip.VipApprove;
import com.hyschool.dao.vip.VipApproveMapper;
import com.hyschool.service.vip.VipApproveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by LJW on 2017/4/16.
 */
@Service
public class VipApproveServiceImpl implements VipApproveService {

    @Autowired
    VipApproveMapper vipApproveMapper;

    @Override
    public VipApprove byVipIdAndPass(Integer vipId) {
        return vipApproveMapper.byVipIdAndState(vipId, ConstantsUtil.VIP_APPROVE_PASS);
    }

}
