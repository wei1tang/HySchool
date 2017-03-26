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

<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="../../static/images/index-logo.png" class="" />二手交易网
        </div>
        <div class="nav">
            <a class="list" >首页</a>
            <a class="list" >关于</a>
        </div>
        <%--<!--添加搜索-->--%>
        <%--<form onSubmit="submitFn(this, event);">--%>
            <%--<div class="search-wrapper">--%>
                <%--<div class="input-holder">--%>
                    <%--<input type="text" class="search-input" placeholder="请输入关键词" />--%>
                    <%--<button class="search-icon" onClick="searchToggle(this, event);"><span></span></button>--%>
                <%--</div>--%>
                <%--<span class="close" onClick="searchToggle(this, event);"></span>--%>
            <%--</div>--%>
        <%--</form>--%>
        <!--<div class="me">-->
        <!--<div class="avatar-link" title="user">-->
        <!--<img src="index-avatar.png" class="avatar" alt="avatar"/>-->
        <!--Hello, {user.name}-->
        <!--</div>-->
        <!--<Button type="primary" onClick={this.logout}>退出登录</Button>-->
        <!--</div>-->
        <div class="sign">
            <a class="list" href="${pageContext.request.contextPath}/vip/login.html">登录</a>
            <%--<br>--%>
            <%--${test}--%>
            <a class="list" href="${pageContext.request.contextPath}/vip/logout.html">注册</a>
        </div>
    </div>
</div>

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
                    <button type="submit" class="tran pr" id="login">登 录</button>
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

<div class="footer">
    <div>
        <a href="${pageContext.request.contextPath}/about.html" class="footer-entry" target="_blank">服务条款</a> |
        <a href="" class="footer-entry" target="_blank">隐私政策</a> |
        <a href="" class="footer-entry" target="_blank">版权所有</a>
    </div>
    <div>
        <span class="footer-entry last">华中科技大学花样校园毕设项目组保留所有权利。</span>
    </div>
</div>



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

    //激活回车键登录
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            $("#login").trigger("click");
        }
    });

</script>




</body>
</html>