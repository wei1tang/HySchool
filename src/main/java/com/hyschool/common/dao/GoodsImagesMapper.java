package com.hyschool.common.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsImagesMapper {

    String findCoverImage(@Param("goodsId") Integer goodsId);

}