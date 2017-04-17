package com.hyschool.admin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hyschool.common.bean.Goods;
import com.hyschool.common.service.GoodsService;
import com.hyschool.utils.ConstantsUtil;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LJW on 2017/3/25.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    VipService vipService;
    @Autowired
    GoodsService goodsService;

    @RequestMapping(value = "/homepage",method = RequestMethod.GET)
    public String goAuditGoods(Model model){
        List<Goods> goodsList= goodsService.findAuditAll();
        for (int i = 0; i <goodsList.size() ; i++) {
            if (goodsList.get(i).getState()==ConstantsUtil.GOODS_UNCHECK){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_UNCHECK_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_FAIL){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_FAIL_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_PASS){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_PASS_STR);
            }
            else {
                System.out.println("商品类型不正确");
            }
        }
        model.addAttribute("goodsList",goodsList);
        return "admin/homepage";
    }

    @RequestMapping(value = "/homepage/pass/Id={Id}",method = RequestMethod.GET)
    public String doPass(@PathVariable ("Id") Integer Id,Model model){
        Goods goods = goodsService.byId(Id);
        goods.setState(ConstantsUtil.GOODS_PASS);
        goods.setGoodsStateStr(ConstantsUtil.GOODS_PASS_STR);
        goodsService.stateChange(goods);
        List<Goods> goodsList= goodsService.findAuditAll();
        for (int i = 0; i <goodsList.size() ; i++) {
            if (goodsList.get(i).getState()==ConstantsUtil.GOODS_UNCHECK){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_UNCHECK_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_FAIL){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_FAIL_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_PASS){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_PASS_STR);
            }
            else {
                System.out.println("商品类型不正确");
            }
        }
        model.addAttribute("goodsList",goodsList);
        return "admin/homepage";
    }

    @RequestMapping(value = "/homepage/fail/Id={Id}",method = RequestMethod.GET)
    public String doFail(@PathVariable ("Id") Integer Id,Model model){
        Goods goods = goodsService.byId(Id);
        goods.setState(ConstantsUtil.GOODS_FAIL);
        goods.setGoodsStateStr(ConstantsUtil.GOODS_FAIL_STR);
        goodsService.stateChange(goods);
        List<Goods> goodsList= goodsService.findAuditAll();
        for (int i = 0; i <goodsList.size() ; i++) {
            if (goodsList.get(i).getState()==ConstantsUtil.GOODS_UNCHECK){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_UNCHECK_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_FAIL){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_FAIL_STR);
            }
            else if (goodsList.get(i).getState()==ConstantsUtil.GOODS_PASS){
                goodsList.get(i).setGoodsStateStr(ConstantsUtil.GOODS_PASS_STR);
            }
            else {
                System.out.println("商品类型不正确");
            }
        }
        model.addAttribute("goodsList",goodsList);
        return "admin/homepage";
    }

    @RequestMapping(value = "/superAdmin",method = RequestMethod.GET)
    public String goAuditAdmin(Model model){
        List<Vip> vipList= vipService.findVipAll();
        for (int i = 0; i <vipList.size() ; i++) {
            if (vipList.get(i).getUserType()== ConstantsUtil.USER_VIP)
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_VIP);
            else if(vipList.get(i).getUserType()== ConstantsUtil.USER_ADMIN)
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_ADMIN);
            else
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_SUPER_ADMIN) ;
        }
        model.addAttribute("vipList",vipList);
        return "admin/superAdmin";
    }

    @RequestMapping(value = "/superAdmin/Id={Id}",method = RequestMethod.GET)
    public String auditAdmin(@PathVariable ("Id") Integer Id,Model model){
        Vip vip = vipService.findVipById(Id);
        if (vip.getUserType()==ConstantsUtil.USER_VIP){
            vip.setUserType(ConstantsUtil.USER_ADMIN);
        }
        else if (vip.getUserType()==ConstantsUtil.USER_ADMIN){
            vip.setUserType(ConstantsUtil.USER_VIP);
        }
        else{
            System.out.println("未取值");
        }
        vipService.resetType(vip);
        List<Vip> vipList= vipService.findVipAll();
        for (int i = 0; i <vipList.size() ; i++) {
            if (vipList.get(i).getUserType()== ConstantsUtil.USER_VIP)
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_VIP);
            else if(vipList.get(i).getUserType()== ConstantsUtil.USER_ADMIN)
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_ADMIN);
            else
                vipList.get(i).setStringUserType(ConstantsUtil.STRING_USER_SUPER_ADMIN) ;
        }
        model.addAttribute("vipList",vipList);
        return "admin/superAdmin";
    }


}
