package com.hyschool.common.service.impl;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.dao.GoodsMapper;
import com.hyschool.common.service.GoodsService;
import com.hyschool.enums.CategoryEnum;
import com.hyschool.utils.DateUtil;
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
        List<Goods> goodsList = goodsMapper.byCategoryId(categoryId, start, pageSize);
        for (Goods goods : goodsList){
            goods.setCategory((CategoryEnum.getByCode(goods.getCategoryId())).getDescription());
            goods.setOnlineTimeFormatted(DateUtil.sdf.format(goods.getOnlineTime()));
        }
        return goodsList;
    }

    @Override
    public Integer countByCategoryId(Integer categoryId) {
        return goodsMapper.countByCategoryId(categoryId);
    }
}
