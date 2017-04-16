package com.hyschool.vip.service.impl;

import com.hyschool.utils.ConstantsUtil;
import com.hyschool.vip.bean.VipApprove;
import com.hyschool.vip.dao.VipApproveMapper;
import com.hyschool.vip.service.VipApproveService;
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
