package com.hyschool.utils;

import com.hyschool.vip.bean.Vip;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * Created by LJW on 2017/3/2.
 */
public class CookieUtil {

    private static final String LOGIN_COOKIE_NAME = "login_vip";
    private static final String DOMAIN = "localhost";
    private static final String PATH = "/";
    private static final int REMEMBER_ME_COOKIE_EXPIRE = 24 * 3600;

    /**
     * 添加登录cookie
     *
     * @param response
     * @param vip
     */
    public static void addLoginCookie(HttpServletResponse response, Vip vip) throws UnsupportedEncodingException {
        String email = vip.getEmail();
        String name = vip.getName();
        String name_email = name+"_"+email;
        addCookie(response, LOGIN_COOKIE_NAME, name_email, REMEMBER_ME_COOKIE_EXPIRE, DOMAIN, PATH);
    }

    private static void addCookie(HttpServletResponse response, String cookie_name, String name_email, int maxAge, String domain,
                                 String path) throws UnsupportedEncodingException {
        Cookie cookie = new Cookie(cookie_name, URLEncoder.encode(name_email, ConstantsUtil.ENCODING));
        cookie.setDomain(domain);
        cookie.setPath(path);
        cookie.setMaxAge(maxAge);
        response.addCookie(cookie);
    }


    /**
     * 得到登录的用户邮箱
     *
     * @param request
     * @return
     */
    public static String getLoginVipNameEmail(HttpServletRequest request) {
        return getByCookieName(request, LOGIN_COOKIE_NAME);
    }

    private static String getByCookieName(HttpServletRequest request,String cookie_name){
        String name_email = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie: cookies) {
                if (cookie != null && cookie.getName() != null && cookie.getName().equals(cookie_name)){
                    try {
                        name_email = URLDecoder.decode(cookie.getValue(), ConstantsUtil.ENCODING);
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    break;
                }
            }
        }
        return name_email;
    }


    /**
     * 删除登录cookie
     *
     * @param response
     */
    public static void removeLoginCookie(HttpServletResponse response) {
        removeCookie(response, LOGIN_COOKIE_NAME, DOMAIN, PATH);
    }

    private static void removeCookie(HttpServletResponse response, String cookie_name, String domain, String path) {
        Cookie cookie = new Cookie(cookie_name, null);
        cookie.setMaxAge(0);
        cookie.setDomain(domain);
        cookie.setPath(path);
        response.addCookie(cookie);
    }
}
