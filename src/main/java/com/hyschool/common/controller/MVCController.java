package com.hyschool.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by LJW on 2017/3/22.
 */
@Controller
@RequestMapping("/mvc")
public class MVCController {


    @RequestMapping("/demo")
    public String demo(){

        return null;
    }


    @RequestMapping(value = "/redirect.html", method = RequestMethod.GET)
    public String flash(@RequestParam("flash") String flash, RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("flash", flash);
        return "redirect:/mvc/showRedirect.html";//拼接url
    }

    @RequestMapping(value = "/showRedirect.html", method = RequestMethod.GET)
    public String showFlash(@ModelAttribute("flash")String flash){
        System.out.println(flash);
        return "login";
    }





    @RequestMapping(value = "/forward.html", method = RequestMethod.GET)
    public String forward(){
        return "forward:/mvc/showForward.html";
    }

    @RequestMapping(value = "/showForward.html", method = RequestMethod.GET)
    public String showForward(@RequestParam("flash")String flash){
        System.out.println(flash);//success
        return "login";
    }

}