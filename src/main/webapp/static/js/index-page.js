/* 
*page plugin 1.0   2016-09-29 by cary
*/
var returnNum=null;

(function ($) {
  //默认参数
  var defaults = {
    totalPages: 9,//总页数
    liNums: 9,//分页的数字按钮数(建议取奇数)
    activeClass: 'active' ,//active类
    firstPage: '首页',//首页按钮名称
    lastPage: '末页',//末页按钮名称
    prv: '上一页',//前一页按钮名称
    next: '下一页',//后一页按钮名称
    hasFirstPage: true,//是否有首页按钮
    hasLastPage: true,//是否有末页按钮
    hasPrv: true,//是否有前一页按钮
    hasNext: true,//是否有后一页按钮
    pageHref:'http',//当前页面链接
    currentPage:1,//当前页数
    callBack : function(page){
        //回掉，page选中页数
    }
  };

  //插件名称
  $.fn.Page = function (options) {
    //覆盖默认参数
    var opts = $.extend(defaults, options);
    //主函数
    return this.each(function () {
      var obj = $(this);
      var l = opts.totalPages;
      var n = opts.liNums;
      var active = opts.activeClass;
      var str = '';
      if(opts.currentPage==1){
          fpagePrv(0);
      }else if (l > 1&&l < n+1) {
        for (i = 2; i < l + 1; i++) {
            if(opts.currentPage==i){
                str += '<li><a href=" '+ opts.pageHref + i+ ' " class="'+ active +' ">' + i + '</a></li>';
            }else{
                str += '<li><a href=" '+ opts.pageHref + i+ ' ">' + i + '</a></li>';
            }
        }
      }else if(l > n){
        if (opts.currentPage>1&& opts.currentPage < n + 1) {
            var pageshow = opts.currentPage;
            var nums = odevity(n);
            if (pageshow > l - nums / 2 && pageshow < l + 1) {
                //最后几项
                fpageNext((n - 1) - (l - pageshow));
            } else if (pageshow > 0 && pageshow < nums / 2) {
                //最前几项
                fpagePrv(pageshow - 1);
                str = '';
            } else {
                fpageShow(pageshow);
            }
        }
        if(opts.currentPage>n&&opts.currentPage<l+1){
                pageshow=opts.currentPage;
                nums = odevity(n);
                if(pageshow > l-nums/2&&pageshow < l+1){
                    //最后几项
                    fpageNext((n-1)-(l-pageshow));
                }else if(pageshow > 0&&pageshow < nums/2){
                    //最前几项
                    fpagePrv(pageshow-1);
                }else{
                    fpageShow(pageshow);
                }
        }
      }
      var dataHtml = '';
        if(opts.hasPrv){
            dataHtml += '<a class="prv ">' + opts.prv + '</a>';
        }
        if(opts.hasFirstPage){
            dataHtml += '<a class="first ">' + opts.firstPage + '</a>';
        }
        dataHtml += '<ul class="pagingUl">' +  str + '</ul>';
        if(opts.hasLastPage){
            dataHtml += '<a class="last ">' + opts.lastPage + '</a>';
        }
        if(opts.hasNext){
            dataHtml += '<a class="next ">' + opts.next + '</a>';
        }
        dataHtml += '<div class="pageskip">' + '共' + opts.totalPages + '页,到第'+ '<input type="text"/>' + '页'+'<button>确定</button>'+'</div>';

        obj.html(dataHtml).off("click");//防止插件重复调用时，重复绑定事件

        obj.on('click', '.next', function () {
            var pageshow = parseInt($('.' + active).html());
            var str1 = '';

            str1 = opts.pageHref+(pageshow+1);

            if(pageshow >= l) {
                return;
            }else {
              returnNum=pageshow+1;
                obj.find('.next').attr("href",str1);
            }
        });
        obj.on('click', '.prv', function () {
            var pageshow = parseInt($('.' + active).html());
            var str1 = '';

            str1 = opts.pageHref+(pageshow-1);
            if (pageshow <= 1) {
                return;
            }else {
                returnNum=pageshow-1;
                obj.find('.prv').attr("href",str1);
            }
        });
        obj.on('click', '.first', function(){
            var activepage = parseInt($('.' + active).html());
            var str1 = '';

            str1 = opts.pageHref+1;

            if (activepage <= 1){
                return
            }//当前第一页
            else{
                returnNum=1;
                obj.find('.first').attr("href",str1);
            }
        });
        obj.on('click', '.last', function(){
            var activepage = parseInt($('.' + active).html());
            var str1 = '';

            str1 = opts.pageHref+l;

            if (activepage >= l){
                return;
            }//当前最后一页
            else{
                returnNum=l;
                obj.find('.last').attr("href",str1);
            }
        });

        obj.on('click', 'li', function(){
            var $this = $(this);
            var pageshow = parseInt($this.find('a').html());
            var nums = odevity(n);
            opts.callBack(pageshow);
            if(l>n){
                if(pageshow > l-nums/2&&pageshow < l+1){
                    //最后几项
                    fpageNext((n-1)-(l-pageshow));
                }else if(pageshow > 0&&pageshow < nums/2){
                    //最前几项
                    fpagePrv(pageshow-1);
                }else{
                    fpageShow(pageshow);
                }
            }else{
                $('.' + active).removeClass(active);
                $this.find('a').addClass(active);
            }
        });


        //重新渲染结构
        /*activePage 当前项*/
        function fpageShow(activePage){
          var nums = odevity(n);
          var pageStart = activePage - (nums/2-1);
          for(i=0;i<n;i++){
              if(opts.currentPage==(pageStart+i)){
                  str += '<li><a href=" '+ opts.pageHref + (pageStart+i)+ ' " class="'+ active +' ">' + (pageStart+i) + '</a></li>';
              }else{
                  str += '<li><a href=" '+ opts.pageHref + (pageStart+i)+ ' ">' + (pageStart+i) + '</a></li>';
              }
          }
        }
        /*index 选中项索引*/
        function fpagePrv(index){
          if(l>n-1){
            for(i=0;i<n;i++){
                if(opts.currentPage==(i+1)){
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' " class="'+ active +' ">' + (i+1) + '</a></li>';
                }else{
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' ">' + (i+1) + '</a></li>';
                }
            }
          }else{
            for(i=0;i<l;i++){
                if(opts.currentPage==(i+1)){
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' " class="'+ active +' ">' + (i+1) + '</a></li>';
                }else{
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' ">' + (i+1) + '</a></li>';
                }
            }
          }
        }
        /*index 选中项索引*/
        function fpageNext(index){
          if(l>n-1){
            for(i=l-(n-1);i<l+1;i++){
                if(opts.currentPage==i){
                    str += '<li><a href=" '+ opts.pageHref + i+ ' " class="'+ active +' ">' + i + '</a></li>';
                }else{
                    str += '<li><a href=" '+ opts.pageHref + i + ' " class="">' + i + '</a></li>'
                }
            }
          }else{
            for(i=0;i<l;i++){
                if(opts.currentPage==(i+1)){
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' " class="'+ active +' ">' + (i+1) + '</a></li>';
                }else{
                    str += '<li><a href=" '+ opts.pageHref + (i+1)+ ' ">' + (i+1) + '</a></li>';
                }
            }
          }
        }
        //判断liNums的奇偶性
        function odevity(n){
          var a = n % 2;
          if(a == 0){
            //偶数
            return n;
          }else if(a == 1){
            //奇数
            return (n+1);
          }
        }
    });
  }

})(jQuery);

function clickNum() {
    if(returnNum=null){
      return
    }else{
      return returnNum;
    }
};