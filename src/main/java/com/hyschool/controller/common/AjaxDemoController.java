package com.hyschool.controller.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by LJW on 2017/3/26.
 */
@Controller
public class AjaxDemoController {

    private static Logger logger = LoggerFactory.getLogger(AjaxDemoController.class);

    @RequestMapping(value = "/jsonPage", method = RequestMethod.GET)
    public String goJsonPage(){
        return "jsonPage";
    }

    /**
     * ajax的表单post请求
     * ajax不能直接用redirect重定向,也没必要,可以返回一个href,用window.location.href跳转
     * 但是ajax不是处理重定向的,不如直接post表单
     * @param name
     * @param email
     * @return
     */
    @RequestMapping(value = "/jsonForm", method = RequestMethod.POST)
    @ResponseBody
    public String jsonForm(@RequestParam("name") String name, @RequestParam("email") String email){
        ObjectMapper objectMapper = new ObjectMapper();
        System.out.println(name+","+email);
        String message = "success";
        String href = "http://localhost:8080/index.html";
        Map<String, Object> map = new HashMap<>();
        map.put("message", message);
        map.put("href",href);
        String json = null;
        try {
            json = objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return json;
    }

    /**
     * ajax的get请求
     * @return
     */
    @RequestMapping(value = "/json", method = RequestMethod.GET)
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

    /**
     * ajax封装数据后的post请求
     * @param demo
     * @return
     */
    @RequestMapping(value = "/json", method = RequestMethod.POST)
    @ResponseBody
    public String jsonPost(@RequestParam("demo") String demo){
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> map = new HashMap();
        map.put("status", true);
        System.out.println(demo);
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
