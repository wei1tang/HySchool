<%--Created by tangwei on 2017/3/27.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application"/>
</head>
<body>

<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="../../static/images/index-logo.png" class=""/>二手交易网
        </div>
        <div class="nav">
            <a class="list">首页</a>
            <a class="list">关于</a>
        </div>

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


</body>
</html>