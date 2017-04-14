package com.hyschool.utils;

import org.springframework.security.crypto.codec.Base64;

import java.io.*;

/**
 * Created by LJW on 2017/4/14.
 */
public class ImageBase64Util {

    /**
     * 将字符串变为字节数组
     * base64将字节数组编码,new String 返回编码后的字节字符串
     * 解码的时候将编码过的字节字符串的字节数组解码为原字节数组
     * 将字节数组转为字符串返回
     *
     * @param args
     * @throws UnsupportedEncodingException
     */
    public static void main(String[] args) throws IOException {
        String str = "lv jinwang";
        byte[] bytes = str.getBytes();
        String encodeStr = new String(Base64.encode(bytes));
        System.out.println(encodeStr);
        byte[] decodeBytes = Base64.decode(encodeStr.getBytes());
        String decodeStr = new String(decodeBytes, "UTF-8");
        System.out.println(decodeStr);

        //图片编码解码测试
        String base64EncodeString = imageToBase64("E:1.jpg");
        System.out.println(base64EncodeString);
        System.out.println(base64ToImageFile(base64EncodeString, "E:2.jpg"));

    }

    /**
     * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
     * 得到加密后的字节字符串
     *
     * @param path 图片路径
     * @return base64字符串
     */
    public static String imageToBase64(String path) throws IOException {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        byte[] data = null;
        // 读取图片字节数组
        InputStream in = null;
        try {
            in = new FileInputStream(path);
            data = new byte[in.available()];
            in.read(data);
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        String base64EncodeString = new String(Base64.encode(data));
        return base64EncodeString;// 返回Base64编码过的字节数组字符串
    }

    /**
     * 将编码后的字节字符串Base64解码并写图片到指定位置
     *
     * @param base64EncodeString 图片Base64数据
     * @param path              图片保存路径
     * @return
     */
    public static boolean base64ToImageFile(String base64EncodeString, String path) throws IOException {// 对字节数组字符串进行Base64解码并生成图片
        // 生成jpeg图片
        try {
            OutputStream out = new FileOutputStream(path);
            return base64ToImageOutput(base64EncodeString, out);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 处理Base64解码并输出流
     *
     * @param base64EncodeString
     * @param out
     * @return
     */
    private static boolean base64ToImageOutput(String base64EncodeString, OutputStream out) throws IOException {
        if (base64EncodeString == null) { // 图像数据为空
            return false;
        }
        try {
            // Base64解码
            byte[] bytes = Base64.decode(base64EncodeString.getBytes());
            for (int i = 0; i < bytes.length; ++i) {
                if (bytes[i] < 0) {// 调整异常数据
                    bytes[i] += 256;
                }
            }
            // 生成jpeg图片
            out.write(bytes);
            out.flush();
            return true;
        } finally {
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
