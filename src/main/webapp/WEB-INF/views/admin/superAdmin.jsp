<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>超级管理员界面</title>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!--必要样式-->
    <link href="../../../static/css/superAdmin.css" type="text/css" rel="stylesheet"/><!--超级管理员界面css-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->

    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../../static/js/index-page.js"></script><!--分页js-->

</head>


<div class="container">
    <%@include file="../public/header-search.jsp"%>

    <div class="superAdmin">
        <div class="title">
            超级管理员界面
        </div>
        <table>
            <tr class="columns">
                <th class="num">用户账号</th>
                <th class="name">用户名</th>
                <th class="status">用户类型</th>
                <th class="operation">操作</th>
            </tr>
            <c:forEach var="vip" items="${vipList}">
            <h id="test1">test1</h>
                <tr>
                    <td id="vipId">${vip.id}</td>
                    <td id="vipName">${vip.name}</td>
                    <td id="vipType">${vip.stringUserType}</td>
                    <td>
                    <span>
                    <a id="setAdmin"  >提升管理员</a>
                    <span class="ant-divider"></span>
                    <a id="removeAdmin" >取消管理员</a>
                    </span>
                    </td>
                </tr>
            </c:forEach>

        </table>
        <!-- 分页 开始 -->
        <div id="page"></div>
        <!-- 分页 结束 -->
    </div>

    <%@include file="../public/footer.jsp"%>

</div>

<!--ajax json实现-->
<script>
    $(document).ready(function () {
    });

    $(function(){
        $("#setAdmin").click(
                function(){
                    $.ajax({
                        type:"POST",
                        data:{vipId:$("#vipId").val()},
                        dataType: "json",
                        url: "${pageContext.request.contextPath}/admin/superAdmin",
                        success: function (data){
                            $("#vipType").val(data.stringUserType);
                            $("#test1").val("sss");
                        }
                    });
            }
        );
        $("#removeAdmin").click(
                function(){
                    $.ajax({
                        type:"GET",
                        dataType: "json",
                        success: function (data){
                            alert("do this")
                            $("#vipType").val(data.stringUserType);
                        }
                    });
                }
        );

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $(document).ajaxSend(function (e, xhr, options) {
            xhr.setRequestHeader(header, token);
        });
    });


</script>
<%--<!--ajax(非json)-->
<script type="text/javascript" >
    function changeType() {

        //发送ajax 更新请求 并处理
        var request = new XMLHttpRequest();
        request.onreadystatechange = function () {
            if (request.readyState == 4) {
                if (request.status == 200) {
                    document.getElementById("vipType").innerHTML = request.responseText;
                }
                else {
                    alert("error");
                }
            }
        }
        request.open("POST", "admin/superAdmin");
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        var vipId = document.getElementById("vipId").value;
        request.send(vipId);

    }

</script>--%>
<!-- 分页 开始 -->
<script type="text/javascript">
    $(function(){
        $("#page").Page({
            totalPages:40,//分页总数
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
