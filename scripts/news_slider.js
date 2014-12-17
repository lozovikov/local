

jQuery.noConflict();
jQuery(document).ready(function($) {
	$("#announse_list").addClass("announse_slider");
	$("#announse_list .last_li").remove();
	var container = $("#announse_list .slider_block");
	var ul = $("#announse_list ul");
	var left_arrow = $("#announse_list .left_arrow");
	var right_arrow = $("#announse_list .right_arrow");
	var step = ul.find("li").outerWidth();
	var ul_width = ul.find("li:visible").length * step;
	var speed = 1000;
	var type = "swing";
	var animate = false;
	
	left_arrow.click(function() {
		var container_width = container.outerWidth();
		var ul_margin_left = parseInt(ul.css("margin-left"));
		if(ul_margin_left < 0 && !animate) {
			animate = true;
			var st = (step + ul_margin_left > 0) ? (-1)*ul_margin_left : step;
			ul.animate({'margin-left': (ul_margin_left + st)+'px'}, speed, type, function() {
                animate = false;
            });
		}
		return false;
	});
	right_arrow.click(function() {
		var container_width = container.outerWidth();
		var ul_margin_left = parseInt(ul.css("margin-left"));
		if((ul_margin_left + ul_width) > container_width && !animate) {
			animate = true;
			var st = ((ul_width + ul_margin_left) - container_width < step) ? ((ul_width + ul_margin_left) - container_width) : step;
			ul.animate({'margin-left': (ul_margin_left - st)+'px'}, speed, type, function() {
                animate = false;
            });
		}
		return false;
	});
	$(window).resize(function(){
		var container_width = container.outerWidth();
		var ul_margin_left = parseInt(ul.css("margin-left"));
		if(ul_width > container_width) {
			animate = false;
			if(ul_width + ul_margin_left < container_width) {
				ul.css("margin-left", (ul_width - container_width)+"px");
			}
		} else {
			animate = true;
		}
	});
});