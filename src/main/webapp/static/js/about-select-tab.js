/**
 * Created by tangwei on 2017/3/1.
 */
$('.about .left .nav ').each(function () {
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

    });
})


