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
        #tab-about4{width:300px;height:270px;margin:0 auto;box-shadow:1px 1px 5px #333;-webkit-box-shadow:1px 1px 5px #333;display:none;background-color:#ffffff;overflow:scroll}
        #tab-about4 .rule-hd{
            width: 100%;
            height: 60px;
            text-align: center;
        }
        #tab-about4 .rule-hd h2{
            width: 100%;
            height: 40px;
            padding-top: 10px;
            font-family: Times, TimesNR, 'New Century Schoolbook', Georgia, 'New York', serif;
            font-size:40px;
        }
        #tab-about4 .rules{
            width: 100%;
            font-size: 14px;
            text-align: center;
            background-color: #fff;
            border-spacing: 0;
            vertical-align: middle;
            border-bottom: 4px solid  #00ad90;
            table-layout: fixed;
        }
        #tab-about4 .rules thead{
            color: #fff;
            background-color: #00ad90;
            font-size: 18px;
            font-weight: normal;
        }
        #tab-about4 .rules td,#tab-about4 .rules th{
            width: 50%;
            height: 60px;
            text-align: center;
            margin: 0;
            padding: 0;
            color: #666;
        }
        #tab-about4 .rules th{
            color: #fff;
        }
        #tab-about4 .rules tr{
            position: relative;
            height: 60px;
        }
        #tab-about4 .rules tr:nth-child(2n){
            background-color: #f6f9f9;
        }

        #tab-about4 .r-rule{
            border-right: 1px solid #dee8e8;
        }

        #tab-about4 .rules .r-rule,#tab-about4 .rules .r-punishment{
            width: 46%;
            padding: 0 2%;
        }
    </style>
</head>
<body>

<div id="tab-about4">
    <div class="rule-hd">
        <h2>商品发布规则</h2>
    </div>
    <table class="rules">
        <thead>
        <tr>
            <th>发布规则</th>
            <th>惩罚措施</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="r-rule">同一类型的商品不得多次发布，建议发在一个商品当中。每张图片可以对应一件商品，在商品详情中描述每个商品的价格。</td>
            <td class="r-punishment">一经发现将删除重复商品，只保留一个</td>
        </tr>
        <tr>
            <td class="r-rule">不得在本平台上发布商品图片与实物不一致的商品，若引用网上图片第一张必须为实物拍摄</td>
            <td class="r-punishment">一经发现将删除商品</td>
        </tr>
        <tr>
            <td class="r-rule">不得在本平台上发布带有虚假诈骗信息的商品</td>
            <td class="r-punishment">一经查证将删除发布内容，并且永久封号</td>
        </tr>
        <tr>
            <td class="r-rule">不得在本平台上密集发布全新商品</td>
            <td class="r-punishment">一经发现将视作广告，删除全部商品并封号</td>
        </tr>
        <tr>
            <td class="r-rule">不得在本平台上发布违法商品</td>
            <td class="r-punishment">一经查证将删除发布内容，并且永久封号</td>
        </tr>
        <tr>
            <td class="r-rule">不得在本平台上发布与商品无关信息</td>
            <td class="r-punishment">一经发现将删除发布内容，并且永久封号</td>
        </tr>
        <tr>
            <td class="r-rule">发布商品30天后自动下架</td>
            <td class="r-punishment">下架后可在个人主页重新上架</td>
        </tr>
        </tbody>
    </table>
</div>

<script type="text/javascript" src="../../../static/js/jquery-hDialog.js"></script>
<script>
    $(function() {
        var $el = $('.dialog');
        $el.hDialog({
            box: '#tab-about4',
            boxBg: '#ffffff',
            modalBg: 'rgba(0,0,0,0.5)',
            closeBg: 'rgba(0,0,0,0.6)',
            width: 760,
            height: 542,
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
