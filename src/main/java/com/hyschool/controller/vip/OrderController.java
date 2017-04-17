package com.hyschool.controller.vip;

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
    public String confirm(){
        return "order_list";
    }

}
