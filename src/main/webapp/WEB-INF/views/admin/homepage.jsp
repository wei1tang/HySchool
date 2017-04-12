<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>管理员界面</title>

    <!--必要样式-->
    <link href="../../../static/css/admin.css" type="text/css" rel="stylesheet"/><!--管理员界面css-->
    <link href="../../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button pcss-->

    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../../static/js/index-page.js"></script><!--分页js-->

</head>
<body>

<div class="container">
    <%@include file="../public/header.jsp"%>

    <div class="admin">
        <div class="title">
            管理员界面
        </div>
        <table>
            <tr class="columns">
                <th class="name">物品名</th>
                <th class="type">物品类型</th>
                <th class="status">状态</th>
                <th class="operation">操作</th>
            </tr>
            <tr>
                <td>物品一</td>
                <td>电脑</td>
                <td>审核通过</td>
                <td>
                    <span>
                    <a href="#" >审核通过</a>
                    <span class="ant-divider"></span><a href="#">不通过</a>
                    <span class="ant-divider"></span>
                    <a href="#">删除</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td>物品二</td>
                <td>电脑</td>
                <td>审核通过</td>
                <td>
                    <span>
                    <a href="#" >审核通过</a>
                    <span class="ant-divider"></span><a href="#">不通过</a>
                    <span class="ant-divider"></span>
                    <a href="#">删除</a>
                    </span>
                </td>
            </tr>
            <tr>
                <td>物品三</td>
                <td>电脑</td>
                <td>审核通过</td>
                <td>
                    <span>
                    <a href="#" >审核通过</a>
                    <span class="ant-divider"></span><a href="#">不通过</a>
                    <span class="ant-divider"></span>
                    <a href="#">删除</a>
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
            pageHref:'http',//当前页面链接,pageHref+i(页面数字)=(string类型)href页面的链接
            callBack : function(page){
                //console.log(page)
            }
        });
    })
</script>
<!-- 分页 结束 -->
</body>
</html>