<%--Created by tangwei on 2017/3/27.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css" /><!--搜索栏css-->
    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->

</head>
<body>

<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="../../../static/images/index-logo.png" class="" />二手交易网
        </div>
        <div class="nav">
            <a class="list" >首页</a>
            <a class="list" >关于</a>
        </div>
        <!--添加搜索-->
        <form onSubmit="submitFn(this, event);">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="请输入关键词" />
                    <button class="search-icon" onClick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onClick="searchToggle(this, event);"></span>
            </div>
        </form>
        <!--<div class="me">-->
        <!--<div class="avatar-link" title="user">-->
        <!--<img src="index-avatar.png" class="avatar" alt="avatar"/>-->
        <!--Hello, {user.name}-->
        <!--</div>-->
        <!--<Button type="primary" onClick={this.logout}>退出登录</Button>-->
        <!--</div>-->
        <div class="sign">
            <a class="list" href="${pageContext.request.contextPath}/vip/login">登录</a>
            <%--<br>--%>
            <%--${test}--%>
            <a class="list" href="${pageContext.request.contextPath}/vip/logout">注册</a>
        </div>
    </div>
</div>


</body>
</html>