package com.hyschool.common.controller;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.service.GoodsService;
import com.hyschool.vip.bean.Vip;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by LJW on 2017/4/12.
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    GoodsService goodsService;

    @RequestMapping(value = "/release", method = RequestMethod.POST)
    public String releaseGoods(Goods goods, HttpSession session){
        Vip vip = (Vip) session.getAttribute("vip");
        goods.setVipId(vip.getId());
        goodsService.createGoods(goods);
        return null;
    }

}
