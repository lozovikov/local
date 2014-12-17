<link rel="stylesheet" href="<?=$EE["http_styles"]?>jquery.fancybox-1.3.5.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>no-ie6.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>jquery-ui-1.8.2.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>colorbox.css?1" type="text/css" media="screen" />

<link rel="apple-touch-icon" href="<?=$EE["http_theme"]?>images/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="76x76" href="<?=$EE["http_theme"]?>images/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="<?=$EE["http_theme"]?>images/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="<?=$EE["http_theme"]?>images/touch-icon-ipad-retina.png">

<?php
global $Engine;

if (isset($EE["folderoptions"]["variant"])) {
	$EE["head_extra"][] = "<link rel=\"stylesheet\" href=\"" . $EE["http_styles"] . "screen-variant-" . $EE["folderoptions"]["variant"] . ".css\" type=\"text/css\" />";
}

if ($EE["head_extra"]) {
	echo "\t" . implode("\n\t", $EE["head_extra"]) . "\n";
}

$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery-1.7.2.min.js\"></script>";
$EE["head_extra2"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery-ui-1.8.16.custom.min.js\"></script>";

if($Engine->OperationAllowed(0, "folder.props.handle", -1, $Auth->usergroup_id)) {
	//$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery.ui.sortable.js\"></script>";
	//$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "folders_sort.js\"></script>";
}
//$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "jquery/jquery.fancybox-1.3.4.js\"></script>";
$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "no-ie6.js\"></script>";
$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "passgen.js\"></script>";
//$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"http://userapi.com/js/api/openapi.js?43\"></script>";
//$EE["head_extra4"][] = "<script type=\"text/javascript\" >VK.init({apiId: 2683971, onlyWidgets: true});</script>";


$EE["head_extra2"][] = "	<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "highslide/highslide-with-gallery.js\"></script>
<script type=\"text/javascript\">
hs.graphicsDir = '/scripts/highslide/graphics/';
hs.transitions = ['expand', 'crossfade'];
hs.outlineType = 'rounded-white';
hs.fadeInOut = true;
hs.showCredits = false;
hs.fullExpandTitle = '������ ������';
hs.restoreTitle = '������ ����� ��������� �����������, �������-������� ������������ ��� �������� � ����������� � ���������� �����������';
hs.loadingText = '��������&hellip;';
hs.loadingTitle = 'ٸ������ ����� ��� ������';
hs.allowMultipleInstances = false;

</script>";

if (!$Engine->folder_id) {
	$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "renews.js\"></script>";
}


if ($Auth->logged_in) {
    $EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "tiny_mce/tiny_mce.js\"></script>";
    
    $EE["head_extra4"][] = '
		<script type="text/javascript">	
					
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
	
				// Theme options2
				theme_advanced_buttons2_add : "media,liststyle,fullscreen, pasteword",
				theme_advanced_buttons3_add : "tablecontrols,|emotions,images,|,template",
				theme_advanced_toolbar_location : "top",
				theme_advanced_toolbar_align : "left",
				theme_advanced_statusbar_location : "bottom",
				theme_advanced_resizing : true,
	 theme_advanced_resize_horizontal : true,
        apply_source_formatting : true,
		paste_strip_class_attributes : "all",
        paste_remove_styles : true,
			paste_auto_cleanup_on_paste : true,
			paste_remove_spans:true,
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
				external_image_list_url : "",
				flash_external_list_url : "js/flash_list.js",
				media_external_list_url : "js/media_list.js",
        file_browser_callback :  function ajaxfilemanager(field_name, url, type, win) {
				var ajaxfilemanagerurl = "'.HTTP_COMMON_SCRIPTS.'tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php'.$Auth->getAFMRequestData().'";
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
			},
		//paste_use_dialog : false,
		
        
				style_formats : [
					{title: "������� ���������", block: "p", classes: "font_big_head" },
					{title: "������ �����", inline: "span", classes: "font_mini", split: false},
					{title: "�������� �����������", selector: "hr", classes: "sub_hr"},
					{title: "���", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a,hr", classes: "name-color"},
					{title: "�������� �����", selector: "p,img,hr", classes: "float-right"},
					{title: "�������� ������", selector: "p,img,hr", classes: "float-left"},
					{title: "����� ����", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a", classes: "gray-radius-block"},
					{title: "���������� ������ (������� ����)", selector: "table.nsau_table tr", classes: "tr_highlight_honey"},
					{title: "���������� ������ (���������� ����)", selector: "table.nsau_table tr", classes: "tr_highlight_berry"},
					{title: "���������� ������", selector: "table.nsau_table td", classes: "td_highlight"},
					{title: "������������� ������� ����", selector: "table", classes: "nsau_table"},
				],
				template_templates: [
					{title: "�������� �������", src: "/themes/template/person_card.html", description: "�������� � ������������� �������� �� ����� �������"},
					{title: "�������", src: "/themes/template/nova.html", description: "��������� ������� ������ �������"}
					
				]
			});
	
			function ajaxfilemanager(field_name, url, type, win) {
				var ajaxfilemanagerurl = "'.HTTP_COMMON_SCRIPTS.'tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php'.$Auth->getAFMRequestData().'";
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
}

$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "app.js\"></script>";

if ($EE["head_extra2"]) {
	echo "\n\t" . implode("\n\t", $EE["head_extra2"]) . "\n";
}

if (isset($EE["head_extra3"])) {
    echo "\t" . implode("\n\t", $EE["head_extra3"]) . "\n";
}

if ($EE["head_extra4"]) {
	echo "\n\t" . implode("\n\t", $EE["head_extra4"]) . "\n";
}

if ($EE["head_extra5"]) {
	echo "\n\t" . implode("\n\t", $EE["head_extra5"]) . "\n";
}

if (!AT_HOME) {	
	if (!defined('_SAPE_USER'))
		define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
	require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
	$o['multi_site'] = true;
	$sape = new SAPE_client($o);
}

?>
<script type="text/javascript">
jQuery(document).ready(function() {

// ������ ������ ����� (Test-Templates)
// ������ 1.0

jQuery('body').append('<div class="button-up" style="display: none;opacity: 0.7;width: 80px;position: fixed;z-index:1000;right: 0px;bottom: 0px;cursor: pointer;text-align: center;line-height: 30px;color: #9c0605;font-weight: bold;"><img src="/themes/images/go_up.png">������</div><div class="button-bottom" style="display: none;opacity: 0.7;width: 80px;position: fixed;z-index:1000;right: 0px;bottom: 0px;cursor: pointer;text-align: center;line-height: 30px;color: #9c0605;font-weight: bold;"><img src="/themes/images/go_bottom.png"><br/>����</div>');

jQuery(window).scroll(function () {
if (jQuery(this).scrollTop () > 250) {
jQuery('.button-up').fadeIn();
jQuery('.button-bottom').fadeOut();
} else if (jQuery(this).scrollTop () < 250) {
jQuery('.button-bottom').fadeIn();
jQuery('.button-up').fadeOut();
} 
});

jQuery('.button-up').click(function(){
jQuery('body,html').animate({
scrollTop: 0
}, 800);
return false;
});
jQuery('.button-bottom').click(function(){
jQuery('body,html').animate({scrollTop:jQuery(document).height()}, 800);
return false;
});

jQuery('.button-up,.button-bottom').hover(function() {
jQuery(this).animate({
'opacity':'1',
}).css({'color':'#9c0605'});
}, function(){
jQuery(this).animate({
'opacity':'0.7'
}).css({'color':'#9c0605'});;
});


});
</script>