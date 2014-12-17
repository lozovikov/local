jQuery.noConflict();
jQuery(document).ready(function($) {
	function supports_input_placeholder() {
        var i = document.createElement('input');
        return 'placeholder' in i;
    }
    function trim(string) {
        return string.replace(/(^\s+)|(\s+$)/g, "");
    }

    if(!supports_input_placeholder()) {
        jQuery.each($("input"), function(i, val) {
            if(trim($(this).attr("value")) == "") {
                $(this).attr({"value": $(this).attr("title")});
            }
        });
        
        $("form input").click(function() {
            if($(this).attr("value") == $(this).attr("title"))
                $(this).attr({"value": ""});
        });
        $("form input").blur(function() {
            if(trim($(this).attr("value")) == "")
                $(this).attr({"value": $(this).attr("title")});
        });
    }
/*----------------------------------DateList----------------------------------*/
	/*$(".datalis").find("input").bind("click", function(e){
		if (!e.which && e.button) {
			if (e.button & 1) e.which = 1;
			else if (e.button & 4) e.which = 2;
			else if (e.button & 2) e.which = 3;
		}
		if(e.which == 1)
			$(this).parent().toggleClass("datalis_open");
		
	});
	$(".datalis li").bind("click", function(e){
		if (!e.which && e.button) {
			if (e.button & 1) e.which = 1;
			else if (e.button & 4) e.which = 2;
			else if (e.button & 2) e.which = 3;
		}
		if(e.which == 1)
			$(this).parents(".datalis_open").toggleClass("datalis_open").find("input").attr("value", $(this).text());
	});*/
/*----------------------------------------------------------------------------*/
	$(".bayan > li").each(function() {
		if($(this).has("ul").length ){
			$(this).css({"list-style": "none", "margin-left": "-15px"}).prepend("<a class='close' href='#'>+</a> ");
			$(this).children("ul").slideToggle(0);
		}
	});
	$(".bayan > li > a.open, .bayan > li > a.close").click(function() {
		$(this).parent().children("ul").slideToggle();
		if($(this).hasClass("close")) {
			$(this).removeClass("close").addClass("open").html("-");
		} else {
			$(this).removeClass("open").addClass("close").html("+");
		}
		return false;
	});
	
	$(".speciality select").change(function() {
		if($(this).attr("value") == "secondary") {
			$(this).parent().parent().find(".data_training").removeAttr("disabled");
		} else {
			$(this).parent().parent().find(".data_training").attr({"disabled": "on", "value": ""});
		}
	});
	
	
	/*$("a.modal_edit").click(function() {
		var $this = $(this);
		var param = $(this).attr("href").split("?");
		var uri = param[0];
		if(param[1] != null) {
			param = param[1].split("&");
			for(var i = 0; i < param.length; i++) {
				param[i] = param[i].split("=");
			}
		}
		if((param[0] != null && param[0][0] == "node" && param[0][1]) && (param[1] && param[1][0] == "action" && param[1][1] == "edit#form") && (param[2] && param[2][0] == "mode" && param[2][1] == "modal")) {
			$.ajax({  
				url: "/ajax/",             // указываем URL 
			    type: "POST",
			    cache: false,
			    data: "uri="+uri+"&node="+param[0][1]+"&action=" + param[1][1] + "&mode=" + param[2][1] + "&modul=texter&item_id="+param[3][1],
			    complete: function(data, textStatus){
			        if(textStatus != "error") {
//						ui.item.find("em.load").css("display", "none");
						//alert(data.responseText+"end");
						$.fancybox({
			content: data.responseText,
			padding : 17,
			margin : 40,
			opacity : false,
			modal : false,
			cyclic : false,
			scrolling : 'auto',	// 'auto', 'yes' or 'no'
	
			//width : 560,
			//height : 340,
			autoWidth: true,
	
			autoScale : true,
			autoDimensions : true,
			centerOnScroll : false,
	
			ajax : {},
			swf : { wmode: 'transparent' },
	
			hideOnOverlayClick : true,
			hideOnContentClick : false,
	
			overlayShow : true,
			overlayOpacity : 0.76,
			overlayColor : '#000',
	
			titleShow : true,
			titlePosition : 'inside', // 'float', 'outside', 'inside' or 'over'
			titleFormat : null,
			titleFromAlt : false,
	
			transitionIn : 'fade', // 'elastic', 'fade' or 'none'
			transitionOut : 'fade', // 'elastic', 'fade' or 'none'
	
			speedIn : 300,
			speedOut : 300,
	
			changeSpeed : 300,
			changeFade : 'fast',
	
			easingIn : 'swing',
			easingOut : 'swing',
	
			showCloseButton	 : false,
			showNavArrows : true,
			enableEscapeButton : true,
			enableKeyboardNav : true,
	
			onStart : function(){},
			onCancel : function(){},
			onComplete : function(){tinyMCE.init({
        mode : "specific_textareas",
		editor_selector : "wysiwyg",
        elements : "ajaxfilemanager",
        convert_urls: false,
        language: "ru",
        theme: "advanced",
        width: "100%",
        plugins : "fullscreen,table,advimage,advlink,media,contextmenu",
        theme_advanced_buttons1_add : "fontsizeselect",
        theme_advanced_buttons2_add : "media,forecolor,backcolor,liststyle",
        theme_advanced_buttons3_add : "tablecontrols,|emotions,fullscreen,images",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_path_location : "bottom",
        content_css : "/themes/styles/screen-tinymce.css",
        plugin_insertdate_dateFormat : "%d.%m.%Y",
        plugin_insertdate_timeFormat : "%H:%M:%S",
        extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
        external_link_list_url : "example_link_list.js",
        external_image_list_url : "example_image_list.js",
        flash_external_list_url : "example_flash_list.js",
        media_external_list_url : "example_media_list.js",
        template_external_list_url : "example_template_list.js",
        file_browser_callback : "ajaxfilemanager",
        paste_use_dialog : false,
        theme_advanced_resize_horizontal : true,
        theme_advanced_resizing : true,
        apply_source_formatting : true 
    });$.fancybox.center();
			
		
		$("#fancybox-outer .mceResize").mousedown(function() {
			$("#fancybox-outer .mcePlaceHolder").mouseup(function() {
				$.fancybox.center();
			});
		});
		$("#fancybox-outer").resize(function() {
			$.fancybox.center();
		});

},
			onCleanup : function(){},
			onClosed : function(){},
			onError : function(){}
		});
						
			        }
				}
			});
			
		} else {
			
		}
		return false;
	});*/
});