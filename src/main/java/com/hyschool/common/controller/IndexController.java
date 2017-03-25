package com.hyschool.common.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LJW on 2017/1/12.
 */
@Controller
@RequestMapping("")
public class IndexController {

    private static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(value = "/index.html",method = RequestMethod.GET)
    public String goIndex(Model model){
        model.addAttribute("test","test");
        return "index";
    }

    @RequestMapping(value = "jsonpage.html", method = RequestMethod.GET)
    public String goJsonPage(){
        return "jsonPage";
    }

    @RequestMapping(value = "json.html", method = RequestMethod.GET)
    @ResponseBody
    public String encode(){
        ObjectMapper objectMapper = new ObjectMapper();
        String str = "文章内容不完整/图片不显示/视频无法播放，请重新编辑提交";
        Map<String, Object> map = new HashMap();
        map.put("status", true);
        try {
            str = URLEncoder.encode(str, "UTF-8");
        } catch (Exception e) {
            logger.warn("encoder failed!", e);
        }
        map.put("str", str);

        String json = null;
        try {
            json =  objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    @RequestMapping(value = "json.html", method = RequestMethod.POST)
    @ResponseBody
    public String jsonPost(@RequestParam("demo") String demo){
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap();
        map.put("status", true);
        try {
            demo = URLEncoder.encode(demo, "UTF-8");
        } catch (Exception e) {
            logger.warn("encoder failed!", e);
        }
        map.put("demo", demo);

        String json = null;
        try {
            json =  objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }
}
