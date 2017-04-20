//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches


function validateRequired(el) {
		var valid=!el.value;
		if(valid){
			return false;
		}else{
            return true;
		}
}
function showErrorMessage(el){
	var $el=$(el);
    var id =  "easytip-div-" + el.id;
    var $tip=$("#"+id);
    $tip.css({
        'display': 'block',
	});
}
function removeErrorMessage(el){
    var $el=$(el);

    var offset = $el.parent().offset();
    var idLeft=offset.left+563;
    var idRight=offset.right-10;

    var id =  "easytip-div-" + el.id;
    var $tip=$("#"+id);
    $tip.css({
        'display': 'none',
        'left':idLeft+'px',
        'right':idRight+'px',
    });
}
function validateTypes(el) {
	if(el.id ==='cont-pho'){
        var valid = /^1[34578]\d{9}$/.test(el.value) ;
        if(!valid){
            return false;
        }
        return valid;
	}else{
		return true;
	}
}


$(".next").click(function(){

	//差表单验证
    if($('#bar1').hasClass('active')&&$('#bar2').hasClass('active')&&!$('#bar3').hasClass('active')) {
        var $this = document.getElementById("cont-info");

        var elements = $this.elements;
        var valid = {};
        var isValid;
        var isFormValid;

        for (var i = 0, l = elements.length ; i < l; ) {
            isValid = validateRequired(elements[i]) && validateTypes(elements[i]);
            if(elements[i].type==='hidden'){
            	isValid=true;
			}
            if (!isValid) {
                showErrorMessage(elements[i]);
            } else {
                removeErrorMessage(elements[i]);
            }
            valid[elements[i].id] = isValid;
            i++;
        }

        for (var filed in valid) {
            if (!valid[filed]) {
                isFormValid = false;
                break;
            }
            isFormValid = true;
        }
        if (!isFormValid) {

        }else {
            if(animating) return false;
            animating = true;

            current_fs = $(this).parents('fieldset');
            next_fs = $(this).parents('fieldset').next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();
            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function(now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50)+"%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({'transform': 'scale('+scale+')'});
                    next_fs.css({'left': left, 'opacity': opacity});
                },
                duration: 800,
                complete: function(){
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
		}

    }else{
        if(animating) return false;
        animating = true;

        current_fs = $(this).parents('fieldset');
        next_fs = $(this).parents('fieldset').next();

        //activate next step on progressbar using the index of next_fs
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale current_fs down to 80%
                scale = 1 - (1 - now) * 0.2;
                //2. bring next_fs from the right(50%)
                left = (now * 50)+"%";
                //3. increase opacity of next_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({'transform': 'scale('+scale+')'});
                next_fs.css({'left': left, 'opacity': opacity});
            },
            duration: 800,
            complete: function(){
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
	}


});

$(".previous").click(function(){

    if($('#bar1').hasClass('active')&&$('#bar2').hasClass('active')&&!$('#bar3').hasClass('active')){
        $('#easytip-div-cont-name').css({
            'display': 'none'
        });
        $('#easytip-div-city').css({
            'display': 'none'
        });
        $('#easytip-div-cont-detail').css({
            'display': 'none'
        });
        $('#easytip-div-cont-pho').css({
            'display': 'none'
        })
    }

	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parents('fieldset');
	previous_fs = $(this).parents('fieldset').prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

// $(".submit").click(function(){
// 	return false;
// });

