<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>交易市场</title>
    <%--<!--<%&#45;&#45;<link href="<%=request.getContextPath()%>/static/css/bootstrap.css" rel="stylesheet">&#45;&#45;%>-->--%>

    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../../../static/css/index-search-form.css" /><!--搜索栏css-->
    <link href="../../../static/css/searchfor.css" type="text/css" rel="stylesheet"/><!--首页css-->

    <script type="text/javascript" src="../../../static/js/jquery-3.1.1.min.js"></script><!--jQuery样式-->
    <script type="text/javascript" src="../../../static/js/jquery-ui-1.10.4.min.js"></script><!--jQueryUI样式-->
    <script type="text/javascript" src="../../../static/js/index-search.js"></script><!--搜索栏js-->

    <script type="text/javascript" src="../../../static/js/index-page.js"></script><!--分页js-->

</head>

<script language="JavaScript">
    function check() {
        var name = $.sessionStorage.getItem("key");
        if (name === ""){

        }
    }
</script>


<body>

<div class="container">
    <%@include file="../public/header.jsp"%>

    <div class="showlist">
        <div class="typegoods">
            <div class="search-hots ">
                <a class="hots" href="#">华中科技大学二手市场</a>
                <span class="cat-bread">&gt;</span>
                <a class="hots" href="#">华中科技大学二手校园代步</a>
            </div>
            <div class="search_check">
                <a class="list" >时间</a>
                <a class="list" >积分</a>
                <a class="list" >价格</a>
                <a class="list" >热度</a>
            </div>
        </div>

        <div class="list-totall">
            <div class="list-item">
                <div class="img">
                    <img src="../../../static/images/index-project-img/1.png" class="img" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-1</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>5000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../../static/images/index-project-img/2.png" class="img" />
                    <div class="introduction"><p>这台电脑使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-2</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>50000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../../static/images/index-project-img/3.png" class="img" />
                    <div class="introduction"><p>这手机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-3</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>30000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">手机</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-item">
                <div class="img">
                    <img src="../../../static/images/index-project-img/3.png" class="img" />
                    <div class="introduction"><p>这台洗衣机使用1年</p></div>
                </div>
                <div class="list-content">
                    <div class="name">项目名1-4</div>
                    <div class="money"><span style="color: #c7c7c7">￥</span>5000</div>
                    <div class="deadline">交付时间: 2017/01/13</div>
                    <div class="roles-icons">
                        <div class="roles">
                            <span class="type">电器</span>
                        </div>
                        <div class="icons">
                            <span><i class="fa fa-eye fa-lg"></i>3</span>
                            <span><i class="fa fa-comment fa-lg"></i>0</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
            totalPages: 40,//分页总数
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