<%--
  Created by IntelliJ IDEA.
  User: LJW
  Date: 2017/3/22
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Index</title>
    <link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">

    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>

<script language="JavaScript">
    function check() {
        var name = $.sessionStorage.getItem("vip");
        var type = "${sessionScope.vip.userType}";
        var user = '<%=session.getAttribute("vip")%>';
        if (user === "null") {
            //没登录

        } else if (type == 1) {
            //普通vip
        }
    }
</script>

<body>


<button class="cause-icon">jsonDemoGET</button>
<button class="cause-icon-post">jsonDemoPOST</button>
<br>
<br>
<form id="formDemo">
    <input type="text" name="name" value="lv jinwang">
    <input type="text" name="email" value="769707043@qq.com">
    <input type="button" id="formDemoSubmit" value="提交">
</form>
<div id="formReturn"></div>

<br>
<input type="button" class="btn btn-success btn-lg btn-right" value="通过"
       onclick="return checkReason(1, true);">

<%--一个string的list--%>
<c:forEach items="${hisReason}" var="reasons" varStatus="tik">
    <h2>
        第${tik.index+1}次审核记录：
    </h2>
    <div>
            ${reasons}
    </div>
</c:forEach>


<script src="<%=request.getContextPath()%>/static/js/jquery-3.1.1.min.js"></script>
<script>

    $(document).ready(function () {

    });

    /*ajax的表单post*/
    $(function () {
        $("#formDemoSubmit").click(
            function () {
                console.log($("#formDemo").serialize());
                $.ajax({
                    type: "POST",
                    data: $("#formDemo").serialize(),
                    url: "${pageContext.request.contextPath}/jsonForm.html",
                    dataType: "json",
                    success: function (json) {
                        $("#formReturn").text(json.message);
                        //window.location.href = json.href;
                    },
                    error: function (json) {
                        $("#formReturn").text(json.message)
                    }
                });
            });

        /*ajax的get请求*/
        $(".cause-icon").click(
            function () {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/json.html",
                    //data: {newsId:id},
                    dataType: "json",
                    success: function (data) {
                        if (data && data.status) {
                            if (null != data.str && "" != $.trim(data.str)) {
                                $(".cause-icon").text(decodeURIComponent(data.str));
                            }
                        }
                    }
                });
            });

        /*ajax的封装数据post请求*/
        $(".cause-icon-post").click(
            function () {
                var dataAjax = {
                    demo: "POST SUCCESS!"
                }
                $.ajax({
                    type: "POST",
                    data: dataAjax,
                    url: "${pageContext.request.contextPath}/json.html",
                    dataType: "json",
                    success: function (data) {
                        if (data && data.status) {
                            if (null != data.demo && "" != $.trim(data.demo)) {
                                $(".cause-icon-post").text(decodeURIComponent(data.demo));
                            }
                        }
                    }
                });
            });


        //加上下面代码,ajax才能post
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });


    });


    /**
     *
     *
     * @param status
     * @param isPass
     * @returns {boolean}
     */
    function checkReason(status, isPass) {
        var msg = "已通过";
        if (isPass == false) {
            var value = $.trim($('#reason').val());
            if (value == '') {
                $('#subTip').html('驳回情况下，请填写审核理由。');
                return false;
            }
            msg = "已驳回";
        }
        $('#status').val(status);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/audit/new/user/check4update.action",
            data: $("form").serializeArray(),
            success: function (data) {
                if (data.indexOf("input") > 0 && data.indexOf("select") > 0) {
                    alert(msg);
                    window.opener.userformSubmit();
                    self.close();
                } else {
                    $('#auditView').html(data);
                }
            },
            error: function () {
                alert("提交失败,请尝试重新提交");
            }
        });
        return false;
    }
</script>
</body>
</html>
