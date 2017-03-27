package com.hyschool;

import org.junit.Test;
import org.springframework.security.crypto.codec.Base64;

import java.io.UnsupportedEncodingException;

/**
 * Created by LJW on 2017/3/27.
 */
public class Base64Test {

    /**
     * byte[] 别用 toString()
     * @throws UnsupportedEncodingException
     */
    @Test
    public void  base64() throws UnsupportedEncodingException {
        String str = "lv jinwang";
        byte[] bytes = str.getBytes();
        String encodeStr = new String(Base64.encode(bytes));
        System.out.println(encodeStr);
        byte[] decodeBytes = Base64.decode(encodeStr.getBytes());
        String decodeStr = new String(decodeBytes,"UTF-8");
        System.out.println(decodeStr);
    }

}
