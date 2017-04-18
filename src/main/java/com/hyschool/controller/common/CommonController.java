package com.hyschool.controller.common;

import com.hyschool.bean.vip.Vip;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

/**
 * Created by LJW on 2017/3/25.
 */
@Controller
public class CommonController {

    private static Logger logger = LoggerFactory.getLogger(CommonController.class);

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about(){
        return "common/about";
    }

    @RequestMapping(value = "joinUs", method = RequestMethod.GET)
    public String joinUs(){
        return "common/joinUs";
    }

    @RequestMapping(value = "/previewImage", method = RequestMethod.GET)
    public String uploadImage(@RequestParam("filePath") String filePath, HttpServletResponse response){
        FileInputStream inputStream;
        try {
            inputStream = new FileInputStream(filePath);
            int i = inputStream.available();
            //byte数组用于存放图片字节数据
            byte[] buff = new byte[i];
            inputStream.read(buff);
            //记得关闭输入流
            inputStream.close();
            //设置发送到客户端的响应内容类型
            response.setContentType("image/*");
            OutputStream out = response.getOutputStream();
            out.write(buff);
            //关闭响应输出流
            out.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/log")
    public String testLog(){
        logger.debug("debug test");
        logger.info("info test");
        logger.warn("warn test");
        logger.error("error test");
        System.out.println(1/0);
        Vip vip = new Vip();
        System.out.println(vip.getName().indexOf(5));
        return "redirect:/";
    }

}
