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
        if (name === ""){

        }
    }
</script>

<body>

<div class="container">
    <c:if test="${sessionScope.vip eq null}">
        <%@include file="header/unsign-search-header.jsp"%>
    </c:if>
    <c:if test="${sessionScope.vip ne null}">
        <%@include file="header/signed-search-header.jsp"%>
    </c:if>

    <%@include file="public/slider.jsp"%>

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
            <c:forEach var="goods" items="${goodsList}">
                <div class="list-item">
                    <div class="img">
                        <img src="${goods.coverImageUrl}" class="img" href="project.jsp" />
                        <div class="introduction"><p>${goods.description}</p></div>
                    </div>
                    <div class="list-content">
                        <div class="name">${goods.name}</div>
                        <div class="money"><span style="color: #c7c7c7">￥</span>${goods.price}</div>
                        <div class="deadline">上架时间: ${goods.onlineTimeFormatted}</div>
                        <div class="roles-icons">
                            <div class="roles">
                                <span class="type">${goods.category}</span>
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
    <%@include file="public/footer.jsp"%>

</div>
<!--侧边栏start-->
<%@include file="public/siderbar.jsp"%>
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
            totalPages: ${totalPages},//分页总数
            liNums: 9,//分页的数字按钮数(建议取奇数)
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
