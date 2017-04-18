package com.hyschool.dao.vip;

import com.hyschool.bean.vip.VipAddress;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public interface VipAddressMapper {

    void createVipAddress(VipAddress vipAddress);

    void updateVipAddress(VipAddress vipAddress);

    void setAddressDefault(@Param("id") Integer id);

    void deleteVipAddress(@Param("id") Integer id, @Param("deleteTime") Date deleteTime);
}