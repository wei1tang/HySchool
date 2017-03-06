package com.hyschool.interceptors;

import com.hyschool.util.CookieUtil;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.dao.VipMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by LJW on 2017/3/1.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{

    @Autowired
    VipMapper vipMapper;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        if (name_email == null || name_email.equals("")){
            String path = request.getContextPath();
            response.sendRedirect(path+"/vip/login.html");
            return false;
        }
        String[] arr = name_email.split("|");
        Vip vip = vipMapper.findVipByEmail(arr[1]);
        request.getSession().setAttribute("vip",vip);
        return true;
    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
            throws Exception {
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
    }
}
