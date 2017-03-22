<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>交易市场</title>
    <!--<%&#45;&#45;<link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">&#45;&#45;%>-->

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../../static/css/index-search-form.css" /><!--搜索栏css-->
    <link href="../../static/css/searchfor.css" type="text/css" rel="stylesheet"/><!--首页css-->

    <script type="text/javascript" src="../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../static/js/jquery-ui-1.10.4.min.js"></script><!--jQueryUI样式-->
    <script type="text/javascript" src="../../static/js/index-search.js"></script><!--搜索栏js-->

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
                <a class="list" href="#">登录</a>
                <a class="list" href="#">注册</a>
            </div>
        </div>
    </div>

    <div class="showlist">
        <div class="typegoods">
            <div class="search-hots ">
                <a class="hots" href="#">华中科技大学二手市场</a>
                <span class="cat-bread">&gt;</span>
                <a class="hots" href="#">华中科技大学二手校园代步</a>
            </div>
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
                    <img src="../../static/images/index-project-img/1.png" class="img" />
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
        <div class="show-more">
            <spain>显示更多</spain>
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