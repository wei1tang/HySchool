package com.hyschool.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by LJW on 2017/4/19.
 */
public class OrderUtil {

    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

    public static String getOrderNumber() {
        Date date = new Date();
        String orderId = sdf.format(date) + date.getTime();
        return orderId;
    }

    public static void main(String[] args) {
        System.out.println(getOrderNumber());
    }

}
