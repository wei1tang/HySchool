package com.hyschool.interceptors;

import com.hyschool.util.ConstantsUtil;
import com.hyschool.util.CookieUtil;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.dao.VipMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lvjinwang on 17-3-6.
 */
public class BusinessInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    VipMapper vipMapper;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        String[] arr = name_email.split("|");
        Vip vip = vipMapper.findVipByEmail(arr[1]);
        if (vip.getUserType() == ConstantsUtil.USER_VIP){
            String path = request.getContextPath();
            response.sendRedirect(path+"/index.html");
            return false;
        }
        return true;
    }

}
