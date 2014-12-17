<?php

$array = array(/*"player1", "player2", */"player3", "player4", /*"player5", "player6",*/ "player7");
$EE["head_extra"][] = "<link rel=\"stylesheet\" href=\"" . $EE["http_styles"] . "screen-add-" . $array[array_rand($array)] . ".css\" type=\"text/css\" />";

// Убрал из-за взлома 09.07.2012
// $EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery-1.5.js\"></script>";

// Убрал из-за взлома 09.07.2012
//$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery-ui-1.8.2.custom.min.js\"></script>";

//if($Engine->OperationAllowed(0, "folder.props.handle", -1, $Auth->usergroup_id)) {

// Убрал из-за взлома 09.07.2012
//	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery.ui.sortable.js\"></script>";
	
// Убрал из-за взлома 09.07.2012	
//	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "folders_sort.js\"></script>";
//}

// Убрал из-за взлома 09.07.2012
//	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery.fancybox-1.3.4.js\"></script>";

if ($EE["head_extra"])
{
	echo "\t" . implode("\n\t", $EE["head_extra"]) . "\n";
}


switch ($EE["language"])
{
	case "en":
		$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "highslide_/highslide.js\"></script>
	<script type=\"text/javascript\">
		hs.graphicsDir = '" . HTTP_COMMON_SCRIPTS . "highslide_/graphics/';
		hs.showCredits = false;
		hs.fullExpandTitle = 'Full size';
		hs.restoreTitle = 'Use mouse click to close image, and arrow keys to go to the next or previous image';
		hs.loadingText = 'Loading&hellip;';
		hs.loadingTitle = 'Mouse click to cancel';
		hs.allowMultipleInstances = false;
	</script>";
		break;

	default:
		$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "highslide_/highslide.js\"></script>
	<script type=\"text/javascript\">
		hs.graphicsDir = '" . HTTP_COMMON_SCRIPTS . "highslide_/graphics/';
		hs.showCredits = false;
		hs.fullExpandTitle = 'Полный размер';
		hs.restoreTitle = 'Щелчок мышью закрывает изображение, клавиши-стрелки используются для перехода к предыдущему и следующему изображению';
		hs.loadingText = 'Загрузка&hellip;';
		hs.loadingTitle = 'Щёлкните мышью для отмены';
		hs.allowMultipleInstances = false;
	</script>";
		break;
}

