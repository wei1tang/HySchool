package com.hyschool.controller.common;

import com.hyschool.bean.common.Goods;
import com.hyschool.service.common.GoodsService;
import com.hyschool.utils.CookieUtil;
import com.hyschool.utils.PageUtil;
import com.hyschool.bean.vip.Vip;
import com.hyschool.service.vip.VipService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by LJW on 2017/1/12.
 */
@Controller
public class IndexController {

    @Autowired
    GoodsService goodsService;
    @Autowired
    VipService vipService;

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);


    /**
     * 只显示主页的第一页
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String goIndex(Model model, HttpServletRequest request){
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        String[] arr = StringUtils.split(name_email, "_");
        if (arr != null && arr.length == 2){
            Vip vip = vipService.findAvailableVip(arr[1]);
            request.getSession().setAttribute("vip", vip);
        }
        Integer pageNo = PageUtil.DEFAULT_PAGE_NO;
        Integer start = PageUtil.getStartOfPage(pageNo, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        List<Goods> goodsList = goodsService.byCategoryAndPass(PageUtil.DEFAULT_CATEGORY_ID, start, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        Integer count = goodsService.countByCategoryAndPass(PageUtil.DEFAULT_CATEGORY_ID);
        Integer totalPages = PageUtil.getTotalPageCount(count, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        String uri = request.getRequestURI();
        model.addAttribute("pageUri", uri + "pno");
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("goodsList", goodsList);
        return "index";
    }

    /**
     * restful风格的主页分页显示
     *
     * @param pageNo
     * @param model
     * @return
     */
    @RequestMapping(value = "/pno{pageNo}",method = RequestMethod.GET)
    public String goIndex(@PathVariable("pageNo") Integer pageNo, Model model, HttpServletRequest request){
        if (pageNo == null || pageNo < 1){
            pageNo = PageUtil.DEFAULT_PAGE_NO;
        }
        Integer start = PageUtil.getStartOfPage(pageNo, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        List<Goods> goodsList = goodsService.byCategoryAndPass(PageUtil.DEFAULT_CATEGORY_ID, start, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        Integer count = goodsService.countByCategoryAndPass(PageUtil.DEFAULT_CATEGORY_ID);
        Integer totalPages = PageUtil.getTotalPageCount(count, PageUtil.Goods_DEFAULT_PAGE_SIZE);
        String uri = request.getRequestURI();
        model.addAttribute("pageUri", uri.substring(0, uri.length()-1));
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("goodsList", goodsList);
        return "index";
    }


}
