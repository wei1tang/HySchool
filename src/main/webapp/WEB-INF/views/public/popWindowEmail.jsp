<%--
  Created by IntelliJ IDEA.
  User: tangwei
  Date: 2017/4/10
  Time: 上午10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <style type="text/css">

        .container_ui__expand {
            width: 350px;
            box-shadow: 20px 20px 0 rgba(0, 0, 0, 0.16);
            height: 505px;
            position: absolute;
            top: 0;
            opacity: 1;
            left: 0;
            z-index: -1;
            background: white;
        }
        .container_ui__expand .email-body .email-content {
            text-align: left;
            position: relative;
            top: 10px;
            opacity: 1;
        }
        .container_ui__expand .email-body .email-content p {
            text-align: justify;
            font-size: 10px;
            line-height: 20px;
            padding: 25px;
            color: #9b9b9b;
            font-weight: 500;
        }
        .container_ui__expand .email-body .email-content p b {
            color: #444444;
        }
        .container_ui__expand .email-body .email-content span {
            display: block;
            padding: 0 25px;
            font-weight: 800;
            position: relative;
            top: -10px;
            font-size: 10px;
            color: #7d7d7d;
        }
        .container_ui__expand .email-body .email-content button{
            margin-left: 25px;
        }
        .container_ui__expand .email-body .email-content textarea {
            margin: 0 25px;
            width: 295px;
            resize: none;/*用户无法调整元素的尺寸*/
            border: 1px solid #e0e0e0;
            height: 60px;
            border-radius: 3px;
        }
        .container_ui__expand .email-body .email-user {
            border-bottom: 1px solid #ececec;
            height: 65px;
        }
        .container_ui__expand .email-body .email-user .email-details {
            opacity: 1;
            top: 10px;
            position: relative;
            float: left;
            width: 240px;
            text-align: left;
        }
        .container_ui__expand .email-body .email-user .email-details h2 {
            font-size: 14px;
            display: inline-block;
            color: #515151;
            text-transform: uppercase;/*定义仅有大写字母*/
            font-weight: 800;
            margin: 13px 0 0 0;
            padding-top: 0;
        }
        .container_ui__expand .email-body .email-user .email-details h3 {
            font-size: 12px;
            font-weight: 300;
            margin: 5px 0 10px 0;
            text-transform: uppercase;
            color: #B2B2B2;
        }
        .container_ui__expand .email-body .email-user .email-details h4 {
            font-size: 10px;
            font-weight: 600;
            margin: 0;
            color: #919191;
        }
        .container_ui__expand .email-body .email-user .email-face {
            float: left;
        }
        .container_ui__expand .email-body .email-user .email-face img {
            width: 40px;
            border-radius: 100%;
            border: 2px solid white;
            margin: 10px 25px;
        }
        .container_ui__expand .heading {
            height: 10px;
            width: 100%;
            background: #56b699;
        }
        .container_ui__expand .heading_head h1 {
            color: #aeb1d8;
            text-transform: uppercase;
            font-weight: 700;
            height: 10px;
            margin: 0;
            font-size: 12px;
            float: left;
            width: 100%;
            letter-spacing: 1px;
            line-height: 64px;
        }
    </style>
</head>
<body>

<div id="tab-email" style="display: none;">
    <div class="container_ui__expand">
        <div class="heading">
            <div class="heading_head"></div>
        </div>
        <div class="email-body">
            <div class="email-user">
                <div class="email-face">
                    <img src="../../../static/images/index-avatar.png">
                </div>
                <div class="email-details">
                    <h2>aspca</h2>
                    <h3>subj: thanks you are amazing</h3>
                </div>
            </div>
            <div class="email-content">
                <p><b>Email text</b>
                    <br>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et commodo ipsum, ut rhoncus velit. Nullam placerat, ipsum sed pretium varius, magna metus ullamcorper magna, at porta quam libero ut est. Mauris cursus in magna in fermentum. Integer mollis convallis quam, vel dignissim ligula rutrum in.<br><br>Pellentesque ut purus porta, gravida tellus et, consectetur massa. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Pellentesque egestas convallis urna...</p>
                <span>Reply:</span>
                <textarea></textarea>
                <button class="button button-primary button-rounded button-small" type="submit">发送</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="../../../static/js/jquery-hDialog.js"></script>
<script>
    $(function() {
        var $el = $('.dialog2');
        $el.hDialog({
            box: '#tab-email',
            boxBg: '#ffffff',
            modalBg: 'rgba(0,0,0,0.5)',
            closeBg: 'rgba(0,0,0,0.6)',
            width: 350,
            height: 505,
            positions: 'center',
            effect: 'fadeOut',
            hideTime: 0,
            closeHide: false,
            resetForm: false,
            isOverlay: true,
            modalHide: true,
            escHide: false,
            autoShow: false,
            types: 1,
            iframeSrc: '',
            iframeId: 'iframeHBox',

        });
    });
</script>

<%--/*--%>
<%--* 以下是单独的调用示例，你只需要自定义弹框的样式即可。--%>
<%--*          - $(element).hDialog(); //默认调用弹框；--%>
<%--*          - $(element).hDialog({box: '#demo'}); //自定义弹框容器ID/Class；--%>
<%--*          - $(element).hDialog({boxBg: '#eeeeee'}); //自定义弹框容器背景；--%>
<%--*          - $(element).hDialog({modalBg: '#eeeeee'}); //自定义遮罩背景颜色；--%>
<%--*          - $(element).hDialog({closeBg: '#eeeeee'}); //自定义关闭按钮背景颜色；--%>
<%--*          - $(element).hDialog({width: 500}); //自定义弹框宽度；--%>
<%--*          - $(element).hDialog({height: 400}); //自定义弹框高度；--%>
<%--*          - $(element).hDialog({position: 'top'}); //弹框位置(默认center：居中，top：顶部居中，left：顶部居左，bottom：底部居右)--%>
<%--*          - $(element).hDialog({effect: 'fadeOut'}); //弹框关闭效果(结合animate.css里的动画，默认：zoomOut)；--%>
<%--*          - $(element).hDialog({hideTime: 2000}); //弹框定时关闭(默认0:不自动关闭, 以毫秒为单位)--%>
<%--*          - $(element).hDialog({closeHide: false}); //是否隐藏关闭按钮(默认true：不隐藏，false：隐藏)--%>
<%--*          - $(element).hDialog({resetForm: false}); //false:不重置表单,反之重置；--%>
<%--*          - $(element).hDialog({modalHide: false}); //false:点击遮罩背景不关闭弹框,反之关闭；--%>
<%--*          - $(element).hDialog({isOverlay: false}); //是否显示遮罩背景(默认true：显示，false：不显示)--%>
<%--*          - $(element).hDialog({escHide: false}); //false:按ESC不关闭弹框,反之关闭；--%>
<%--*          - $(element).hDialog({autoShow: false}); //是否页面加载完成后自动弹出(默认false点击弹出，true：自动弹出)--%>
<%--*          - $(element).hDialog({types:2,iframeSrc:'http://css.doyoe.com/',iframeId:'iframeHBox',width:960,height:600}); //调用框架--%>
<%--*--%>
<%--*/--%>

</body>
</html>
