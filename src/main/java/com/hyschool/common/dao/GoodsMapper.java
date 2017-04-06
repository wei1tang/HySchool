package com.hyschool.common.dao;

import com.hyschool.common.bean.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {

    List<Goods> byCategoryId(@Param("categoryId") Integer  categoryId, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

    Integer countByCategoryId(@Param("categoryId") Integer categoryId);

}