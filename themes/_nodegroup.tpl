<?php

foreach ($EE["modules_data"][$NODEGROUP] as $NODE_ID => $MODULE_DATA)
{
	$MODULE_NAME = $MODULE_DATA["name"];
	$MODULE_OUTPUT = $MODULE_DATA["output"];
	include $EE["theme"] . $MODULE_NAME . TEMPLATE_EXT;
}

?>