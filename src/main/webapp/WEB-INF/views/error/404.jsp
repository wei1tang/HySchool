<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/10
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <title>404错误页面模板</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/error/404.css">

    <script src="${pageContext.request.contextPath}/static/js/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/404/scriptalizer.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function(){
            $('#parallax').jparallax({});
        });
    </script>
</head>
<body>
<div id="content" class="narrowcolumn">

    <div id="parallax">
        <div class="error1">
            <img src="<%=request.getContextPath()%>/static/images/404/wand.jpg" alt="Mauer" />
        </div>
        <div class="error2">
            <img src="<%=request.getContextPath()%>/static/images/404/licht.png" alt="Licht" />
        </div>
        <div class="error3">
            <img src="<%=request.getContextPath()%>/static/images/404/halo1.png" alt="Halo1" />
        </div>
        <div class="error4">
            <img src="<%=request.getContextPath()%>/static/images/404/halo2.png" alt="Halo2" />
        </div>
        <div class="error5">
            <img src="<%=request.getContextPath()%>/static/images/404/batman-404.png" alt="Batcave 404" />
        </div>
    </div>
    <div class="footer-banner" style="width:728px; margin:0 auto"></div>
</div>

</body>
</html>
