<%--
  Created by IntelliJ IDEA.
  User: tangwei
  Date: 2017/3/27
  Time: 下午2:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>超级管理员界面</title>

    <!--必要样式-->
    <link href="../../../static/css/superAdmin.css" type="text/css" rel="stylesheet"/><!--管理员界面css-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--bootstrapcss-->

    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../../static/js/index-page.js"></script><!--分页js-->

</head>
<body>


<div class="container">
    <%@include file="../public/header-search.jsp"%>

    <div class="superAdmin">
        <div class="title">
            超级管理员界面
        </div>
        <table>
            <tr class="columns">
                <th class="name">用户名</th>
                <th class="num">用户账号</th>
                <th class="status">用户类型</th>
                <th class="operation">操作</th>
            </tr>
            <tr>
                <td>管理员一</td>
                <td>00001</td>
                <td>管理员</td>
                <td>
                    <span>
                    <a href="#" >提升管理员</a>
                    <span class="ant-divider"></span>
                    <a href="#">取消管理员</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td>用户二</td>
                <td>00002</td>
                <td>普通用户</td>
                <td>
                    <span>
                    <a href="#" >提升管理员</a>
                    <span class="ant-divider"></span>
                    <a href="#">取消管理员</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td>用户三</td>
                <td>00003</td>
                <td>管理员</td>
                <td>
                    <span>
                    <a href="#" >提升管理员</a>
                    <span class="ant-divider"></span>
                    <a href="#">取消管理员</a>
                    </span>
                </td>
            </tr>
        </table>
        <!-- 分页 开始 -->
        <div id="page"></div>
        <!-- 分页 结束 -->
    </div>

    <%@include file="../public/footer.jsp"%>

</div>


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
