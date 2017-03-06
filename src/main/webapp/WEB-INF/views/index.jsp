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
<a href="/vip/login.html">vip登录</a>


<br>
${test}
</body>
</html>