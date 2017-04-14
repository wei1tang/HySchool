package com.hyschool.common.controller;

import com.hyschool.vip.bean.Vip;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by LJW on 2017/3/25.
 */
@Controller
public class CommonController {

    private static Logger logger = LoggerFactory.getLogger(CommonController.class);

    @RequestMapping("/about")
    public String about(){
        return "common/about";
    }

    @RequestMapping("/log")
    public String testLog(){
        logger.debug("debug test");
        logger.info("info test");
        logger.warn("warn test");
        logger.error("error test");
        Vip vip = new Vip();
        System.out.println(vip.getName().indexOf(5));
        return "redirect:/";
    }

}
