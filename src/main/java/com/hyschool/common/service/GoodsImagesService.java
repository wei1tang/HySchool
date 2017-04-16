package com.hyschool.common.service;


import java.util.List;

/**
 * Created by LJW on 2017/4/9.
 */
public interface GoodsImagesService {

    String findCoverImage(Integer goodsId);

    List<String> findEffectiveImagesByGoodsId(Integer goodsId);

}
