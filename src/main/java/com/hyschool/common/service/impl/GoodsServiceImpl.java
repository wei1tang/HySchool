package com.hyschool.common.service.impl;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.dao.GoodsMapper;
import com.hyschool.common.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LJW on 2017/4/6.
 */
@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    GoodsMapper goodsMapper;

    @Override
    public List<Goods> byCategoryId(Integer categoryId, Integer start, Integer pageSize) {
        return goodsMapper.byCategoryId(categoryId, start, pageSize);
    }

    @Override
    public Integer countByCategoryId(Integer categoryId) {
        return goodsMapper.countByCategoryId(categoryId);
    }
}
