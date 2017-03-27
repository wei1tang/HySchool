<%--
  Created by IntelliJ IDEA.
  User: tangwei
  Date: 2017/3/27
  Time: 上午9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../../../static/css/index-slider-font.css" rel="stylesheet" type="text/css" /><!--四张照片滑动样式-->
    <script type="text/javascript" src="../../../static/js/index-slider.js"></script><!--滑动图片js-->

</head>
<body>

<div id="slider">
    <div id="slider-panels">
        <div id="slider-panels-next"><span class="iconb" data-icon="&#xe24e;"></span></div>
        <div id="slider-panels-previous"><span class="iconb" data-icon="&#xe24b;"></span></div>

        <div id="slider-panel-images">
            <img src="../../../static/images/index-slider-img/1.jpg" width="900" height="200" /><!--修改400px->200px-->
            <img src="../../../static/images/index-slider-img/2.jpg" width="900" height="200" /><!--修改400px->200px-->
            <img src="../../../static/images/index-slider-img/3.jpg" width="900" height="200" /><!--修改400px->200px-->
            <img src="../../../static/images/index-slider-img/4.jpg" width="900" height="200" /><!--修改400px->200px-->
        </div>

        <div id="slider-panel-left">
            <div id="slider-panel-left-carousel"></div>
        </div>

        <div id="slider-panel-center">
            <div id="slider-panel-center-carousel"></div>
        </div>

        <div id="slider-panel-right">
            <div id="slider-panel-right-carousel"></div>
        </div>
        <div id="slider-dots"></div>
    </div>
</div>

</body>
</html>
