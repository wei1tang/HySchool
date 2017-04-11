<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--Created by tangwei on 2017/3/27.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css"/><!--搜索栏css-->
    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->
</head>
<body>

<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="../../../static/images/index-logo.png" class=""/>二手交易网
        </div>
        <div class="nav">
            <a href="/" class="list">首页</a>
            <a href="/" class="list">关于</a>
        </div>

        <!--添加搜索-->
        <form onSubmit="submitFn(this, event);" id="searchFrom">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input type="text" class="search-input" placeholder="请输入关键词"/>
                    <button class="search-icon" onClick="searchToggle(this, event);"><span></span></button>
                </div>
                <span class="close" onClick="searchToggle(this, event);"></span>
            </div>
        </form>


        <div class="sign" id="sign">
            <a class="list" href="${pageContext.request.contextPath}/vip/login">登录</a>
            <a class="list" href="${pageContext.request.contextPath}/vip/register">注册</a>
        </div>
    </div>
</div>

</body>
</html>