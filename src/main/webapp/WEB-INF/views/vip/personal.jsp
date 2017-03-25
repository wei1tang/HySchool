<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人简介</title>
    <!--<link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">-->

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css" /><!--搜索栏css-->
    <link href="../../../static/css/personal.css" type="text/css" rel="stylesheet"/><!--首页css-->

    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->

    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->

</head>

<body>

<div class="container">
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
                <a class="list" href="${pageContext.request.contextPath}/vip/login.html">登录</a>
                <%--<!--<br>-->--%>
                <%--<!--${test}-->--%>
                <a class="list" href="${pageContext.request.contextPath}/vip/logout.html">注册</a>
            </div>
        </div>
    </div>

    <div class="top">
        <div class="first">
            <div class="level">
                <img class="avatar" src="../../../static/images/index-avatar.png"/>
                <p class="username">测试账号</p>
                <p class="level-content">
                    积分: 0
                </p>
            </div>
            <div class="achieve">
                <div class="title">我的成就</div>
                <div class="achieve-content">
                    <div class="item">
                        <div class="value">0</div>
                        <div class="name">已购买物品</div>
                    </div>
                    <div class="item">
                        <div class="value">0</div>
                        <div class="name">已发布物品</div>
                    </div>
                    <div class="item">
                        <div class="value">￥0</div>
                        <div class="name">总收入</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="information">
            <p>正在出售</p>
        </div>

        <div class="items">
            <div class="item">
                <div class="left">
                    <img src="../../../static/images/index-project-img/1.png" class="left" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="detail">12年暑假买的mbp，可小刀。有点划痕。内部无损，可以正常使用。图之后上</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="money"><span style="color: #c7c">￥</span>5000</div>
                </div>
            </div>
            <div class="item">
                <div class="left">
                    <img src="../../../static/images/index-project-img/1.png" class="left" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="detail">12年暑假买的mbp，可小刀。有点划痕。内部无损，可以正常使用。图之后上</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="money"><span style="color: #c7c">￥</span>5000</div>
                </div>
            </div>
            <div class="item">
                <div class="left">
                    <img src="../../../static/images/index-project-img/1.png" class="left" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="detail">12年暑假买的mbp，可小刀。有点划痕。内部无损，可以正常使用。图之后上</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="money"><span style="color: #c7c">￥</span>5000</div>
                </div>
            </div>
            <div class="item">
                <div class="left">
                    <img src="../../../static/images/index-project-img/1.png" class="left" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="detail">12年暑假买的mbp，可小刀。有点划痕。内部无损，可以正常使用。图之后上</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="money"><span style="color: #c7c">￥</span>5000</div>
                </div>
            </div>
        </div>

    </div>



    <div class="footer" id="footer">
        <div>
            <a href="" class="footer-entry" target="_blank">服务条款</a> |
            <a href="" class="footer-entry" target="_blank">隐私政策</a> |
            <a href="" class="footer-entry" target="_blank">版权所有</a>
        </div>
        <div>
            <span class="footer-entry last">华中科技大学花样校园毕设项目组保留所有权利。</span>
        </div>
    </div>

</div>


</body>
</html>