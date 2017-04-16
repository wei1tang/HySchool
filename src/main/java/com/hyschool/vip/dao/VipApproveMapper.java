package com.hyschool.vip.dao;

import com.hyschool.vip.bean.VipApprove;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VipApproveMapper {

    VipApprove byVipIdAndState(@Param("vipId") Integer vipId, @Param("state") Integer state);

}