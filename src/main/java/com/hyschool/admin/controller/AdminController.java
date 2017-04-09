package com.hyschool.admin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hyschool.utils.ConstantsUtil;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/homepage")
    public String index(){
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

    @RequestMapping(value = "/superAdmin",method = RequestMethod.POST)
    @ResponseBody
    public String auditAdmin(@RequestParam("vipId") Integer vipId){
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println(vipId);
        Map<String, Object> map = new HashMap();
        Vip vip = vipService.findVipById(vipId);
        if (vip.getUserType()==ConstantsUtil.USER_VIP)
            vip.setUserType(ConstantsUtil.USER_ADMIN);
        else {
            vip.setUserType(ConstantsUtil.USER_VIP);
        }
        map.put("stringUserType",vip.getStringUserType());
        String data=null;
        try {
            data=objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return data;
    }

}
