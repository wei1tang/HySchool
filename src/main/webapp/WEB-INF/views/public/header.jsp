<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css"/><!--搜索栏css-->
    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->

    <style type="text/css">
        .me{
            overflow: visible;
        }
        .me li{
            margin-top: -16px;
            list-style-type:none;
        }
        .me .item{
            display: none;
            text-align: center;
            margin-top:0;
            background-color: white;
            border-bottom: 1px solid rgba(0,0,0,.1);
            height: 40px;
        }
        .me li a{
            text-decoration:none;
            cursor: pointer;
            color: #2d3238;
            opacity: 0.5;/*设置div元素不透明度*/
        }

        .me li a:hover,.me li a:active {
            opacity: 1;
        }
        #user-img:hover + .me .item,#user-img:active + .me .item{
            display: block;
        }
    </style>
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
            <div class="sign" id="sign">


            </div>

            <div class="me" id="me">
                <ul class="avatar-link" title="user">
                    <li id="user-img"><img src="../../../static/images/index-avatar.png" class="avatar" alt="avatar"/>
                        ${sessionScope.vip.name}
                    </li>
                    <c:if test="${sessionScope.vip.userType gt 1}">
                        <li class="item"><a href="/" >认证审核</a></li>
                        <li class="item"><a href="/" >商品审核</a></li>
                    </c:if>
                    <c:if test="${sessionScope.vip.userType gt 2}">
                        <li class="item"><a href="/" class="last">管理员审核</a></li>
                    </c:if>
                </ul>
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