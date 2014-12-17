<?php
	header("Content-type: text/plain; charset=windows-1251");
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");  
	header("Last-Modified: " . gmdate( "D, d M Y H:i:s") . " GMT"); 
	header("Cache-Control: no-cache, must-revalidate"); 
	header("Pragma: no-cache");
	$NODEGROUP = "content";
	if (($EE["modules_data"][$NODEGROUP]))
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
?>