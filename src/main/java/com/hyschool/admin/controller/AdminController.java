package com.hyschool.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by LJW on 2017/3/25.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/homepage")
    public String index(){
        return "admin/homepage";
    }

}
