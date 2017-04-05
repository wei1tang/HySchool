package com.hyschool.vip.controller;

import com.hyschool.security.PasswordManager;
import com.hyschool.util.ConstantsUtil;
import com.hyschool.util.CookieUtil;
import com.hyschool.util.ServiceException;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.bean.VipValidate;
import com.hyschool.vip.service.VipService;
import com.hyschool.vip.service.VipValidateService;
import com.hyschool.vip.service.mail.ForgotPasswordService;
import com.hyschool.vip.service.mail.RegisterValidateService;
import org.apache.commons.validator.routines.EmailValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

/**
 * Created by LJW on 2017/1/12.
 */
@Controller
@RequestMapping("/vip")
public class VipController {

    @Autowired
    VipService vipService;
    @Autowired
    VipValidateService vipValidateService;
    @Autowired
    PasswordManager passwordManager;
    @Autowired
    RegisterValidateService registerValidateService;
    @Autowired
    ForgotPasswordService forgotPasswordService;

    private static Logger logger = LoggerFactory.getLogger(VipController.class);

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String goLogin(HttpServletRequest request){
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        if (name_email!=null && !name_email.equals(""))
            return "redirect:/index";
        return "login";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String doLogin(@RequestParam("email")String email, @RequestParam("password")String password,
                          Model model, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        String error;
        boolean isValid = EmailValidator.getInstance().isValid(email);
        if (email == null || email.equals("") || !isValid){
            error = "邮箱格式不正确";
            model.addAttribute("error",error);
            return "login";
        }
        if (password == null || password.equals("")){
            error = "密码不能为空";
            model.addAttribute("error",error);
            return "login";
        }
        Vip vip = vipService.findAvailableVip(email);
        if (vip == null){
            error = "账号不存在";
            model.addAttribute("error",error);
            return "login";
        }else if (!passwordManager.isPasswordValid(vip.getPassword(),password)){
            error = "密码错误";
            model.addAttribute("error",error);
            return "login";
        }
        CookieUtil.addLoginCookie(response,vip);
        session.setAttribute("vip",vip);
        logger.info("Vip:  "+vip.getName()+"|"+vip.getEmail()+"  成功登录!");
        return "redirect:/index";
    }

    @RequestMapping(value = "logout",method = RequestMethod.GET)
    public String logout(HttpServletResponse response,HttpServletRequest request) throws UnsupportedEncodingException {
        String name_email = CookieUtil.getLoginVipNameEmail(request);
        CookieUtil.removeLoginCookie(response);
        if (name_email!=null && !name_email.equals("")){
            name_email = URLDecoder.decode(name_email, ConstantsUtil.ENCODING);
            logger.info("Vip:  "+name_email+"  成功登出!");
        }
        return "redirect:/index";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String goRegister(Model model){
        String type = "register";
        model.addAttribute("type",type);
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String doRegister(Model model, @RequestParam("email")String email, @RequestParam("name")String name,
                             @RequestParam("password1")String password1, @RequestParam("password2")String password2){
        boolean isValid = EmailValidator.getInstance().isValid(email);
        if (!isValid){
            String message = "邮箱格式不正确";
            model.addAttribute("message",message);
            return "vip/register_error";
        }
        if ((!password1.equals(password2))||password1.equals(null)||password2.equals(null)){
            String message = "密码输入不规范";
            model.addAttribute("message",message);
            return "vip/register_error";
        }

        Vip availableVip = vipService.findAvailableVip(email);
        if (availableVip!=null){
            String message = "邮箱已存在，请直接登录。";
            model.addAttribute("message",message);
            return "vip/register_error";
        }
        Vip invalidVip = vipService.findInvalidVip(email);
        if (invalidVip!=null){
            String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
            password1 = passwordManager.encryptPassword(password1);
            Date date = new Date();
            vipService.updateInvalidVip(name,email,password1,date);
            vipValidateService.updateVipValidate(email,validateCode);
            registerValidateService.processRegister(email,validateCode);
            return "vip/activate_prompt";
        }

        String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
        password1 = passwordManager.encryptPassword(password1);
        Date date = new Date();
        //java.sql.Date sqldDate = new java.sql.Date(date.getTime());
        vipService.createVip(name,email,password1,date);
        vipValidateService.createVipValidate(email,validateCode);
        registerValidateService.processRegister(email,validateCode);
        return "vip/activate_prompt";
    }

    @RequestMapping(value = "/activate",method = RequestMethod.GET)
    public String activate(Model model,@RequestParam("email")String email, @RequestParam("validateCode")String validateCode){
        try {
            registerValidateService.processActivate(email , validateCode);//调用激活方法
            return "vip/activate_success";
        } catch (ServiceException e) {
            model.addAttribute("message" , e.getMessage());
            return "vip/activate_failure";
        }
    }

    @RequestMapping(value = "/forgotPassword",method = RequestMethod.POST)
    public String goForgotPassword(Model model,@RequestParam("email")String email){
        boolean isValid = EmailValidator.getInstance().isValid(email);
        if (!isValid){
            String message = "邮箱格式不正确";
            model.addAttribute("message",message);
            return "vip/register_error";
        }
        Vip vip = vipService.findAvailableVip(email);
        if (vip == null){
            String message = "邮箱不存在，请重新输入。";
            model.addAttribute("message",message);
            return "vip/register_error";
        }
        //生成验证码，发邮箱进行改密码
        String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
        vipValidateService.updateVipValidate(email,validateCode);
        Date resetPasswordTime = new Date();
        vipService.updateResetPasswordTime(resetPasswordTime,email);
        forgotPasswordService.processForgotPassword(email,validateCode);
        return "login";
    }

    @RequestMapping(value = "/resetPassword",method = RequestMethod.GET)
    public String goResetPassword(Model model, @RequestParam("validateCode")String validateCode){
        VipValidate vipValidate = vipValidateService.findByValidateCode(validateCode);
        String email = vipValidate == null? null : vipValidate.getEmail();
        if (email != null){
            Vip vip = vipService.findAvailableVip(email);
            if (vip!=null){
                Date currentTime = new Date();
                if(currentTime.before(vip.getResetLastActivateTime())) {
                    model.addAttribute("email",email);
                    return "vip/reset_password";
                }
            }else {
                String message = "邮箱账号不存在。";
                model.addAttribute("message",message);
                return "vip/register_error";
            }
        }

        String message = "验证码已过期。";
        model.addAttribute("message",message);
        return "vip/register_error";
    }

    @RequestMapping(value = "/resetPassword",method = RequestMethod.POST)
    public String doResetPassword(Model model,@RequestParam("email")String email,@RequestParam("password1")String password1,
                                  @RequestParam("password2")String password2){
        if ((!password1.equals(password2))||password1.equals(null)||password2.equals(null)){
            String message = "密码输入不规范";
            model.addAttribute("message",message);
            return "vip/register_error";
        }
        password1 = passwordManager.encryptPassword(password1);
        vipService.resetPassword(password1,email);
        vipValidateService.updateVipValidate(email,null);
        return "login";
    }


//    @RequestMapping(value = "/info")





}
