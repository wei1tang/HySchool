package com.hyschool.security.interceptors;

import com.hyschool.utils.CookieUtil;
import com.hyschool.bean.vip.Vip;
import com.hyschool.service.vip.VipService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by LJW on 2017/3/1.
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    private static Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

    @Autowired
    VipService vipService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String contextPath = request.getContextPath();
        if (!this.isLoginIn(request)) {
            response.sendRedirect(contextPath + "/vip/login");
            return false;
        }
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


    private boolean isLoginIn(HttpServletRequest request) {
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        if (name_email == null || name_email.equals("")) {
            logger.error("cookie does't have logincookie.");
            return false;
        }
        String[] arr = StringUtils.split(name_email, "_");
        if (arr == null || arr.length != 2) {
            logger.error("logincookie format error.");
            return false;
        }
        Vip vip = vipService.findAvailableVip(arr[1]);
        request.getSession().setAttribute("vip", vip);
        return true;
    }

}
