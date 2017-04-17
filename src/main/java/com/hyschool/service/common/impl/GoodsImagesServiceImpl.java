package com.hyschool.service.common.impl;

import com.hyschool.dao.common.GoodsImagesMapper;
import com.hyschool.service.common.GoodsImagesService;
import com.hyschool.utils.ConstantsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LJW on 2017/4/9.
 */
@Service
public class GoodsImagesServiceImpl implements GoodsImagesService {

    @Autowired
    GoodsImagesMapper goodsImagesMapper;

    @Override
    public String findCoverImage(Integer goodsId) {
        return goodsImagesMapper.findCoverImage(goodsId);
    }

    @Override
    public List<String> findEffectiveImagesByGoodsId(Integer goodsId) {
        return goodsImagesMapper.byGoodsIdAndState(goodsId, ConstantsUtil.IMAGES_EFFECTIVE);
    }

}
