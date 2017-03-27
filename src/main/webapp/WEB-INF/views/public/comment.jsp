<%--
  Created by IntelliJ IDEA.
  User: tangwei
  Date: 2017/3/27
  Time: 下午2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="../../static/css/comment.css" type="text/css" /><!--评论css-->



    <script type="text/javascript" src="../../static/js/jquery-1.7.2.min.js"></script>
    <%--关于 jQuery的.die和.live  3.1.1版本不支持--%>

    <script type="text/javascript" src="../../static/js/comment.js"></script>


</head>
<body>

<div id="articleComment"></div>

<script type="text/javascript">

    var agoComment = [

//        sortID对应于0则为一级评论,对应大于0,评论为多级评论且对应id的评论.headPortrait为用户头像地址.userName为用户名.time为时间.content为评论内容.
//        注意id一定不能重复,每条评论单独有一个id
        {"id":1,"headPortrait":"../../static/images/index-avatar.png","userName":"游客1","time":"2014-04-04","sortID":0,"content":"第一条评论"},

        {"id":2,"headPortrait":"../../static/images/index-avatar.png","userName":"游客2","time":"2014-04-04","sortID":0,"content":"第二条评论"},

        {"id":3,"headPortrait":"../../static/images/index-avatar.png","userName":"站长","time":"2014-04-04","sortID":1,"content":"第一条评论的回复"},

        {"id":4,"headPortrait":"../../static/images/index-avatar.png","userName":"站长","time":"2014-04-04","sortID":2,"content":"第二条评论的回复"},

        {"id":5,"headPortrait":"../../static/images/index-avatar.png","userName":"游客3","time":"2014-04-04","sortID":0,"content":"第三条评论"},

        {"id":6,"headPortrait":"../../static/images/index-avatar.png","userName":"游客2","time":"2014-04-04","sortID":4,"content":"第二条评论的回复的回复"},

        {"id":7,"headPortrait":"../../static/images/index-avatar.png","userName":"游客4","time":"2014-04-04","sortID":6,"content":"第二条评论的回复的回复的回复"},

        {"id":8,"headPortrait":"../../static/images/index-avatar.png","userName":"游客4","time":"2014-04-04","sortID":7,"content":"第二条评论的回复的回复的回复的回复"},

        {"id":9,"headPortrait":"../../static/images/index-avatar.png","userName":"游客4","time":"2014-04-04","sortID":8,"content":"第二条评论的回复的回复的回复的回复"},

    ];

    $("#articleComment").zyComment({

        "width":"355",

        "height":"33",

        "agoComment":agoComment,

        "callback":function(comment){

            console.info("填写内容返回值：");

            console.info(comment);
            // 添加新的评论

            $("#articleComment").zyComment("setCommentAfter",{"id":123,"headPortrait":"../../static/images/index-avatar.png", "name":"name", "content":"content", "time":"2014-04-14"});

            agoComment.push({"id":123,"headPortrait":"../../static/images/index-avatar.png", "userName":"name", "content":"content", "time":"2014-04-14"});

        }
    });

</script>


</body>
</html>
