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

<div class="login-box">
    <div class="box-con tran">


        <!-- 登录 -->
        <div class="login-con f-l">
            <form action="${pageContext.request.contextPath}/vip/login.html" method="post">
                <div class="form-group">
                    <span>${error}</span>
                    <input type="text" name="email" placeholder="邮箱">
                </div>
                <div class="form-group">
                    <input type="password" name="password" placeholder="密码">
                </div>
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
            <form action="/vip/register.html" method="post">

                <div class="signup-email">
                    <div class="form-group">
                        <input type="text" name="email" placeholder="邮箱">
                    </div>

                    <div class="form-group">
                        <input type="text" name="name" placeholder="用户名">
                    </div>

                    <div class="form-group">
                        <input type="password" placeholder="请输入密码" name="password1">
                    </div>

                    <div class="form-group">
                        <input type="password" placeholder="请重复输入密码" name="password2">
                    </div>

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
            <form action="/vip/forgotPassword.html" method="post">
                <div class="form-group">
                    <input type="text" placeholder="邮箱"  name="email">
                </div>

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

<div class="login-footer">
    <div>
        <a href="" class="footer-entry" target="_blank">服务条款</a> |
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
            })
        });

        $(".move-signup").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-320
            })
        });

        $(".move-reset").on("click",function(){
            $(_boxCon).css({
                'marginLeft':-640
            })
        });

        var t = "register";
        if ( t == "${type}" ){
            $(_boxCon).css({
                'marginLeft':-320
            })
        }

    });

</script>
</body>
</html>