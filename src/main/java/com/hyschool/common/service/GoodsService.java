package com.hyschool.common.service;

import com.hyschool.common.bean.Goods;

import java.util.List;

/**
 * Created by LJW on 2017/4/6.
 */
public interface GoodsService {

    Goods byId(Integer id);

    List<Goods> byCategoryAndPass(Integer categoryId, Integer start, Integer pageSize);

    Integer countByCategoryAndPass(Integer categoryId);

    void createGoods(Goods goods);

    void addOneComment(Integer id);

    void addOneUv(Integer id);

    List<Goods> findAuditAll();

    void stateChange(Goods goods);
}
