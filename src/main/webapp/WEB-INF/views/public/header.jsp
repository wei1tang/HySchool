<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/login.jsp'}">
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
        </c:if>


        <c:if test="${sessionScope.vip ne null}">
            <div class="sign">
                <c:if test="${sessionScope.vip.userType gt 1}">
                    <a href="/" class="list">认证审核</a>
                    <a href="/" class="list">商品审核</a>
                </c:if>
                <c:if test="${sessionScope.vip.userType gt 2}">
                    <a href="/" class="list">管理员审核</a>
                </c:if>
            </div>

            <div class="me" id="me">
                <div class="avatar-link" title="user">
                    <img src="../../../static/images/index-avatar.png" class="avatar" alt="avatar"/>
                        ${sessionScope.vip.name}
                </div>
                <div class="button-link">
                    <a href="${pageContext.request.contextPath}/vip/logout"
                       class="button button-primary button-rounded button-small">退出登录</a>
                </div>
            </div>
        </c:if>

        <c:if test="${sessionScope.vip eq null}">
            <div class="sign" id="sign">
                <a class="list" href="${pageContext.request.contextPath}/vip/login">登录</a>
                <a class="list" href="${pageContext.request.contextPath}/vip/register">注册</a>
            </div>
        </c:if>
    </div>
</div>
<script>
    $(function () {
        console.info("${pageContext.request.requestURI}")
    })
</script>
</body>
</html>