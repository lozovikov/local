<?php

if (!isset($_GET["get"]))
	include_once("_mainnew.tpl");
else {
	$NODEGROUP = "content";
	if (($EE["modules_data"][$NODEGROUP]))
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
}

?>