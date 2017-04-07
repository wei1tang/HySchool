package com.hyschool.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LJW on 2017/4/7.
 */
public class DateUtil {

    public static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static Long dateToTimestamp(Date date) {
        return date == null ? null : date.getTime();
    }

    public static void main(String[] args) {
        System.out.println(dateToTimestamp(new Date()));
    }

}
