package com.hyschool.utils;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LJW on 2017/4/17.
 */
public class SpecialDateEditorUtil extends PropertyEditorSupport {

    private final Logger logger = LoggerFactory.getLogger(getClass());


    /**
     * 让spring mvc逐步识别date类型
     * 完成数据绑定
     *
     * @param text
     * @throws IllegalArgumentException
     */
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        try {
            //防止空数据出错
            if(StringUtils.isNotBlank(text)){
                date = format.parse(text);
            }
        } catch (ParseException e) {
            format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date = format.parse(text);
            } catch (ParseException e1) {
                format = new SimpleDateFormat("yyyy-MM");

                try{
                    date = format.parse(text);
                }catch (Exception e2) {
                    logger.error("自动绑定日期数据出错", e);
                }
            }
        }
        setValue(date);
    }

}
