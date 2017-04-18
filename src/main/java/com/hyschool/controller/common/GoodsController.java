package com.hyschool.controller.common;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.hyschool.bean.common.Goods;
import com.hyschool.service.common.GoodsService;
import com.hyschool.bean.vip.Vip;
import com.hyschool.utils.SpecialDateEditorUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 * Created by LJW on 2017/4/12.
 */
@Controller
@RequestMapping("/goods")
public class GoodsController implements InitializingBean {

    @Autowired
    GoodsService goodsService;

    private LoadingCache<String, Integer> localCache;

    private static Logger logger = LoggerFactory.getLogger(GoodsController.class);

    /**
     * 缓存做商品的浏览量uv,30分钟内用户刷新界面不增加uv
     * email为缓存的key
     *
     * @throws Exception
     */
    @Override
    public void afterPropertiesSet() throws Exception {
        localCache = CacheBuilder.newBuilder().expireAfterWrite(30, TimeUnit.MINUTES).maximumSize(10000L)
                .build(new CacheLoader<String, Integer>() {
                    @Override
                    public Integer load(String ip) throws Exception {
                        return -1;
                    }
                });
    }


    /**
     * 查看商品信息页,在此处增加商品uv
     *
     * @param id
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/no{id}", method = RequestMethod.GET)
    public String viewGoods(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (localCache.getUnchecked(ip).equals(1)) {
            logger.info("用户: " + ip + " 三十分钟内不再增加UV");
        } else {
            goodsService.addOneUv(id);
            localCache.put(ip, 1);
        }
        Goods goods = goodsService.byId(id);
        model.addAttribute("goods", goods);
        return "common/goods";
    }


    /**
     * spring mvc date数据绑定
     *
     * @param webDataBinder
     */
    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        webDataBinder.registerCustomEditor(Date.class, new SpecialDateEditorUtil());
    }



    @RequestMapping(value = "/release", method = RequestMethod.POST)
    public String releaseGoods(Goods goods, HttpSession session) {
        Vip vip = (Vip) session.getAttribute("vip");
        goods.setVipId(vip.getId());
        goodsService.createGoods(goods);
        return null;
    }

}
