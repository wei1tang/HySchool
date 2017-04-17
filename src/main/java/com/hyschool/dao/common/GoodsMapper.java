package com.hyschool.dao.common;

import com.hyschool.bean.common.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodsMapper {

    Goods byId(@Param("id") Integer id);

    List<Goods> byCategoryAndState(@Param("categoryId") Integer categoryId, @Param("start") Integer start,
                                   @Param("pageSize") Integer pageSize, @Param("state") Integer state);

    Integer countByCategoryAndState(@Param("categoryId") Integer categoryId, @Param("state") Integer state);

    void createGoods(Goods goods);

    void addOneComment(@Param("id") Integer id);

    void addOneUv(@Param("id") Integer id);

    List<Goods> findAuditAll();

    void stateChange(Goods goods);

}