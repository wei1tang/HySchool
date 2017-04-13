package com.hyschool.utils;

import java.util.UUID;

/**
 * Created by LJW on 2017/4/13.
 */
public class UploadImageUtil {

    private static String getUUID() {
        String s = UUID.randomUUID().toString();
        return s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24);
    }

    public static void main(String[] args) {
        System.out.println(getUUID());
        System.out.println(System.currentTimeMillis());
    }

    public static void UploadImageUtil(String folderPath){

    }

}
