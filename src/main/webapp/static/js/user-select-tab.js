/**
 * Created by tangwei on 2017/3/1.
 */
$('.user .left .nav ').each(function () {
    var $this = $(this);
    var $tab  = $this.find('li.active');
    var $link = $tab.find('a');
    var $panel= $($link.attr('href'));

    $this.on('click','.item',function (e) {
        e.preventDefault();
        var $link = $(this);
        var id    = this.hash;


        if (id && !$link.is('.active')){
            $panel.removeClass('active');
            $tab.removeClass('active');

            $panel =$(id).addClass('active');
            $tab   =$link.parent().addClass('active');
        }



        if(!$('#tab-2').hasClass('active')){
            // $('input').each(function () {
            //     var id=this.id;
            //     id="easytip-div-main"+id;
            //     alert(id);
            // });
            $('#easytip-div-mainitem-name').css({
                'display':'none'
            });
            $('#easytip-div-maintrade-place').css({
                'display':'none'
            });
            $('#easytip-div-mainitem-price').css({
                'display':'none'
            });
            $('#easytip-div-maindate').css({
                'display':'none'
            });
            $('#easytip-div-mainitem-tel').css({
                'display':'none'
            });
            $('#easytip-div-mainitem-email').css({
                'display':'none'
            })
        }
        if(!$('#tab-1').hasClass('active')){
            $('#easytip-div-mainemailname').css({
                'display': 'none'
            });
            $('#easytip-div-maintelname').css({
                'display': 'none'
            });
            $('#easytip-div-mainusername').css({
                'display': 'none'
            })
        }

    });





})

