<?php

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

if (ALLOW_AUTH)
{
	switch ($MODULE_DATA["output"]["mode"]) {
		case "viewlogs":
			?><h2>�������:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["today"])) {
			?>��� �������<? } else
			foreach ($MODULE_DATA["output"]["logs"]["today"] as $log) {
			?>* ������ "<?=$log["module"]?>", ������������ <?=$log["username"]?>, ��������: <?=$log["action"]?>, �������: <?=$log["entry_id"]?>, �����: <?=$log["time"]?><br /><?
			}
			
			?><br /><h2>�����:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["yesterday"])) {
			?>��� �������<? } else
			foreach ($MODULE_DATA["output"]["logs"]["yesterday"] as $log) {
			?>* ������ "<?=$log["module"]?>", ������������ <?=$log["username"]?>, ��������: <?=$log["action"]?>, �������: <?=$log["entry_id"]?>, �����: <?=$log["time"]?><br /><?
			}
			
			?><br /><h2>�����:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["earlier"])) {
			?>��� �������<? } else
			foreach ($MODULE_DATA["output"]["logs"]["earlier"] as $log) {
			?>* ������ "<?=$log["module"]?>", ������������ <?=$log["username"]?>, ��������: <?=$log["action"]?>, �������: <?=$log["entry_id"]?>, �����: <?=$log["time"]?><br /><?
			}
		break;
	}
}

?>