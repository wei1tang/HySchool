package com.hyschool.common.dao;

import com.hyschool.common.bean.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {

    List<Goods> byCategoryAndState(@Param("categoryId") Integer categoryId, @Param("start") Integer start,
                                   @Param("pageSize") Integer pageSize, @Param("state") Integer state);

    Integer countByCategoryAndState(@Param("categoryId") Integer categoryId, @Param("state") Integer state);

    void createGoods(Goods goods);

    void addOneComment(@Param("id") Integer id);

}