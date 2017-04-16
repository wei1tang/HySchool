<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <%--<link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">--%>

    <!--必要样式-->
    <link href="../../static/css/index.css" type="text/css" rel="stylesheet"/><!--首页css-->
    <script type="text/javascript" src="../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../static/js/jquery-ui-1.10.4.min.js"></script><!--jQueryUI样式-->

    <script type="text/javascript" src="../../static/js/index-page.js"></script><!--分页js-->

</head>

<script language="JavaScript">
    function check() {
        var name = $.sessionStorage.getItem("key");
        if (name === "") {

        }
    }
</script>

<body>

<div class="container">
    <%@include file="public/header.jsp" %>

    <%@include file="public/slider.jsp" %>

    <div class="showlist">
        <div class="typegoods">
            <div class="search_check">
                <a class="list">时间</a>
                <a class="list">积分</a>
                <a class="list">价格</a>
                <a class="list">热度</a>
            </div>
        </div>

        <div class="list-totall">
            <c:forEach var="goods" items="${goodsList}">
                <div class="list-item">
                    <div class="img">
                        <img src="${goods.coverImageUrl}" class="img"/>
                        <div class="introduction">
                            <a href="${pageContext.request.contextPath}/goods/no${goods.id}" style="text-decoration: none;color: white">
                                <p style="">${goods.description}</p>
                            </a>
                        </div>
                    </div>
                    <div class="list-content">
                        <div class="name">${goods.name}</div>
                        <div class="money"><span style="color: #c7c7c7">￥</span>${goods.price}</div>
                        <div class="deadline">上架时间: ${goods.onlineTimeFormatted}</div>
                        <div class="roles-icons">
                            <div class="roles">
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
                            <div class="icons">
                                <span><i class="fa fa-eye fa-lg"></i>${goods.uv}</span>
                                <span><i class="fa fa-comment fa-lg"></i>${goods.totalComments}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 分页 开始 -->
        <div id="page"></div>
        <!-- 分页 结束 -->
    </div>
    <%@include file="public/footer.jsp" %>

</div>
<!--侧边栏start-->
<%@include file="public/siderbar.jsp" %>
<!--侧边栏end-->
<!--右边侧栏我要发布start-->
<div class="rightsidebar">
    <a></a>
</div>

<!--右边侧栏我要发布end-->
<!-- 分页 开始 -->
<script type="text/javascript">
    $(function () {
        $("#page").Page({
            totalPages: ${totalPages},//分页总数
            liNums: 9,//分页的数字按钮数(建议取奇数)
            activeClass: 'activP', //active 类样式定义
            pageHref:'${pageContext.request.contextPath}'+'${pageUri}',//当前页面链接,pageHref+i(页面数字)=(string类型)href页面的链接
            currentPage:'${pageNo}',//当前页数
            callBack: function (page) {
                //console.log(page)
            }
        });
    });
//将div元素改为a标签,当点击时添加href链接,为pageHref+i(页面数字),会自动跳转到第i页,注意要从后台将currentpage补上否则出错
</script>
<!-- 分页 结束 -->

</body>
</html>
