<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>项目详情页</title>

    <!--必要样式-->
    <link href="../../../static/css/project.css" type="text/css" rel="stylesheet"/><!--项目详情界面css-->

</head>
<body>

<div class="container">

    <%@include file="../public/header.jsp"%>

    <div class="project">

        <div class="product-introduction">
            <div class="product-photo">
                <div id="photo-viewer"></div>
                <div id="thumbnails">
                    <c:forEach items="${goods.imagesUrlList}" var="imageUrl">
                        <a href="${imageUrl}" class="thumb active">
                            <img src="${imageUrl}" width="60px" height="60px" />
                        </a>
                    </c:forEach>
                </div>
            </div>
            <div class="product-detail">
                <div class="detail-hd">
                    <h2 class="detail-title">${goods.name}</h2>
                    <div class="detail-price ">
                        <span>${goods.price}</span>
                        <span class="is-auction">可拍卖</span>
                    </div>
                    <p class="bro-counts">浏览了<span>${goods.uv}</span>次</p>
                </div>
                <ul class="detail-information">
                    <li class="detail-place">
                        <div class="name"><span>交易地点</span></div>
                        <div class="value"><span>${goods.transactionAddress}</span></div>
                    </li>
                    <li class="detail-seller">
                        <div class="name"><span>卖家</span></div>
                        <a href="../vip/personal.jsp" target="_blank">
                            <div class="value">
                                <span class="value-name">${goods.vip.name}</span>
                                <img class="detail-grade" src="../../../static/images/project-ico_lv6.png" alt="等级显示">
                            </div>
                        </a>
                    </li>
                    <li class="detail-cert">
                        <div class="name"><span>认证状态</span></div>
                        <div  class="value">
                            <c:choose>
                                <c:when test="${goods.vipApprove eq null}">
                                    <span>用户尚未认证</span>
                                </c:when>
                                <c:when test="${goods.vipApprove ne null}">
                                    <span>${goods.vipApprove.faculty}${goods.vipApprove.grade}级</span>
                                    <span>${goods.vipApprove.school}</span>
                                </c:when>
                            </c:choose>
                        </div>
                    </li>
                    <li class="detail-tel">
                        <div class="name"><span>手机</span></div>
                        <div class="value">
                            <span class="user-num">${goods.vipApprove.phone}</span>
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
                            <span class="real-time">${goods.onlineTimeFormatted}</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="product-user">
            <div class="user-desc ">
                <a href="#">
                    <img id="user_ph" src="${goods.vip.avatarUrl}">
                </a>
                <span id="user_cmt">${goods.description}</span>
            </div>
        </div>

        <%--评论--%>
        <%@include file="../public/comment.jsp"%>

    </div>

    <%@include file="../public/footer.jsp"%>

</div>

<%@include file="../public/siderbar.jsp" %>

<script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../../static/js/project-photo-viewer.js"></script>


</body>
</html>
