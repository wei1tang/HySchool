<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>项目详情页</title>

    <!--必要样式-->
    <link href="../../static/css/project.css" type="text/css" rel="stylesheet"/><!--项目详情界面css-->
    <link href="../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--bootstrapcss-->

</head>
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
            <div class="me">
                <div class="avatar-link" title="user">
                    <img src="../../static/images/index-avatar.png" class="avatar" alt="avatar" href="user.jsp"/>
                    Hello, {user.name}
                </div>
                <div class="button-link">
                    <a href="${pageContext.request.contextPath}/vip/logout.html" class="button button-primary button-rounded button-small">退出登录</a>
                </div>
            </div>
            <!--<div class="sign">-->
            <!--<a class="list" >登录</a>-->
            <!--<a class="list" >注册</a>-->
            <!--</div>-->
        </div>
    </div>

    <div class="project">

        <div class="product-introduction">
            <div class="product-photo">
                <div id="photo-viewer"></div>
                <div id="thumbnails">
                    <a href="../../static/images/project-images/1.jpg" class="thumb active">
                        <img src="../../static/images/project-images/1.jpg" width="60px" height="60px" />
                    </a>
                    <a href="../../static/images/project-images/2.jpg" class="thumb ">
                        <img src="../../static/images/project-images/2.jpg" width="60px" height="60px"/>
                    </a>
                    <a href="../../static/images/project-images/3.jpg" class="thumb ">
                        <img src="../../static/images/project-images/3.jpg" width="60px" height="60px"/>
                    </a>
                </div>
            </div>
            <div class="product-detail">
                <div class="detail-hd">
                    <h2 class="detail-title">微软平板电脑换个大屏手机</h2>
                    <div class="detail-price ">
                        <span>1900</span>
                        <span class="is-auction">可拍卖</span>
                    </div>
                    <p class="bro-counts">浏览了<span>64</span>次</p>
                </div>
                <ul class="detail-information">
                    <li class="detail-place">
                        <div class="name"><span>交易地点</span></div>
                        <div class="value"><span>东九教学楼</span></div>
                    </li>
                    <li class="detail-seller">
                        <div class="name"><span>卖家</span></div>
                        <a href="vip/personal.jsp" target="_blank">
                            <div class="value">
                                <span class="value-name">阿澈</span>
                                <img class="detail-grade" src="../../static/images/project-ico_lv6.png" alt="等级显示">
                            </div>
                        </a>
                    </li>
                    <li class="detail-cert">
                        <div class="name"><span>认证状态</span></div>
                        <div class="value"><span>光电16级(未认证)</span></div>
                    </li>
                    <li class="detail-tel">
                        <div class="name"><span>手机</span></div>
                        <div class="value">
                            <span class="user-num">15992345345</span>
                        </div>
                    </li>
                    <li class="detail-qq">
                        <div class="name"><span>QQ</span></div>
                        <div class="value">
                            <span class="user-num">305734769</span>
                        </div>
                    </li>
                    <li class="detail-time">
                        <div class="name"><span>发布时间</span></div>
                        <div class="value">
                            <span class="real-time">4天前</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="product-user">
            <div class="user-desc ">
                <a href="#" target="_blank">
                    <img id="user_ph" src="../../static/images/index-avatar.png">
                </a>
                <span id="user_cmt">用了一年多，没修过没拆开过，充一次电能用四五个小时<br>联系我时，请说明是在『花样校园』上看到的哦</span>
            </div>
        </div>

        <div class="product-comment">
            <div class="comment-input">
                <p>来评论一下吧!</p>
                <div class="comment-message" contentEditable='true'></div>
                <div class="comment-button">
                    <a href="#" class="button button-primary button-rounded button-small submit">发表</a>
                </div>
            </div>
            <!--qq end-->
            <!--msgCon begin-->
            <div class="msgCon">

            </div>

        </div>

    </div>

    <div class="footer">
        <div>
            <a href="" class="footer-entry" target="_blank">服务条款</a> |
            <a href="" class="footer-entry" target="_blank">隐私政策</a> |
            <a href="" class="footer-entry" target="_blank">版权所有</a>
            <!--修改-->
        </div>
        <div>
            <span class="footer-entry last">华中科技大学花样校园毕设项目组保留所有权利。</span>
        </div>
    </div>

</div>

<script type="text/javascript" src="../../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../static/js/project-photo-viewer.js"></script>

<script type="text/javascript">

    //点击发表按扭，发表内容
    $("a.submit").click(function(){

        var txt=$(".comment-message").html();
        if(txt==""){
            $('.comment-message').focus();//自动获取焦点
            return;
        }
        $(".msgCon").prepend(
            "<div class='msgBox'>" +
            "<dl>" + "<dt>" +
            "<img src='../../static/images/index-avatar.png' width='50' height='50'/>" +
            "</dt><dd>用户一</dd>" +
            "</dl><div class='msgTxt'>"+txt+"</div></div>");
    });

</script>
</body>
</html>
