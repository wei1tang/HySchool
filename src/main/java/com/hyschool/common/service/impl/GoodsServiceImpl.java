package com.hyschool.common.service.impl;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.dao.GoodsMapper;
import com.hyschool.common.service.GoodsImagesService;
import com.hyschool.common.service.GoodsService;
import com.hyschool.enums.CategoryEnum;
import com.hyschool.utils.ConstantsUtil;
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
    @Autowired
    GoodsImagesService goodsImagesService;

    @Override
    public List<Goods> byCategoryAndPass(Integer categoryId, Integer start, Integer pageSize) {
        List<Goods> goodsList = goodsMapper.byCategoryAndState(categoryId, start, pageSize, ConstantsUtil.GOODS_PASS);
        for (Goods goods : goodsList){
            goods.setCategory((CategoryEnum.getByCode(goods.getCategoryId())).getDescription());
            goods.setOnlineTimeFormatted(DateUtil.sdf.format(goods.getOnlineTime()));
            goods.setCoverImageUrl(goodsImagesService.findCoverImage(goods.getId()));
        }
        return goodsList;
    }

    @Override
    public Integer countByCategoryAndPass(Integer categoryId) {
        return goodsMapper.countByCategoryAndState(categoryId, ConstantsUtil.GOODS_PASS);
    }

    @Override
    public void createGoods(Goods goods) {
        goods.setState(ConstantsUtil.GOODS_CREATED);
        goods.setUv(0);
        goods.setTotalComments(0);
        goodsMapper.createGoods(goods);
    }

    @Override
    public void addOneComment(Integer id) {
        goodsMapper.addOneComment(id);
    }
}