if ($Auth->logged_in)
{
	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "tinymce/tiny_mce.js\"></script>";

	$EE["head_extra2"][] = '<script type="text/javascript">
	
	
	
			
			tinyMCE.init({
				// General options
				mode : "textareas",
		editor_selector : "wysiwyg",
				theme : "advanced",
        elements : "ajaxfilemanager",
        convert_urls: false,
				language: "ru",
        width: "100%",
				plugins : "fullscreen,table,advimage,advlink,media,contextmenu,paste,template,inlinepopups",
	
				// Theme options
				theme_advanced_buttons2_add : "media,liststyle,fullscreen, pasteword",
				theme_advanced_buttons3_add : "tablecontrols,|emotions,images,|,template",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				theme_advanced_statusbar_location : "bottom",
				theme_advanced_resizing : true,
	
				// Skin options
				skin : "o2k7",
				skin_variant : "silver",
	
				// Example content CSS (should be your site CSS)
				//content_css : "css/example.css",
        content_css: "' . $EE["http_styles"] . 'screen-tinymce.css?1",
	
				// Drop lists for link/image/media/template dialogs
        plugin_insertdate_dateFormat : "%d.%m.%Y",
        plugin_insertdate_timeFormat : "%H:%M:%S",
		extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
				template_external_list_url : "js/template_list.js",
				external_link_list_url : "js/link_list.js",
				external_image_list_url : "js/image_list.js",
				flash_external_list_url : "js/flash_list.js",
				media_external_list_url : "js/media_list.js",
        file_browser_callback : "ajaxfilemanager",
		//paste_use_dialog : false,
		
        theme_advanced_resize_horizontal : true,
        apply_source_formatting : true,
				// Replace values for the template plugin
				/*template_replace_values : {
					username : "Some User",
					staffid : "991234"
				},*/
				style_formats : [
					{title: "Большой заголовок", block: "p", classes: "font_big_head" },
					{title: "Мелкий текст", inline: "span", classes: "font_mini", split: false},
					{title: "Бордовый разделитель", selector: "hr", classes: "sub_hr"},
					{title: "ФИО", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a,hr", classes: "name-color"},
					{title: "Картинка слева", selector: "p,img,hr", classes: "float-right"},
					{title: "Картинка справа", selector: "p,img,hr", classes: "float-left"},
					{title: "Серый блок", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a", classes: "gray-radius-block"},
					
				]
			});
	
			function ajaxfilemanager(field_name, url, type, win) {
				var ajaxfilemanagerurl = "'.HTTP_COMMON_SCRIPTS.'tinymce/plugins/ajaxfilemanager/ajaxfilemanager.php'.$Auth->getAFMRequestData().'";
				switch (type) {
					case "image":
						break;
					case "media":
						break;
					case "flash": 
						break;
					case "file":
						break;
					default:
						return false;
				}
				tinyMCE.activeEditor.windowManager.open({
					url: ajaxfilemanagerurl,
					width: 782,
					height: 440,
					inline : "yes",
					close_previous : "no"
				},{
					window : win,
					input : field_name
				});
			}
		
	
		
			
			
</script>';
	
/*
 * 		tinyMCE.init({
		mode : "textareas",
		editor_selector : "wysiwyg",
		convert_urls : false,
		language : "ru",
		docs_language : "en",
		theme : "advanced",
		convert_urls : false,
		convert_fonts_to_spans : true,
		apply_source_formatting : true,
		height: 500,
		plugins : "style,layer,table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
		theme_advanced_buttons1_add_before : "save,newdocument,separator",
		theme_advanced_buttons1_add : "fontsizeselect",
		theme_advanced_buttons2_add: "cut,copy,paste,pastetext,pasteword,separator,search,replace,separator",
		theme_advanced_buttons3_add_before : "tablecontrols,separator",
		theme_advanced_buttons3_add : "emotions,iespell,media,advhr,separator,print,separator,ltr,rtl,separator,fullscreen",
		theme_advanced_buttons3_add : "fullscreen",
		theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,|,code",
		theme_advanced_buttons4_add : "separator,insertdate,inserttime,preview,separator,forecolor,backcolor",
		theme_advanced_toolbar_location : "top",
		theme_advanced_toolbar_align : "left",
		theme_advanced_path_location : "bottom",
		content_css : "' . $EE["http_styles"] . 'screen-tinymce.css",
		plugin_insertdate_dateFormat : "%d.%m.%Y",
		plugin_insertdate_timeFormat : "%H:%M:%S",
		extended_valid_elements : "hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
		external_link_list_url : "example_link_list.js",
		external_image_list_url : "example_image_list.js",
		flash_external_list_url : "example_flash_list.js",
		media_external_list_url : "example_media_list.js",
		template_external_list_url : "example_template_list.js",
		file_browser_callback : "fileBrowserCallBack",
		theme_advanced_resize_horizontal : true,
		theme_advanced_resizing : true,
		nonbreaking_force_tab : true
	});

	
 */
	$EE["head_extra2"][] = "<script type=\"text/javascript\">document.write('<style type=\"text/css\">.wysiwyg { position: absolute } #extra-column .wysiwyg { right: 0 } </style>')</script>";
}

elseif (0)
{
//	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "tiny_mce/tiny_mce_gzip.js\"></script>";
//	$EE["head_extra2"][] = "<script type=\"text/javascript\">";
//	$EE["head_extra2"][] = "tinyMCE_GZ.init({";
//	$EE["head_extra2"][] = "	plugins : 'table,nonbreaking,fullscreen',";
//	$EE["head_extra2"][] = "	themes : 'advanced',";
//	$EE["head_extra2"][] = "	languages : 'ru',";
//	$EE["head_extra2"][] = "	disk_cache : true,";
//	$EE["head_extra2"][] = "	debug : false";
//	$EE["head_extra2"][] = "});";
//	$EE["head_extra2"][] = "</script>";

	$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "tiny_mce/tiny_mce.js\"></script>";
	$EE["head_extra2"][] = "<script type=\"text/javascript\">
	tinyMCE.init({
		mode : 'textareas',
		editor_selector : 'wysiwyg',
		plugins : 'table,nonbreaking,fullscreen',
		nonbreaking_force_tab : true,
		doctype : '<!' + 'DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">',
		inline_styles : true,
		language : 'ru',
		docs_language : 'en',
		convert_urls : false,
		convert_fonts_to_spans : true,
		cleanup : false,
		content_css : '" . $EE["http_styles"] . "screen-tinymce.css',
		theme : 'advanced',
		theme_advanced_toolbar_location : 'top',
		theme_advanced_toolbar_align : 'left',
		theme_advanced_statusbar_location : 'bottom',
		theme_advanced_resizing : false,
		theme_advanced_buttons1 : 'undo,redo,separator,removeformat,cleanup,visualaid,separator,code,help,fullscreen',
		theme_advanced_buttons2 : 'formatselect,styleselect',
		theme_advanced_buttons3 : 'bold,italic,underline,strikethrough,sub,sup,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,forecolor,backcolor',
		theme_advanced_buttons4 : 'bullist,numlist,separator,outdent,indent,separator,link,unlink,image,hr,anchor,charmap,separator,nonbreaking',
		theme_advanced_buttons5 : 'tablecontrols',
		width: '100%',
		height: '400',
		valid_elements : \"\"
		+\"a[accesskey|charset|class|coords|dir<ltr?rtl|href|hreflang|id|lang|name\"
			+\"|onblur|onclick|ondblclick|onfocus|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|rel|rev\"
			+\"|shape<circle?default?poly?rect|style|tabindex|title|target|type],\"
		+\"abbr[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"acronym[class|dir<ltr?rtl|id|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"address[class|align|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"applet[align<bottom?left?middle?right?top|alt|archive|class|code|codebase\"
			+\"|height|hspace|id|name|object|style|title|vspace|width],\"
		+\"area[accesskey|alt|class|coords|dir<ltr?rtl|href|id|lang|nohref<nohref\"
			+\"|onblur|onclick|ondblclick|onfocus|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup\"
			+\"|shape<circle?default?poly?rect|style|tabindex|title|target],\"
		+\"base[href|target],\"
		+\"basefont[color|face|id|size],\"
		+\"bdo[class|dir<ltr?rtl|id|lang|style|title],\"
		+\"big[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"blockquote[cite|class|dir<ltr?rtl|id|lang|onclick|ondblclick\"
			+\"|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout\"
			+\"|onmouseover|onmouseup|style|title],\"
		+\"body[alink|background|bgcolor|class|dir<ltr?rtl|id|lang|link|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onload|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|onunload|style|title|text|vlink],\"
		+\"br[class|clear<all?left?none?right|id|style|title],\"
		+\"button[accesskey|class|dir<ltr?rtl|disabled<disabled|id|lang|name|onblur\"
			+\"|onclick|ondblclick|onfocus|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|style|tabindex|title|type\"
			+\"|value],\"
		+\"caption[align<bottom?left?right?top|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"center[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"cite[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"code[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"col[align<center?char?justify?left?right|char|charoff|class|dir<ltr?rtl|id\"
			+\"|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|span|style|title\"
			+\"|valign<baseline?bottom?middle?top|width],\"
		+\"colgroup[align<center?char?justify?left?right|char|charoff|class|dir<ltr?rtl\"
			+\"|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|span|style|title\"
			+\"|valign<baseline?bottom?middle?top|width],\"
		+\"dd[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"del[cite|class|datetime|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"dfn[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"dir[class|compact<compact|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"div[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"dl[class|compact<compact|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"dt[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"em/i[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"fieldset[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"font[class|color|dir<ltr?rtl|face|id|lang|size|style|title],\"
		+\"form[accept|accept-charset|action|class|dir<ltr?rtl|enctype|id|lang\"
			+\"|method<get?post|name|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|onreset|onsubmit\"
			+\"|style|title|target],\"
		+\"frame[class|frameborder|id|longdesc|marginheight|marginwidth|name\"
			+\"|noresize<noresize|scrolling<auto?no?yes|src|style|title],\"
		+\"frameset[class|cols|id|onload|onunload|rows|style|title],\"
		+\"h1[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"h2[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"h3[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"h4[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"h5[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"h6[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"head[dir<ltr?rtl|lang|profile],\"
		+\"hr[align<center?left?right|class|dir<ltr?rtl|id|lang|noshade<noshade|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|size|style|title|width],\"
		+\"html[dir<ltr?rtl|lang|version],\"
		+\"iframe[align<bottom?left?middle?right?top|class|frameborder|height|id\"
			+\"|longdesc|marginheight|marginwidth|name|scrolling<auto?no?yes|src|style\"
			+\"|title|width],\"
		+\"img[align<bottom?left?middle?right?top|alt|border|class|dir<ltr?rtl|height\"
			+\"|hspace|id|ismap<ismap|lang|longdesc|name|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|src|style|title|usemap|vspace|width],\"
		+\"input[accept|accesskey|align<bottom?left?middle?right?top|alt\"
			+\"|checked<checked|class|dir<ltr?rtl|disabled<disabled|id|ismap<ismap|lang\"
			+\"|maxlength|name|onblur|onclick|ondblclick|onfocus|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|onselect\"
			+\"|readonly<readonly|size|src|style|tabindex|title\"
			+\"|type<button?checkbox?file?hidden?image?password?radio?reset?submit?text\"
			+\"|usemap|value],\"
		+\"ins[cite|class|datetime|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"isindex[class|dir<ltr?rtl|id|lang|prompt|style|title],\"
		+\"kbd[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"label[accesskey|class|dir<ltr?rtl|for|id|lang|onblur|onclick|ondblclick\"
			+\"|onfocus|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout\"
			+\"|onmouseover|onmouseup|style|title],\"
		+\"legend[align<bottom?left?right?top|accesskey|class|dir<ltr?rtl|id|lang\"
			+\"|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"li[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title|type\"
			+\"|value],\"
		+\"link[charset|class|dir<ltr?rtl|href|hreflang|id|lang|media|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|rel|rev|style|title|target|type],\"
		+\"map[class|dir<ltr?rtl|id|lang|name|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"menu[class|compact<compact|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"meta[content|dir<ltr?rtl|http-equiv|lang|name|scheme],\"
		+\"noframes[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"noscript[class|dir<ltr?rtl|id|lang|style|title],\"
		+\"object[align<bottom?left?middle?right?top|archive|border|class|classid\"
			+\"|codebase|codetype|data|declare|dir<ltr?rtl|height|hspace|id|lang|name\"
			+\"|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|standby|style|tabindex|title|type|usemap\"
			+\"|vspace|width],\"
		+\"ol[class|compact<compact|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|start|style|title|type],\"
		+\"optgroup[class|dir<ltr?rtl|disabled<disabled|id|label|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"option[class|dir<ltr?rtl|disabled<disabled|id|label|lang|onclick|ondblclick\"
			+\"|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout\"
			+\"|onmouseover|onmouseup|selected<selected|style|title|value],\"
		+\"p[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"param[id|name|type|value|valuetype<DATA?OBJECT?REF],\"
		+\"pre/listing/plaintext/xmp[align|class|dir<ltr?rtl|id|lang|onclick|ondblclick\"
			+\"|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout\"
			+\"|onmouseover|onmouseup|style|title|width],\"
		+\"q[cite|class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"s[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"samp[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"script[charset|defer|language|src|type],\"
		+\"select[class|dir<ltr?rtl|disabled<disabled|id|lang|multiple<multiple|name\"
			+\"|onblur|onchange|onclick|ondblclick|onfocus|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|size|style\"
			+\"|tabindex|title],\"
		+\"small[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"span[align<center?justify?left?right|class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"strike[class|class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title],\"
		+\"strong/b[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"style[dir<ltr?rtl|lang|media|title|type],\"
		+\"sub[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"sup[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title],\"
		+\"table[align<center?left?right|bgcolor|border|cellpadding|cellspacing|class\"
			+\"|dir<ltr?rtl|frame|height|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|rules\"
			+\"|style|summary|title|width],\"
		+\"tbody[align<center?char?justify?left?right|char|class|charoff|dir<ltr?rtl|id\"
			+\"|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|style|title\"
			+\"|valign<baseline?bottom?middle?top],\"
		+\"td[abbr|align<center?char?justify?left?right|axis|bgcolor|char|charoff|class\"
			+\"|colspan|dir<ltr?rtl|headers|height|id|lang|nowrap<nowrap|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|rowspan|scope<col?colgroup?row?rowgroup\"
			+\"|style|title|valign<baseline?bottom?middle?top|width],\"
		+\"textarea[accesskey|class|cols|dir<ltr?rtl|disabled<disabled|id|lang|name\"
			+\"|onblur|onclick|ondblclick|onfocus|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|onselect\"
			+\"|readonly<readonly|rows|style|tabindex|title],\"
		+\"tfoot[align<center?char?justify?left?right|char|charoff|class|dir<ltr?rtl|id\"
			+\"|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|style|title\"
			+\"|valign<baseline?bottom?middle?top],\"
		+\"th[abbr|align<center?char?justify?left?right|axis|bgcolor|char|charoff|class\"
			+\"|colspan|dir<ltr?rtl|headers|height|id|lang|nowrap<nowrap|onclick\"
			+\"|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove\"
			+\"|onmouseout|onmouseover|onmouseup|rowspan|scope<col?colgroup?row?rowgroup\"
			+\"|style|title|valign<baseline?bottom?middle?top|width],\"
		+\"thead[align<center?char?justify?left?right|char|charoff|class|dir<ltr?rtl|id\"
			+\"|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown\"
			+\"|onmousemove|onmouseout|onmouseover|onmouseup|style|title\"
			+\"|valign<baseline?bottom?middle?top],\"
		+\"title[dir<ltr?rtl|lang],\"
		+\"tr[abbr|align<center?char?justify?left?right|bgcolor|char|charoff|class\"
			+\"|rowspan|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title|valign<baseline?bottom?middle?top],\"
		+\"tt[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"u[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup\"
			+\"|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title],\"
		+\"ul[class|compact<compact|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown\"
			+\"|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover\"
			+\"|onmouseup|style|title|type],\"
		+\"var[class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress\"
			+\"|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style\"
			+\"|title]\"
		});
	</script>";
}

if ($EE["head_extra2"])
{
	echo "\n\t" . implode("\n\t", $EE["head_extra2"]) . "\n";
}

?>