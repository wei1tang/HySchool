package com.hyschool.dao.vip;

import com.hyschool.bean.vip.VipApprove;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VipApproveMapper {

    VipApprove byVipIdAndState(@Param("vipId") Integer vipId, @Param("state") Integer state);

}