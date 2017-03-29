package com.hyschool.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;

/**
 * Created by LJW on 2017/3/28.
 */
@Service
public class SpringUtil implements ApplicationContextAware {

    private static ApplicationContext ctx;

    /**
     * 根据名字获得bean
     * @param name
     * @return
     */
    public static Object getBean(String name){
        return ctx.getBean(name);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        ctx = applicationContext;
    }

}
