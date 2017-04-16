package com.hyschool.common.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsImagesMapper {

    String findCoverImage(@Param("goodsId") Integer goodsId);

    List<String> byGoodsIdAndState(@Param("goodsId") Integer goodsId, @Param("state") Integer state);

}