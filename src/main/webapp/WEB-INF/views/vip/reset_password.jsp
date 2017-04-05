<%--
  Created by IntelliJ IDEA.
  User: LJW
  Date: 2017/1/16
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>密码重置</title>
    <link href="../../../static/css/font/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="../../../static/css/font/iconfont.css" type="text/css" rel="stylesheet">
    <link href="../../../static/css/login.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<div class="login-nav fix"></div>

<div class="login-banner"></div>

<div class="login-box">
    <div class="box-con tran">


        <!-- 密码重置 -->
        <div class="forgot f-l">
            <form action="${pageContext.request.contextPath}/vip/resetPassword" method="post">
                <div class="form-group">
                    <input type="text" name="email" value="${email}" style="background-color: #c2c2c2" readonly>
                </div>

                <div class="form-group">
                    <input type="password" placeholder="请输入密码" name="password1">
                </div>

                <div class="form-group">
                    <input type="password" placeholder="请重复输入密码" name="password2">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="form-group">
                    <button type="submit" class="tran pr">重置密码</button>
                </div>
            </form>
            <div class="from-line"></div>

            <div class="form-group">
                <a href="/vip/login" class="move-login a-tag tran blue-border">已有帐号？登录<i class="icon-circle-arrow-right tran"></i></a>
            </div>
        </div>


    </div>
</div>

<%@include file="../public/footer.jsp"%>

<script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script>

</body>
</html>
