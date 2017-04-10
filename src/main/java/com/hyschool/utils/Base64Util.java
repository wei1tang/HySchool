package com.hyschool.utils;

import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * Created by LJW on 2017/4/10.
 */
public class Base64Util {

    /**
     * 将字符串文本base64加密
     *
     * @param text
     * @return
     */
    public static String encode(String text){
        final String encoded = Base64
                .getEncoder()
                .encodeToString( text.getBytes( StandardCharsets.UTF_8 ) );
        return encoded;
    }


    /**
     * 将base64加密结果进行解密
     *
     * @param encoded
     * @return
     */
    public static String decode(String encoded){
        final String decoded = new String(
                Base64.getDecoder().decode( encoded ),
                StandardCharsets.UTF_8 );
        return decoded;
    }


    /**
     * 测试
     *
     * @param args
     */
    public static void main(String[] args) {
        String encoded = Base64Util.encode("Base64 finally in Java 8!");
        System.out.println(encoded);
        String decoded = Base64Util.decode(encoded);
        System.out.println(decoded);
    }

}
