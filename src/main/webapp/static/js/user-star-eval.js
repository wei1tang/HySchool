/**
 * Created by tangwei on 2017/3/1.
 */
//重新点评
function addComment2(e,inid,opt,id){
    $.ajax({
        url:'/siteMessage/content',
        type:'post',
        data:'id='+id,
        dataType:'json',
        success:function(data){
            if(data.status==1){

                var arr = [data.total,data.expAuth,data.killAuth,data.followTime,data.formality,data.appReact];
                var list2 = $('span.level','#Addnewskill_119');
                $('input[name="InterviewCommentInfoSub[opt]"]').val(opt+1);
                list2.each(function(i,v){
                    var a = '';

                    if(i>0){
                        a = 'cjmark';
                        $(v).parents('li').find('input').val(arr[i]);
                    }
                    var str = '';
                    if(arr[i]==6){
                        for(var n=0;n<=4;n++){
                            str += '<i '+a+' class="level_hollow"></i>';
                        }
                        $(v).parents('li').find('input').prop('disabled',true)
                    }else{
                        $(v).parents('li').find('input').prop('checked',true)
                        for(var n=0;n<arr[i];n++){
                            str += '<i '+a+' class="level_solid"></i>';
                        }
                        for(var n=0;n<(5-arr[i]);n++){
                            str += '<i '+a+' class="level_hollow"></i>';
                        }
                    }
                    $(v).html(str);
                    $(v).next().html(degree[arr[i]]);

                })


                create_show(119);
            }else{
                ui.error(data.msg,2000);
            }
        }
    })
}
//提交点评
function addComment3(){
    $.ajax({
        url:'/siteMessage/commentinterview',
        type:'post',
        data:$('form[name="comment"]').serialize(),
        dataType:'json',
        success:function(data){

        }

    })
}

$(function(){
    //点星星
    $(document).on('mouseover','i[cjmark]',function(){
        var num = $(this).index();
        var pmark = $(this).parents('.revinp');
        var mark = pmark.prevAll('input');

        if(mark.prop('checked')) return false;

        var list = $(this).parent().find('i');
        for(var i=0;i<=num;i++){
            list.eq(i).attr('class','level_solid');
        }
        for(var i=num+1,len=list.length-1;i<=len;i++){
            list.eq(i).attr('class','level_hollow');
        }
        $(this).parent().next().html(degree[num+1]);

    })
    //点击星星
    $(document).on('click','i[cjmark]',function(){
        var num = $(this).index();
        var pmark = $(this).parents('.revinp');
        var mark = pmark.prevAll('input');

        if(mark.prop('checked')){
            mark.val('');
            mark.prop('checked',false);mark.prop('disabled',true);
        }else{
            mark.val(num);
            mark.prop('checked',true);mark.prop('disabled',false);
        }
    })



})