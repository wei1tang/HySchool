<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/4
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>花样校园二手街</title>
    <link href="../../static/css/font/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/font/iconfont.css" type="text/css" rel="stylesheet">
    <link href="../../static/css/login.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div class="login-nav fix"></div>

<div class="login-banner"></div>

<%@include file="public/header.jsp"%>

<div class="login-box">
    <div class="box-con tran">


        <!-- 登录 -->
        <div class="login-con f-l">
            <form action="${pageContext.request.contextPath}/vip/login.html" method="post">
                <div class="form-group">
                    <span>${error}</span>
                    <input type="text" name="email" placeholder="邮箱" id="email1" easyform="email" message="Email格式要正确" easytip="disappear:lost-focus;theme:blue;">
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="密码"  id="psw" easyform="length:6-16;" message="密码必须为6—16位" easytip="disappear:lost-focus;theme:blue;">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="tran pr">登 录</button>
                </div>
            </form>


            <div class="from-line"></div>

            <div class="form-group">
                <a href="javascript:;" class="move-signup a-tag tran blue-border">还没有帐号？免费注册<i class="icon-circle-arrow-right tran"></i></a>
            </div>

            <div class="form-group">
                <a href="#" class="a-wx tran">使用 微信 登录<i class="iconfont tran">&#xe6f0;</i></a>
            </div>

            <div class="form-group">
                <a href="javascript:;" class="move-reset a-tag tran">忘记密码？重置<i class="icon-circle-arrow-right tran"></i></a>
            </div>

        </div>







        <!-- 邮箱注册 -->
        <div class="signup f-l">
            <form action="${pageContext.request.contextPath}/vip/register.html" method="post">

                <div class="signup-email">
                    <div class="form-group">
                        <input type="text" name="email" placeholder="邮箱" id="email2" easyform="email"  message="Email格式要正确" easytip="disappear:lost-focus;theme:blue;">
                    </div>

                    <div class="form-group">
                        <input type="text" name="name" placeholder="用户名" id="username" easyform="length:4-16;char-chinese;" message="用户名必须为4—16位的英文字母,数字或中文" easytip="disappear:lost-focus;theme:blue;" ajax-message="用户名已存在!">
                    </div>

                    <div class="form-group">
                        <input type="password" placeholder="请输入密码" name="password1" id="password1" easyform="length:6-16;" message="密码必须为6—16位" easytip="disappear:lost-focus;theme:blue;">
                    </div>

                    <div class="form-group">
                        <input type="password" placeholder="请重复输入密码" name="password2" id="password2" easyform="length:6-16;equal:#password1;" message="两次密码输入要一致" easytip="disappear:lost-focus;theme:blue;">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group">
                        <button type="submit" class="tran pr">注 册</button>
                    </div>

                    <p class="view-clause">点击注册,即同意我们的 <a href="#">用户隐私条款</a></p>
                </div>
            </form>

            <div class="from-line"></div>

            <div class="form-group">
                <a href="javascript:;" class="move-login a-tag tran blue-border">已有帐号？登录<i class="icon-circle-arrow-right tran"></i></a>
            </div>

        </div>








        <!-- 忘记密码 -->
        <div class="forgot f-l">
            <form action="${pageContext.request.contextPath}/vip/forgotPassword.html" method="post">
                <div class="form-group">
                    <input type="text" placeholder="邮箱"  name="email" id="email3" easyform="email" message="Email格式要正确" easytip="disappear:lost-focus;theme:blue;">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="tran pr">重置密码</button>
                </div>
            </form>

            <div class="from-line"></div>

            <div class="form-group">
                <a href="javascript:;" class="move-signup	a-tag tran blue-border">还没有帐号？免费注册<i class="icon-circle-arrow-right tran"></i></a>
            </div>

            <div class="form-group">
                <a href="javascript:;" class="move-login a-tag tran blue-border">已有帐号？登录<i class="icon-circle-arrow-right tran"></i></a>
            </div>
        </div>


    </div>
</div>

<%@include file="public/footer.jsp"%>

<script type="text/javascript" src="../../static/js/jquery-3.1.1.min.js"></script>
<script>
    $(function(){

        //步骤切换
        var _boxCon=$(".box-con");
        $(".move-login").on("click",function(){
            $(_boxCon).css({
                'marginLeft':0
            });
            $('#easytip-div-mainemail2').css({
                'display':'none'
            });
            $('#easytip-div-mainusername').css({
                'display':'none'
            });
            $('#easytip-div-mainpassword1').css({
                'display':'none'
            });
            $('#easytip-div-mainpassword2').css({
                'display':'none'
            });
            $('#easytip-div-mainemail3').css({
                'display':'none'
            })
        });

        $(".move-signup").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-320
            });
            $('#easytip-div-mainemail1').css({
                'display':'none'
            });
            $('#easytip-div-mainpsw').css({
                'display':'none'
            });
            $('#easytip-div-mainemail3').css({
                'display':'none'
            });
        });

        $(".move-reset").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-640
            });
            $('#easytip-div-mainemail2').css({
                'display':'none'
            });
            $('#easytip-div-mainusername').css({
                'display':'none'
            });
            $('#easytip-div-mainpassword1').css({
                'display':'none'
            });
            $('#easytip-div-mainpassword2').css({
                'display':'none'
            });
            $('#easytip-div-mainemail1').css({
                'display':'none'
            });
            $('#easytip-div-mainpsw').css({
                'display':'none'
            });
        });

        var t = "register";
        if ( t == "${type}" ){
            $(_boxCon).css({
                'marginLeft':-320
            })
        }

    });

</script>

<script type="text/javascript" src="../../static/js/easyform.js"></script>
<script>

    $(document).ready(function ()

    {
        $('.login-con').easyform();
        $('.signup').easyform();
        $('.forgot').easyform();

    });

</script>




</body>
</html>