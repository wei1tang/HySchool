<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">
</head>

<script language="JavaScript">
    function check() {
        var name = $.sessionStorage.getItem("key");
        if (name === ""){

        }
    }
</script>

<body>
index
<a href="${pageContext.request.contextPath}/vip/login.html">vip登录</a>


<br>
${test}
<a href="${pageContext.request.contextPath}/vip/logout.html">vip登出</a>


<button class="cause-icon">jsonDemo</button>

<script src="<%=request.getContextPath()%>/static/js/jquery-3.1.1.min.js"></script>
<script>
    $(function () {
        $(".cause-icon").click(
            function () {
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/json.html",
                dataType:"json",
                success: function(data){
                    if(data && data.status) {
                        if (null != data.str && "" != $.trim(data.str)) {
                            $(".cause-icon").text(decodeURIComponent(data.str));
                        }
                    }
                }
            });
        });
    });

</script>
</body>
</html>