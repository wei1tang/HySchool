<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车界面</title>

    <!--必要样式-->
    <link href="../../static/css/shopping.css" type="text/css" rel="stylesheet"/><!--购物车界面css-->
    <link href="../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->

    <!--<script src="http://www.jq22.com/jquery/1.9.1/jquery.min.js"></script>-->
    <script src="../../static/js/jquery.min.js"></script>

    <script src="../../static/js/shopping-Popt.js"></script>
    <script src="../../static/js/shopping-cityJson.js"></script>
    <script src="../../static/js/shopping-citySet.js"></script>
</head>
<body>

<div class="container">

    <%@include file="public/header.jsp" %>

    <div class="shopping">
        <div id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active" id="bar1">购物车栏</li>
                <li id="bar2">订单信息</li>
                <li id="bar3">确认支付</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <div class="title">
                    购物车界面
                </div>
                <table >
                    <tr class="columns">
                        <th class="name" colspan="2">商品</th>
                        <th class="type">商品信息</th>
                        <th class="price">价格</th>
                        <th class="operation">操作</th>
                    </tr>
                    <tr>
                        <td><img src="../../static/images/index-slider-img/1.jpg"></td>
                        <td><span class="goods-name">二手电脑</span></td>
                        <td>用过几个月,基本是新的,i7,16G内存,11111111111</td>
                        <td><span style="color: #c7c7c7">￥</span><span class="goods-price">5000</span></td>
                        <td>
                            <a >删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="../../static/images/index-slider-img/1.jpg"></td>
                        <td><span class="goods-name">二手电脑</span></td>
                        <td>用过几个月,基本是新的,i7,16G内存,11111111111</td>
                        <td><span style="color: #c7c7c7">￥</span><span class="goods-price">5000</span></td>
                        <td>
                            <a >删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="../../static/images/index-slider-img/1.jpg"></td>
                        <td><span class="goods-name">二手电脑</span></td>
                        <td>用过几个月,基本是新的,i7,16G内存,11111111111</td>
                        <td><span style="color: #c7c7c7">￥</span><span class="goods-price">5000</span></td>
                        <td>
                            <a >删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="../../static/images/index-slider-img/1.jpg"></td>
                        <td><span class="goods-name">二手电脑</span></td>
                        <td>用过几个月,基本是新的,i7,16G内存,11111111111</td>
                        <td><span style="color: #c7c7c7">￥</span><span class="goods-price">5000</span></td>
                        <td>
                            <a >删除</a>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="../../static/images/index-slider-img/1.jpg"></td>
                        <td><span class="goods-name">二手电脑</span></td>
                        <td>用过几个月,基本是新的,i7,16G内存,11111111111</td>
                        <td><span style="color: #c7c7c7">￥</span><span class="goods-price">5000</span></td>
                        <td>
                            <a >删除</a>
                        </td>
                    </tr>
                    <!---总数---->
                    <script type="text/javascript">
                        $(function () {
                            function setTotal() {
                                var len = $(".goods-price");
                                var num = 0;
                                for (var i = 0; i < len.length; i++) {
                                    num = parseInt(num) + parseInt($(len[i]).text());

                                }
                                $(".total-price").text(parseInt(num).toFixed(2));
                                $("#total-num").text(len.length);
                            }
                            setTotal();
                        });
                    </script>
                    <tr>
                        <td colspan="5" style="text-align: right">
                            已选商品<span style="color: red" id="total-num"></span>件&nbsp;&nbsp;&nbsp;
                            总价:<span style="color: red">￥<span class="total-price"></span></span>
                            <a href="#" class="button button-primary button-rounded button-small next action-button">结算</a>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <fieldset>
                <div class="checkout-tit">
                    <span class="tit-txt">填写并核对订单信息</span>
                </div>
                <div class="checkout-steps">
                    <div class="step-tit">
                        <h3>收货人信息</h3>
                    </div>
                    <form class="step-cont" id="cont-info">
                        <div class="cont-item">
                            <label for="cont-name" class="title"><i>*</i>收货人</label>
                            <input type="text" id="cont-name" >
                        </div>
                        <div class="cont-item">
                            <label for="city" class="title"><i>*</i>所在地址</label>
                            <input type="text" id="city"  >
                        </div>
                        <script type="text/javascript">
                            $("#city").click(function (e) {
                                SelCity(this,e);
                                console.log("inout",$(this).val(),new Date())
                            });
                        </script>
                        <div class="cont-item">
                            <label for="cont-detail" class="title"><i>*</i>详细地址</label>
                            <input type="text" id="cont-detail" >
                        </div>
                        <div class="cont-item">
                            <label for="cont-pho" class="title"><i>*</i>手机号码</label>
                            <input type="text" id="cont-pho"  >
                        </div>
                        <a href="#" class="button button-primary button-rounded button-small previous action-button">返回</a>
                        <a href="#" class="button button-primary button-rounded button-small next action-button" >提交订单</a>
                    </form>
                </div>
                 </fieldset>
            <fieldset>
                <h2 class="fs-title">支付宝支付</h2>
                <h3 class="fs-subtitle">请确认转账支付信息:<span style="color: red">￥<span class="total-price"></span></span></h3>

                <a href="#" class="button button-primary button-rounded button-small previous action-button">返回</a>
                <a href="#" class="button button-primary button-rounded button-small submit action-button" >确认支付</a>
            </fieldset>
        </div>
    </div>


    <%@include file="public/footer.jsp" %>
</div>

<div id="easytip-div-cont-name" style="text-align: left; position: absolute; left: 954px; top: 310px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">收货人不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-city" style="text-align: left; position: absolute; left: 954px; top: 358px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">所在地址不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-cont-detail" style="text-align: left; position: absolute; left: 954px; top: 406px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">详细地址不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-cont-pho" style="text-align: left; position: absolute; left: 954px; top: 454px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">手机号码要正确</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>


<!--三个步骤跳转js-->
<script src="../../static/js/jquery.easing.min.js" type="text/javascript"></script>
<script src="../../static/js/shopping-zzsc.js" type="text/javascript"></script>



</body>
</html>