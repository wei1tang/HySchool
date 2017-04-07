package com.hyschool.common.controller;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.service.GoodsService;
import com.hyschool.enums.CategoryEnum;
import com.hyschool.utils.DateUtil;
import com.hyschool.utils.PageUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by LJW on 2017/1/12.
 */
@Controller
public class IndexController {

    @Autowired
    GoodsService goodsService;

    private static final int DEFAULT_CATEGORY_ID = 1;

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String goIndex(@RequestParam(value = "pageNo", required = false) Integer pageNo, Model model,
                          @RequestParam(value = "categoryId", required = false) Integer categoryId){
        if (pageNo == null){
            pageNo = PageUtil.DEFAULT_PAGE_NO;
        }
        if (categoryId == null){
            categoryId = DEFAULT_CATEGORY_ID;
        }
        Integer start = PageUtil.getStartOfPage(pageNo, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        List<Goods> goodsList = goodsService.byCategoryId(categoryId, start, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        Integer count = goodsService.countByCategoryId(categoryId);
        Integer pageCount = PageUtil.getTotalPageCount(count, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("goodsList", goodsList);
        return "index";
    }

}
