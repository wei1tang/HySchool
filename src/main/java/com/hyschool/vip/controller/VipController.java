package com.hyschool.vip.controller;

import com.hyschool.security.PasswordManager;
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

    @RequestMapping(value = "/login.html",method = RequestMethod.GET)
    public String goLogin(){
        return "login";
    }



    @RequestMapping(value = "/register.html",method = RequestMethod.GET)
    public String goRegister(Model model){
        String type = "register";
        model.addAttribute("type",type);
        return "login";
    }

    @RequestMapping(value = "/register.html",method = RequestMethod.POST)
    public String doRegister(Model model, @RequestParam("email")String email, @RequestParam("name")String name,
                             @RequestParam("password1")String password1, @RequestParam("password2")String password2){
        boolean isValid = EmailValidator.getInstance().isValid(email);
        if (!isValid){
            String message = "邮箱格式不正确";
            model.addAttribute("message",message);
            return "register_error";
        }
        if ((!password1.equals(password2))||password1.equals(null)||password2.equals(null)){
            String message = "密码输入不规范";
            model.addAttribute("message",message);
            return "register_error";
        }

        Vip availableVip = vipService.findAvailableVip(email);
        if (availableVip!=null){
            String message = "邮箱已存在，请直接登录。";
            model.addAttribute("message",message);
            return "register_error";
        }
        Vip invalidVip = vipService.findInvalidVip(email);
        if (invalidVip!=null){
            String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
            password1 = passwordManager.encryptPassword(password1);
            Date date = new Date();
            vipService.updateInvalidVip(name,email,password1,date);
            vipValidateService.updateVipValidate(email,validateCode);
            registerValidateService.processRegister(email,validateCode);
            return "activate_prompt";
        }

        String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
        password1 = passwordManager.encryptPassword(password1);
        Date date = new Date();
        //java.sql.Date sqldDate = new java.sql.Date(date.getTime());
        vipService.createVip(name,email,password1,date);
        vipValidateService.createVipValidate(email,validateCode);
        registerValidateService.processRegister(email,validateCode);
        return "activate_prompt";
    }

    @RequestMapping(value = "/activate.html",method = RequestMethod.GET)
    public String activate(Model model,@RequestParam("email")String email, @RequestParam("validateCode")String validateCode){
        try {
            registerValidateService.processActivate(email , validateCode);//调用激活方法
            return "activate_success";
        } catch (ServiceException e) {
            model.addAttribute("message" , e.getMessage());
            return  "activate_failure";
        }
    }

    @RequestMapping(value = "/forgotPassword.html",method = RequestMethod.POST)
    public String goForgotPassword(Model model,@RequestParam("email")String email){
        boolean isValid = EmailValidator.getInstance().isValid(email);
        if (!isValid){
            String message = "邮箱格式不正确";
            model.addAttribute("message",message);
            return "register_error";
        }
        Vip vip = vipService.findAvailableVip(email);
        if (vip == null){
            String message = "邮箱不存在，请重新输入。";
            model.addAttribute("message",message);
            return "register_error";
        }
        //生成验证码，发邮箱进行改密码
        String validateCode = passwordManager.encryptPassword(email+System.currentTimeMillis());
        vipValidateService.updateVipValidate(email,validateCode);
        Date resetPasswordTime = new Date();
        vipService.updateResetPasswordTime(resetPasswordTime,email);
        forgotPasswordService.processForgotPassword(email,validateCode);
        return "login";
    }

    @RequestMapping(value = "/resetPassword.html",method = RequestMethod.GET)
    public String goResetPassword(Model model, @RequestParam("validateCode")String validateCode){
        VipValidate vipValidate = vipValidateService.findByValidateCode(validateCode);
        String email = vipValidate == null? null : vipValidate.getEmail();
        if (email != null){
            Vip vip = vipService.findAvailableVip(email);
            if (vip!=null){
                Date currentTime = new Date();
                if(currentTime.before(vip.getResetLastActivateTime())) {
                    model.addAttribute("email",email);
                    return "reset_password";
                }
            }else {
                String message = "邮箱账号不存在。";
                model.addAttribute("message",message);
                return "register_error";
            }
        }

        String message = "验证码已过期。";
        model.addAttribute("message",message);
        return "register_error";
    }

    @RequestMapping(value = "/resetPassword.html",method = RequestMethod.POST)
    public String doResetPassword(Model model,@RequestParam("email")String email,@RequestParam("password1")String password1,
                                  @RequestParam("password2")String password2){
        if ((!password1.equals(password2))||password1.equals(null)||password2.equals(null)){
            String message = "密码输入不规范";
            model.addAttribute("message",message);
            return "register_error";
        }
        password1 = passwordManager.encryptPassword(password1);
        vipService.resetPassword(password1,email);
        vipValidateService.updateVipValidate(email,null);
        return "login";
    }








}
