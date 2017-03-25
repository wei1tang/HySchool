<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <%--<link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">--%>

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../../static/css/index-search-form.css" /><!--搜索栏css-->
    <link href="../../static/css/index.css" type="text/css" rel="stylesheet"/><!--首页css-->

    <link href="../../static/css/index-slider-font.css" rel="stylesheet" type="text/css" /><!--四张照片滑动样式-->
    <link href="../../static/css/index-sider-style.css" rel="stylesheet" type="text/css" /><!--侧边栏样式-->

    <script type="text/javascript" src="../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../static/js/jquery-ui-1.10.4.min.js"></script><!--jQueryUI样式-->
    <script type="text/javascript" src="../../static/js/index-slider.js"></script><!--滑动图片js-->
    <script type="text/javascript" src="../../static/js/index-sider.js"></script><!--侧边栏js-->
    <script type="text/javascript" src="../../static/js/index-search.js"></script><!--搜索栏js-->
    <script type="text/javascript" src="../../static/js/index-page.js"></script><!--分页js-->

</head>

<script language="JavaScript">
    function check() {
        var name = $.sessionStorage.getItem("key");
        if (name === ""){

        }
    }
</script>

<body>

<div class="container">
    <div class="header">
        <div class="header-content">
            <div class="logo">
                <img src="../../static/images/index-logo.png" class="" />二手交易网
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
                <%--<br>--%>
                <%--${test}--%>
                <a class="list" href="${pageContext.request.contextPath}/vip/logout.html">注册</a>
            </div>
        </div>
    </div>
    <div id="slider">
        <div id="slider-panels">
            <div id="slider-panels-next"><span class="iconb" data-icon="&#xe24e;"></span></div>
            <div id="slider-panels-previous"><span class="iconb" data-icon="&#xe24b;"></span></div>

            <div id="slider-panel-images">
                <img src="../../static/images/index-slider-img/1.jpg" width="900" height="200" /><!--修改400px->200px-->
                <img src="../../static/images/index-slider-img/2.jpg" width="900" height="200" /><!--修改400px->200px-->
                <img src="../../static/images/index-slider-img/3.jpg" width="900" height="200" /><!--修改400px->200px-->
                <img src="../../static/images/index-slider-img/4.jpg" width="900" height="200" /><!--修改400px->200px-->
            </div>

            <div id="slider-panel-left">
                <div id="slider-panel-left-carousel"></div>
            </div>

            <div id="slider-panel-center">
                <div id="slider-panel-center-carousel"></div>
            </div>

            <div id="slider-panel-right">
                <div id="slider-panel-right-carousel"></div>
            </div>
            <div id="slider-dots"></div>
        </div>
    </div>

    <div class="showlist">
        <div class="typegoods">
            <div class="search_check">
                <a class="list" >时间</a>
                <a class="list" >积分</a>
                <a class="list" >价格</a>
                <a class="list" >热度</a>
            </div>
        </div>

        <div class="list-totall">
            <div class="list-item">
                <div class="img">
                    <img src="../../static/images/index-project-img/1.png" class="img" href="project.jsp" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>5000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../static/images/index-project-img/2.png" class="img" />
                    <div class="introduction"><p>这台电脑使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-2</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>50000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../static/images/index-project-img/3.png" class="img" />
                    <div class="introduction"><p>这手机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-3</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>30000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">手机</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../static/images/index-project-img/3.png" class="img" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-4</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>5000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 分页 开始 -->
        <div id="page"></div>
        <!-- 分页 结束 -->
    </div>
    <div class="footer" id="footer">
        <div>
            <a href="common/about.jsp" class="footer-entry" target="_blank">服务条款</a> |
            <a href="common/about.jsp" class="footer-entry" target="_blank">隐私政策</a> |
            <a href="common/about.jsp" class="footer-entry" target="_blank">版权所有</a>
        </div>
        <div>
            <span class="footer-entry last">华中科技大学花样校园毕设项目组保留所有权利。</span>
        </div>
    </div>

</div>
<!--侧边栏start-->
<div class="sidebar" id="sidebar">
    <!--<div class="logo"></div>-->
    <div class="settings"></div>
    <ul>
        <li><a href="${pageContext.request.contextPath}/vip/searchfor.html"><i class="fa fa-home fa-lg"></i><span class="nav-text">首页</span></a></li>
        <!--侧边栏鼠标未移动到其上时显示斜体字-->
        <li><a href="common/searchfor.jsp"><i class="fa fa-bicycle fa-lg"></i><span class="nav-text">校园代步</span></a></li>

        <li><a href="#"><i class="fa fa-phone fa-lg"></i><span class="nav-text">手机</span></a></li>

        <li><a href="#"><i class="fa fa-desktop fa-lg"></i><span class="nav-text">电脑</span></a></li>

        <li><a href="#"><i class="fa fa-headphones fa-lg"></i><span class="nav-text">数码配件</span></a></li>

        <li><a href="#"><i class="fa fa-camera-retro fa-lg"></i><span class="nav-text">数码</span></a></li>

        <li><a href="#"><i class="fa fa-television fa-lg"></i><span class="nav-text">电器</span></a></li>

        <li><a href="#"><i class="fa fa-soccer-ball-o fa-lg"></i><span class="nav-text">运动健身</span></a></li>

        <li><a href="#"><i class="fa fa-umbrella fa-lg"></i><span class="nav-text">衣物伞帽</span></a></li>

        <li><a href="#"><i class="fa fa-book fa-lg"></i><span class="nav-text">图书教材</span></a></li>

        <li><a href="#"><i class="fa fa-money fa-lg"></i><span class="nav-text">租赁</span></a></li>

        <li class="has-subnav"><a href="#"><i class="fa fa-gamepad fa-lg"></i><span class="nav-text">生活娱乐</span></a></li>

        <li><a href="#"><i class="fa fa-cube fa-lg"></i><span class="nav-text">其他</span></a></li>
    </ul>
    <ul class="logout">
        <li><a href="#"><i class="fa fa-lightbulb-o fa-lg"></i><span class="nav-text">加入我们</span></a></li>
    </ul>
</div>
<!--侧边栏end-->
<!--右边侧栏我要发布start-->
<div class="rightsidebar">
    <a ></a>
</div>

<!--右边侧栏我要发布end-->
<!-- 分页 开始 -->
<script type="text/javascript">
    $(function(){
        $("#page").Page({
            totalPages: 9,//分页总数
            liNums: 8,//分页的数字按钮数(建议取奇数)
            activeClass: 'activP', //active 类样式定义
            callBack : function(page){
                //console.log(page)
            }
        });
    })
</script>
<!-- 分页 结束 -->

</body>
</html>
