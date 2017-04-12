package com.hyschool.common.controller;

import com.hyschool.common.bean.Goods;
import com.hyschool.common.service.GoodsService;
import com.hyschool.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJW on 2017/4/9.
 */
@Controller
public class CategoryController {

    @Autowired
    GoodsService goodsService;

    /**
     * 根据category的id显示第一页商品
     *
     * @param categoryId
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/category{categoryId}", method = RequestMethod.GET)
    public String byCategoryId(@PathVariable("categoryId") Integer categoryId, Model model, HttpServletRequest request){
        if (categoryId == null || categoryId < 1 || categoryId > 12){
            categoryId = PageUtil.DEFAULT_CATEGORY_ID;
        }
        Integer pageNo = PageUtil.DEFAULT_PAGE_NO;
        Integer start = PageUtil.getStartOfPage(pageNo, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        List<Goods> goodsList = goodsService.byCategoryAndPass(categoryId, start, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        Integer count = goodsService.countByCategoryAndPass(categoryId);
        Integer totalPages = PageUtil.getTotalPageCount(count, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        String uri = request.getRequestURI();
        model.addAttribute("pageUri", uri + "/pno");
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("goodsList", goodsList);
        return "index";
    }


    /**
     * 根据categoryId和pageNo生成分页
     *
     * @param categoryId
     * @param request
     * @param pageNo
     * @param model
     * @return
     */
    @RequestMapping(value = "/category{categoryId}/pno{pageNo}", method = RequestMethod.GET)
    public String byIdAndPageNo(@PathVariable("categoryId") Integer categoryId, HttpServletRequest request,
                                @PathVariable("pageNo") Integer pageNo, Model model){
        if (categoryId == null || categoryId < 1 || categoryId > 12){
            categoryId = PageUtil.DEFAULT_CATEGORY_ID;
        }
        if (pageNo == null || pageNo < 1){
            pageNo = PageUtil.DEFAULT_PAGE_NO;
        }
        Integer start = PageUtil.getStartOfPage(pageNo, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        List<Goods> goodsList = goodsService.byCategoryAndPass(categoryId, start, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        Integer count = goodsService.countByCategoryAndPass(categoryId);
        Integer totalPages = PageUtil.getTotalPageCount(count, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        String uri = request.getRequestURI();
        model.addAttribute("pageUri", uri.substring(0, uri.length()-1));
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("goodsList", goodsList);
        return "index";
    }

}
