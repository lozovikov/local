<?php

if ($EE["footsteps"])
{
	$array = array();
	$array[] = SITE_SHORT_NAME;

	foreach ($EE["footsteps"] as $data)
	{
		if (!$data["is_hidden"])
		{
			$array[] = $data["title"];
		}

		else
		{
			break;
		}
	}

	echo implode(" | ", $array);
}

else
{
	echo SITE_NAME;
}

?>