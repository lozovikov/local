<link rel="stylesheet" href="<?=$EE["http_styles"]?>jquery.fancybox-1.3.5.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>no-ie6.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>jquery-ui-1.8.2.custom.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<?=$EE["http_styles"]?>colorbox.css?1" type="text/css" media="screen" />

<?php
global $Engine;

if (isset($EE["folderoptions"]["variant"])) {
	$EE["head_extra"][] = "<link rel=\"stylesheet\" href=\"" . $EE["http_styles"] . "screen-variant-" . $EE["folderoptions"]["variant"] . ".css\" type=\"text/css\" />";
}

if ($EE["head_extra"]) {
	echo "\t" . implode("\n\t", $EE["head_extra"]) . "\n";
}
/*echo "<pre>";
		print_r($EE);
		echo "</pre>";*/
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
hs.fullExpandTitle = 'Полный размер';
hs.restoreTitle = 'Щелчок мышью закрывает изображение';
hs.loadingText = 'Загрузка&hellip;';
hs.loadingTitle = 'Щёлкните мышью для отмены';
hs.allowMultipleInstances = false;

</script>";

if (!$Engine->folder_id) {
	$EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "renews.js\"></script>";
}


if ($Auth->logged_in) {
   
      $EE["head_extra4"][] = "<script type=\"text/javascript\" src=\"" . HTTP_COMMON_SCRIPTS . "tinymce/tinymce.min.js\"></script>";
    $EE["head_extra4"][] = '
	
		<script type="text/javascript">	
	tinymce.init({
	
    selector: ".wysiwyg",
	
    theme: "modern",
	language: "ru",
	elements : "ajaxfilemanager",
    width: "100%",
	
	
    plugins: [
         "advlist autolink link image lists charmap print hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media",
         "save table contextmenu directionality emoticons template paste textcolor "
   ],
	content_css: "' . $EE["http_styles"] . 'screen-tinymce.css?1",
	  
	  
	  resize: "both",

		toolbar: " bold italic underline  | alignleft aligncenter alignright alignjustify | styleselect formatselect | bullist numlist | outdent indent | undo redo | link unlink anchor image media code | inserttime | table | hr removeformat | subscript superscript | charmap | fullscreen | template ",
     
 menubar: false,
        toolbar_items_size: "small",
		image_advtab: true ,
	
	paste_retain_style_properties: "font-weight border padding border-spacing text-decoration font-style",
	paste_webkit_styles: "font-weight border padding border-spacing text-decoration font-style",
//paste_word_valid_elements: "table",
      file_browser_callback : function ajaxfilemanager(field_name, url, type, win) {
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
  title : "Загрузить изображение",
  width: 782,
  height: 440,
  inline : "yes",
  close_previous : "no"
  },{
  window : win,
  input : field_name
 });
},
	  external_plugins: {
        "ajaxfilemanager": "'.HTTP_COMMON_SCRIPTS.'tinymce/plugins/ajaxfilemanager/ajaxfilemanager.php"
    },
			
	
  	style_formats : [
					{title: "Большой заголовок", block: "p", classes: "font_big_head" },
					{title: "Мелкий текст", inline: "span", classes: "font_mini", split: false},
					{title: "Бордовый разделитель", selector: "hr", classes: "sub_hr"},
					{title: "ФИО", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a,hr", classes: "name-color"},
					{title: "Картинка слева", selector: "p,img,hr", classes: "float-right"},
					{title: "Картинка справа", selector: "p,img,hr", classes: "float-left"},
					{title: "Серый блок", selector: "p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,span,strong,img,table,a", classes: "gray-radius-block"},
					{title: "Выделенная строка (Медовый цвет)", selector: "table.nsau_table tr", classes: "tr_highlight_honey"},
					{title: "Выделенная строка (Брусничный цвет)", selector: "table.nsau_table tr", classes: "tr_highlight_berry"},
					{title: "Выделенная ячейка", selector: "table.nsau_table td", classes: "td_highlight"},
					{title: "Стилизованная таблица НГАУ", selector: "table", classes: "nsau_table"},
				],
				templates: [
					{title: "Карточка персоны", url: "/themes/template/person_card.html", description: "Карточка с выравниванием картинки по левой стороне"},
					{title: "Новинка", url: "/themes/template/nova.html", description: "Выделение красным цветом новинки"}
					
				],
 });

		
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
	//$o['force_show_code'] = true;
	$sape = new SAPE_client($o);
}

?>