package com.hyschool.vip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by lvjinwang on 17-3-6.
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    String confirm(){
        return "order_list";
    }

}
