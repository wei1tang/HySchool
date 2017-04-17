<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css"/><!--搜索栏css-->
    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->
    <%--<link href="../../../static/css/font/iconfont.css" type="text/css" rel="stylesheet">--%>

    <link href="../../../static/css/index-sider-style.css" rel="stylesheet" type="text/css" /><!--侧边栏样式-->
    <link href="../../../static/css/header.css" rel="stylesheet" type="text/css" /><!--header样式-->


</head>
<body>

<div class="header">
    <div class="header-content">
        <div class="logo">
            <img src="../../../static/images/index-logo.png" class=""/>二手交易网
        </div>
        <div class="nav">
            <a href="/" class="list">首页</a>
            <a href="${pageContext.request.contextPath}/joinUs" class="list">关于</a>
        </div>

        <c:if test="${pageContext.request.requestURI ne '/WEB-INF/views/login.jsp' and
                      pageContext.request.requestURI ne '/WEB-INF/views/common/joinUs.jsp' and
                      pageContext.request.requestURI ne '/WEB-INF/views/common/about.jsp' and
                      pageContext.request.requestURI ne '/WEB-INF/views/vip/info.jsp'}">
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
            <div class="me" id="me">
                <a class="list"><i class="fa fa-bell-o fa-lg"></i><span>通知</span></a>
                <a class="list"><i class="fa fa-shopping-cart fa-lg"></i><span>购物车</span></a>
                <ul class="avatar-link" title="user">
                    <li id="user-img"><img src="${sessionScope.vip.avatarUrl}" class="avatar" alt="avatar"/>
                        ${sessionScope.vip.name}
                    </li>
                    <c:if test="${sessionScope.vip.userType eq 1}">
                        <li class="item"><a href="${pageContext.request.contextPath}/vip/info"><i class="fa fa-cog fa-lg"></i><span>个人设置</span></a></li>
                    </c:if>
                    <c:if test="${sessionScope.vip.userType gt 1}">
                        <li class="item"><a href="${pageContext.request.contextPath}/vip/info"><i class="fa fa-cog fa-lg"></i><span>个人设置</span></a></li>
                        <li class="item"><a href="/" ><i class="fa fa-file-archive-o fa-lg"></i><span>认证审核</span></a></li>
                        <li class="item"><a href="/" ><i class="fa fa-shopping-basket fa-lg"></i><span>商品审核</span></a></li>
                    </c:if>
                    <c:if test="${sessionScope.vip.userType gt 2}">
                        <li class="item"><a href="/" class="last"><i class="fa fa-th-large fa-lg"></i><span>设管理员</span></a></li>
                    </c:if>
                    <li class="item"><a href="${pageContext.request.contextPath}/vip/logout" class="last"><i class="fa fa-sign-out fa-lg"></i><span>退出登录</span></a></li>
                </ul>


                <%--<div class="button-link">
                    <a href="${pageContext.request.contextPath}/vip/logout"
                       class="button button-primary button-rounded button-small">退出登录</a>
                </div>--%>
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
<%--<script>
    $(function () {
        console.info("${pageContext.request.requestURI}");
        console.info("${pageContext.request.contextPath}");
    })
</script>--%>

<script type="text/javascript">
    $('#user-img').mouseenter(function () {
        $('.header .me .item').css({
            'display':'block'
        });
    });
    $('.header .me').mouseleave(function () {
        $('.header .me .item').css({
            'display':'none'
        });
    })
</script>
</body>
</html>