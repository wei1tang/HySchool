package com.hyschool.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by LJW on 2017/3/22.
 */
@Controller
@RequestMapping("/mvc")
public class MVCController {

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String flash(@RequestParam("flash") String flash, RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("flash", flash);
        return "redirect:/mvc/showRedirect";//拼接url
    }

    @RequestMapping(value = "/showRedirect", method = RequestMethod.GET)
    public String showFlash(@ModelAttribute("flash")String flash){
        System.out.println(flash);
        return "login";
    }





    @RequestMapping(value = "/forward", method = RequestMethod.GET)
    public String forward(){
        return "forward:/mvc/showForward.html";
    }

    @RequestMapping(value = "/showForward.html", method = RequestMethod.GET)
    public String showForward(@RequestParam("flash")String flash){
        System.out.println(flash);//success
        return "login";
    }



    @RequestMapping(path="/owners/{ownerId}", method=RequestMethod.GET)
    public String findOwner(@PathVariable("ownerId") String theOwner, Model model) {
        // 具体的方法代码…
        return null;
    }

}
