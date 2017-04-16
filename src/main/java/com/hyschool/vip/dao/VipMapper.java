package com.hyschool.vip.dao;

import com.hyschool.vip.bean.Vip;

import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface VipMapper {

    Vip findVipWithState(@Param("email")String email,@Param("state")Integer state);

    Vip findVipByEmail(@Param("email")String email);

    Vip findVipById(@Param("id")Integer vipId);

    List<Vip>  findVipAll();

    void createVip(Vip vip);

    void updateInvalidVip(Vip vip);

    void activateVip(@Param("state")Integer state,@Param("email")String email);

    void updateResetPasswordTime(@Param("resetPasswordTime")Date resetPasswordTime,@Param("email")String email);

    void resetPassword(@Param("password")String password,@Param("email")String email);

    void updateInfo(Vip vip);

    void resetType(Vip vip);

    void updateAvatar(Vip vip);

}