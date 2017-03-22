<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>管理员界面</title>

    <!--必要样式-->
    <link href="../../static/css/admin.css" type="text/css" rel="stylesheet"/><!--管理员界面css-->
    <link href="../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--bootstrapcss-->

</head>
<body>

<div class="container">
    <div class="header">
        <div class="header-content">
            <div class="logo">
                <img src="../../static/images/index-logo.png" class="" />二手交易网
            </div>
            <div class="nav">
                <a class="list" >首页</a>
                <a class="list" >关于</a>
            </div>
            <div class="me">
                <div class="avatar-link" title="user">
                    <img src="../../static/images/index-avatar.png" class="avatar" alt="avatar"/>
                    Hello, {user.name}
                </div>
                <div class="button-link">
                    <a href="#" class="button button-primary button-rounded button-small">退出登录</a>
                </div>
            </div>
            <!--<div class="sign">-->
                <!--<a class="list" >登录</a>-->
                <!--<a class="list" >注册</a>-->
            <!--</div>-->
        </div>
    </div>

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
        <div class=" middle">
            <div class="pagination">
                <ul>
                    <li><a href="#"></a></li>
                    <li class="active"><a href="#"></a></li>
                    <li><a href="#"></a></li>
                    <li><a href="#"></a></li>
                </ul>
            </div>
        </div>
        <!-- 分页 结束 -->
    </div>
    <div class="footer">
        <div>
            <a href="" class="footer-entry" target="_blank">服务条款</a> |
            <a href="" class="footer-entry" target="_blank">隐私政策</a> |
            <a href="" class="footer-entry" target="_blank">版权所有</a>
            <!--修改-->
        </div>
        <div>
            <span class="footer-entry last">华中科技大学花样校园毕设项目组保留所有权利。</span>
        </div>
    </div>
</div>

</body>
</html>