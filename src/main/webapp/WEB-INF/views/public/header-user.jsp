<%--Created by tangwei on 2017/3/27.--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->


    <style type="text/css">
        #me{
            cursor: pointer;/*鼠标指向时改变光标*/
        }
        #me,#sign{
            display: none;
        }
    </style>
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
        <div class="me" id="me">
            <div class="avatar-link" title="user">
                <img src="../../../static/images/index-avatar.png" class="avatar" alt="avatar"/>
                Hello, {user.name}
            </div>
            <div class="button-link">
                <a href="#" class="button button-primary button-rounded button-small">退出登录</a>
            </div>
        </div>

        <div class="sign" id="sign">
            <a class="list" href="${pageContext.request.contextPath}/vip/login">登录</a>
            <%--<br>--%>
            <%--${test}--%>
            <a class="list" href="${pageContext.request.contextPath}/vip/logout">注册</a>
        </div>

    </div>
</div>

<script type="text/javascript">

    $(function() {
//        var user = $.sessionStorage.getItem("vip");
        var type="${sessionScope.vip.userType}";
        var name = '<%=session.getAttribute("vip")%>';

        var $this=$('#me');
        var $that=$('#sign');
        if (name === "null") {
            //没登录

            $this.css({
                'display':'none'
            });

            $that.css({
                'display':'block'
            });

        }else if(type==1){
            //普通vip

            $that.css({
                'display':'none'
            });

            $this.css({
                'display':'block'
            });

        }
    })
</script>

</body>
</html>