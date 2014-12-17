<?php
global $Engine, $Auth, $EE;
$http_styles = $EE["http_styles"];
$http_scripts = HTTP_COMMON_SCRIPTS;
if(isset($EE['plugin'])) {
	switch($EE['plugin']) {
		case 'jquery.colorbox': {
			$EE["head_extra3"][] = <<<END
		<link rel="stylesheet" href="{$http_styles}colorbox.css" type="text/css" media="screen" />
		<script type="text/javascript" src="{$http_scripts}jquery/jquery.colorbox.js"></script>
END;
		}
		break;
	
		case 'jquery.Jcrop': {
			$EE["head_extra3"][] = <<<END
		<link rel='stylesheet' href='{$http_styles}jquery.Jcrop.css' type='text/css' media="screen" />
		<script type="text/javascript" src='{$http_scripts}jquery/jquery.Jcrop.min.js'></script>
END;
		}
		break;
	
		case 'jquery.ui.datepicker.min': {
			$EE["head_extra3"][] = <<<END
		<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.datepicker.js"></script>
END;
		}
		break;
	
		case 'jquery-ui-timepicker-addon': {
			$EE["head_extra3"][] = <<<END
		<script type="text/javascript" src="{$http_scripts}jquery/jquery-ui-timepicker-addon.js"></script>
END;
		}
		break;
	
		case 'jquery.fancybox-1.3.4': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.fancybox-1.3.4.js"></script>
END;
		}
		break;
	
		case 'jquery.form': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.form.js"></script>
END;
		}
		break;
	
		case 'highslide': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}highslide/highslide.js"></script>
END;
		}
		break;
	
		case 'jquery.editable-select': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery.editable-select.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.dialog': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.dialog.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.draggable': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.draggable.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.core.min': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.core.min.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.position.min': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.position.min.js"></script>
END;
		}
		break;
    
    case 'jquery.ui.autocomplete.min': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.autocomplete.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.widget.min': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.widget.min.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.mouse': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.mouse.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.button': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.ui.button.js"></script>
END;
		}
		break;
	
		case 'jquery.effects.core': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.effects.core.js"></script>
END;
		}
		break;
	
		case 'jquery.ui.resizable': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}jquery/jquery.effects.core.js"></script>
END;
		}
		break;
	
		case 'openapi': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="http://userapi.com/js/api/openapi.js?43"></script>
			<script type="text/javascript" >VK.init({apiId: 2683971, onlyWidgets: true});</script>
END;
		}
		break;
	
		/*case 'calendar': {
			$EE["head_extra3"][] = <<<END
			<script type="text/javascript" src="{$http_scripts}calendar.js"></script>
END;
		}
		break;*/
	
		case '': {
			$EE["head_extra3"][] = <<<END
END;
		}
		break;
	}
}
?>