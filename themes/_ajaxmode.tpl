<?php
	header("Content-type: text/plain; charset=windows-1251");
	header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");  
	header("Last-Modified: " . gmdate( "D, d M Y H:i:s") . " GMT"); 
	header("Cache-Control: no-cache, must-revalidate"); 
	header("Pragma: no-cache");
	$NODEGROUP = "content";
	

	if (($EE["modules_data"][$NODEGROUP])) {
		if(!isset($ajax_node_data["output"]["mode"]) || $ajax_node_data["output"]["data"] != "html_code") {
			if($ajax_node_data = current($EE["modules_data"][$NODEGROUP])) {
				//include $EE["theme"] . "ENews" . TEMPLATE_EXT;
				
				echo $ajax_node_data["output"]["data"];
        //echo json_encode($ajax_node_data["output"]["data"]);
				exit;
			}
		}	
		
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
	}
?>