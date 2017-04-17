package com.hyschool.common.controller;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.hyschool.common.bean.Goods;
import com.hyschool.common.service.GoodsService;
import com.hyschool.vip.bean.Vip;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
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
                    public Integer load(String key) throws Exception {
                        return -1;
                    }
                });
    }


    /**
     * 查看商品信息页,在此处增加商品uv
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/no{id}", method = RequestMethod.GET)
    public String viewGoods(@PathVariable("id") Integer id, Model model, HttpSession session) {
        Vip vip = (Vip) session.getAttribute("vip");
        if (localCache.getUnchecked(vip.getEmail()).equals(1)) {
            logger.info("用户: " + vip.getEmail() + " 三十分钟内不再增加UV");
        } else {
            goodsService.addOneUv(id);
            localCache.put(vip.getEmail(), 1);
        }
        Goods goods = goodsService.byId(id);
        model.addAttribute("goods", goods);
        return "common/goods";
    }

    @RequestMapping(value = "/release", method = RequestMethod.POST)
    public String releaseGoods(Goods goods, HttpSession session) {
        Vip vip = (Vip) session.getAttribute("vip");
        goods.setVipId(vip.getId());
        goodsService.createGoods(goods);
        return null;
    }

}
