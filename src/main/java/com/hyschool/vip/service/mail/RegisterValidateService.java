package com.hyschool.vip.service.mail;


import com.hyschool.utils.ConstantsUtil;
import com.hyschool.utils.SendEmailUtil;
import com.hyschool.utils.ServiceException;
import com.hyschool.vip.bean.Vip;
import com.hyschool.vip.bean.VipValidate;
import com.hyschool.vip.dao.VipMapper;
import com.hyschool.vip.dao.VipValidateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.Date;


@Service
public class RegisterValidateService {

    @Autowired
    VipMapper vipMapper;
    @Autowired
    VipValidateMapper vipValidateMapper;
    /**
     * 处理注册
     */
    public void processRegister(String email,String validateCode){

        ///邮件的内容
        StringBuffer sbPage = new StringBuffer();
        StringBuffer sbHref = new StringBuffer();
        sbHref.append("http://localhost:8080/vip/activate.html?email=");
        sbHref.append(email);
        sbHref.append("&validateCode=");
        sbHref.append(validateCode);
        String strHref = sbHref.toString();

        sbPage.append("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <base target=\"_blank\">\n" +
                "    <style type=\"text/css\">\n" +
                "        body{font-size:14px;font-family:arial,verdana,sans-serif;line-height:1.666;padding:0;margin:0;overflow:auto;white-space:normal;word-wrap:break-word;min-height:100px}\n" +
                "        td, input, button, select, body{font-family:Helvetica, 'Microsoft Yahei', verdana}\n" +
                "        pre {white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-moz-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;width:95%}\n" +
                "        th,td{font-family:arial,verdana,sans-serif;line-height:1.666}\n" +
                "        img{ border:0}\n" +
                "        header,footer,section,aside,article,nav,hgroup,figure,figcaption{display:block}\n" +
                "        .HySchool-email{\n" +
                "            margin: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            padding: 40px 0;\n" +
                "            background: #f2f2f2;\n" +
                "        }\n" +
                "        .email-table{\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            width: 100%;\n" +
                "            margin: 0 auto;\n" +
                "            max-width: 690px;\n" +
                "        }\n" +
                "        tbody,tr,td{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "        }\n" +
                "        table{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            width: 100%;\n" +
                "        }\n" +
                "        .content{\n" +
                "            font-weight: normal;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            margin: 0 auto;\n" +
                "            padding: 40px 30px;\n" +
                "            max-width: 690px;\n" +
                "            overflow: hidden;\n" +
                "            background: #fff;\n" +
                "            border-radius: 3px;\n" +
                "            box-sizing: border-box;\n" +
                "            border: 1px solid #d9d9d9;\n" +
                "        }\n" +
                "        .logo{\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            margin: 30px auto;\n" +
                "            display: block;\n" +
                "            width: 168px;\n" +
                "        }\n" +
                "        .user{\n" +
                "            margin: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            padding: 20px auto;\n" +
                "        }\n" +
                "        .avatar center{\n" +
                "            word-break: normal;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            padding: 0;\n" +
                "            font-weight: normal;\n" +
                "            margin: 0 auto;\n" +
                "            display: block;\n" +
                "            width: 80px;\n" +
                "            height: 80px;\n" +
                "            border-radius: 50%;\n" +
                "        }\n" +
                "        .user-info{\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            margin: 20px auto;\n" +
                "            font-size: 20px;\n" +
                "            color: #383838;\n" +
                "        }\n" +
                "        .message{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "        }\n" +
                "        h2{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            font-size: 20px;\n" +
                "            display: inline;\n" +
                "            color: #808080;\n" +
                "        }\n" +
                "        .btn{\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            padding: 0;\n" +
                "            width: 200px;\n" +
                "            margin: 30px auto;\n" +
                "            display: block;\n" +
                "            font-size: 20px;\n" +
                "            height: 54px;\n" +
                "            line-height: 54px;\n" +
                "            border-radius: 2px;\n" +
                "            background: #3da8f5;\n" +
                "            text-decoration: none;\n" +
                "            color: white!important;\n" +
                "            border: 0;\n" +
                "            cursor: pointer;\n" +
                "        }\n" +
                "        .hint{\n" +
                "            word-break: normal;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            padding: 0;\n" +
                "            font-weight: normal;\n" +
                "            margin: 0 auto;\n" +
                "            display: block;\n" +
                "            max-width: 600px;\n" +
                "            color: #a6a6a6;\n" +
                "            line-height: 24px;\n" +
                "        }\n" +
                "        p{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "        }\n" +
                "        br{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "        }\n" +
                "        .link{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            color: #3da8f5;\n" +
                "        }\n" +
                "        .footer{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "        }\n" +
                "        .footer_p{\n" +
                "            word-break: normal;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            text-align: center;\n" +
                "            font-weight: normal;\n" +
                "            margin: 20px auto 0;\n" +
                "            padding: 0 5px;\n" +
                "            font-size: 12px;\n" +
                "            display: block;\n" +
                "            max-width: 540px;\n" +
                "            color: #bdbdbd;\n" +
                "            line-height: 22px;\n" +
                "        }\n" +
                "        .footer_a{\n" +
                "            margin: 0;\n" +
                "            padding: 0;\n" +
                "            font-family: Helvetica Neue, Microsoft Yahei, Hiragino Sans GB, WenQuanYi Micro Hei, sans-serif;\n" +
                "            font-size: 14px;\n" +
                "            text-align: center;\n" +
                "            word-break: normal;\n" +
                "            font-weight: normal;\n" +
                "            color: #bdbdbd;\n" +
                "            text-decoration: underline;\n" +
                "        }\n" +
                "    </style>\n" +
                "</head>\n" +
                "\n" +
                "<body>\n" +
                "<div class=\"HySchool-email\">\n" +
                "    <table cellspacing=\"0\" cellpadding=\"0\" class=\"email-table\">\n" +
                "        <tbody>\n" +
                "\t\t<tr>\n" +
                "            <td>\n" +
                "                <img src=\"https://www.processon.com/images/default/logo/logo_m.png\" class=\"logo\">\n" +
                "            </td>\n" +
                "         </tr>\n" +
                "        <tr>\n" +
                "            <td class=\"content\">\n" +
                "                <table cellspacing=\"0\" cellpadding=\"0\">\n" +
                "                    <tbody>\n" +
                "                    <tr>\n" +
                "                        <td>\n" +
                "                            <table cellspacing=\"0\" cellpadding=\"0\">\n" +
                "                                <tbody>\n" +
                "\t\t\t\t\t\t\t\t<tr>\n" +
                "                                    <td class=\"user\">\n" +
                "                                        <h2 class=\"user-info\">\n" +
                "                                            <a href=\"mailto:"+email+"\">"+email+"</a>，您好！</h2>\n" +
                "\t\t\t\t\t\t\t\t\t</td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td class=\"message\"><h2>欢迎使用 花样校园二手街，请验证邮箱，如果此操作并不是由您发起的，请忽略此邮件。</h2>\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                <tr>\n" +
                "                                    <td>\n" +
                "                                        <a style=\"text-decoration:none;\" href="+strHref+" class=\"btn\" target=\"_blank\">验证邮箱</a>\n" +
                "                                    </td>\n" +
                "                                </tr>\n" +
                "                                </tbody>\n" +
                "                            </table>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    <tr>\n" +
                "                        <td class=\"hint\">\n" +
                "                            <p>\n" +
                "                                如果按钮无法点击，请点击以下链接进行验证\n" +
                "                                <br>\n" +
                "                                <a href="+strHref+" class=\"link\">\n" +strHref+
                "                                </a>\n" +
                "                            </p>\n" +
                "                        </td>\n" +
                "                    </tr>\n" +
                "                    </tbody>\n" +
                "                </table>\n" +
                "            </td>\n" +
                "        </tr>\n" +
                "        <tr>\n" +
                "            <td class=\"footer\">\n" +
                "                <p class=\"footer_p\">\n" +
                "                    邮件来自 花样校园二手街 的自动提醒，无需回复。\n" +
                "                    <br>\n" +
                "                    如果您在使用中有任何的疑问或者建议， 欢迎反馈我们意见至邮件：\n" +
                "                    <a  class=\"footer_a\"  href=\"mailto:13163235957@163.com\" style=\"\">\n" +
                "                        13163235957@163.com\n" +
                "                    </a>\n" +
                "                </p>\n" +
                "            </td>\n" +
                "        </tr>\n" +
                "        </tbody>\n" +
                "    </table>\n" +
                "</div>\n" +
                "\n" +
                "\n" +
                "<style id=\"ntes_link_color\" type=\"text/css\">a,td a{color:#064977}</style>\n" +
                "</body></html>");

        //发送邮件
        SendEmailUtil.send(email, sbPage.toString(),ConstantsUtil.REGISTER_SUBJECT);
    }

    /**
     * 处理激活
     * @throws ParseException
     */
    public void processActivate(String email, String validateCode)throws ServiceException{
        Vip vip=vipMapper.findVipByEmail(email);
        if(vip!=null) {
            if(vip.getState() == ConstantsUtil.VIP_STATE_INVALID) {
                Date currentTime = new Date();
                if(currentTime.before(vip.getLastActivateTime())) {
                    VipValidate vipValidate = vipValidateMapper.findByEmail(email);
                    if(validateCode.equals(vipValidate == null? null : vipValidate.getValidateCode())) {
                        vipMapper.activateVip(ConstantsUtil.VIP_STATE_AVAILABLE,email);
                        vipValidate.setValidateCode(null);
                        vipValidateMapper.updateVipValidate(vipValidate);
                    } else {
                        throw new ServiceException("激活码不正确");
                    }
                } else { throw new ServiceException("激活码已过期！");
                }
            } else {
                throw new ServiceException("邮箱已激活，请登录！");
            }
        } else {
            throw new ServiceException("该邮箱未注册（邮箱地址不存在）！");
        }
    }


}