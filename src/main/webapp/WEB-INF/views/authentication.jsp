<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>认证界面</title>

    <!--必要样式-->
    <link href="../../static/css/authentication.css" type="text/css" rel="stylesheet"/><!--认证界面css-->
    <link href="../../static/css/admin-buttonstyle.css" type="text/css" rel="stylesheet"/><!--button css-->
    <link href="../../static/css/index-font-awesome.css" type="text/css" rel="stylesheet"/><!--按钮 css-->

    <script src="../../static/js/jquery.min.js"></script>

    <!--上传照片-->
    <link rel="stylesheet" type="text/css" href="../../static/css/bootstrap.css">
    <link href="../../static/css/user-cropper.css" rel="stylesheet">
    <link href="../../static/css/user-sitelogo.css" rel="stylesheet">
    <script src="../../static/js/bootstrap.min.js"></script>
    <script src="../../static/js/cropper.js"></script>
    <script src="../../static/js/user-sitelogo.js"></script>

</head>
<body>

<div class="container">

    <%@include file="public/header.jsp" %>

    <div class="authentication">
        <div id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active" id="bar1">填写认证信息</li>
                <li id="bar2">上传学生证照片</li>
                <li id="bar3">提交认证审核</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <div class="checkout-tit">
                    <span class="tit-txt">填写认证信息</span>
                </div>
                <div class="checkout-steps">
                    <div class="step-tit">
                        <h3>认证信息</h3>
                    </div>
                    <form class="step-cont" id="cont-info">
                        <div class="cont-item">
                            <label for="cont-school" class="title"><i>*</i>学校</label>
                            <input type="text" id="cont-school" >
                        </div>
                        <div class="cont-item">
                            <label for="cont-name" class="title"><i>*</i>姓名</label>
                            <input type="text" id="cont-name" >
                        </div>
                        <div class="cont-item">
                            <label for="cont-id" class="title"><i>*</i>学号</label>
                            <input type="text" id="cont-id"  >
                        </div>
                        <div class="cont-item">
                            <label for="cont-class" class="title"><i>*</i>年级</label>
                            <input type="text" id="cont-class"  >
                        </div>
                        <div class="cont-item">
                            <label for="cont-major" class="title"><i>*</i>专业</label>
                            <input type="text" id="cont-major"  >
                        </div>
                        <a href="#" class="button button-primary button-rounded button-small next action-button" >提交信息</a>
                    </form>
                </div>
            </fieldset>
            <fieldset>
                <div class="pho-title">
                    上传学生证照片
                </div>
                <div class="pho-item">
                    <button type="button" class="button button-primary button-rounded button-small"  data-toggle="modal" data-target="#avatar-modal" >图片上传</button>
                </div>
                <a href="#" class="button button-primary button-rounded button-small previous action-button">返回</a>
                <a href="#" class="button button-primary button-rounded button-small next action-button">前进</a>

            </fieldset>
            <fieldset>
                <h2 class="fs-title">提交认证审核</h2>
                <div class="fs-subtitle">请确认审核信息:
                    <p>学校:<span style="color: red" class="mySchool"></span></p>
                    <p>姓名:<span style="color: red" class="myName"></span></p>
                    <p>学号:<span style="color: red" class="myId"></span></p>
                    <p>年级:<span style="color: red" class="myClass"></span></p>
                    <p>专业:<span style="color: red" class="myMajor"></span></p>
                </div>

                <a href="#" class="button button-primary button-rounded button-small previous action-button">返回</a>
                <a href="#" class="button button-primary button-rounded button-small submit action-button" >确认提交</a>
            </fieldset>
        </div>
    </div>


    <%@include file="public/footer.jsp" %>

</div>

<div id="easytip-div-cont-name" style="text-align: left; position: absolute; left: 954px; top: 310px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">姓名不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-cont-id" style="text-align: left; position: absolute; left: 954px; top: 358px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">学号不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-cont-class" style="text-align: left; position: absolute; left: 954px; top: 406px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">年级不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>
<div id="easytip-div-cont-major" style="text-align: left; position: absolute; left: 954px; top: 454px; width: 300px; display: none;"><div class="easytip-text" style="text-align: left; padding: 10px; min-width: 120px; color: rgb(255, 255, 255); background-color: rgba(0, 147, 253, 0.8); border: 1px solid rgb(0, 147, 253); border-radius: 5px;">专业不能为空</div><div class="easytip-arrow" style="padding: 0px; margin: 0px; width: 0px; height: 0px; position: absolute; border-width: 10px; border-style: solid; border-color: transparent rgb(0, 147, 253) transparent transparent; border-image: initial; left: -20px; top: 15px;"></div></div>


<!--三个步骤跳转js-->
<script src="../../static/js/jquery.easing.min.js" type="text/javascript"></script>
<script src="../../static/js/authentication-zzsc.js" type="text/javascript"></script>

<!--上传图片pho-->
<div class="user_pic" style="margin: 10px;">
    <img src=""/>
</div>
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
            <form class="avatar-form">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                    <h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">
                        <div class="avatar-upload">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <label for="avatarInput" style="line-height: 35px;">图片上传</label>
                            <button class="btn btn-danger"  type="button" style="height: 35px;" onClick="$('input[id=avatarInput]').click();">请选择图片</button>
                            <span id="avatar-name"></span>
                            <input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="avatar-preview preview-lg" id="imageHead"></div>
                                <!--<div class="avatar-preview preview-md"></div>
                        <div class="avatar-preview preview-sm"></div>-->
                            </div>
                        </div>
                        <div class="row avatar-btns">
                            <div class="col-md-4">
                                <div class="btn-group">
                                    <button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
                                </div>
                            </div>
                            <div class="col-md-5" style="text-align: right;">
                                <button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移动">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
							            </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
							              <!--<span class="fa fa-search-plus"></span>-->
							            </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
							              <!--<span class="fa fa-search-minus"></span>-->
							            </span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
                                                            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)" aria-describedby="tooltip866214">
                                                            </span>
                                </button>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
<script src="../../static/js/html2canvas.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../../static/js/user-upload-pho.js"></script>
<!--结束上传pho-->


</body>
</html>