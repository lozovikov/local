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
			?><h2>Сегодня:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["today"])) {
			?>Нет записей<? } else
			foreach ($MODULE_DATA["output"]["logs"]["today"] as $log) {
			?>* Модуль "<?=$log["module"]?>", пользователь <?=$log["username"]?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /><?
			}
			
			?><br /><h2>Вчера:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["yesterday"])) {
			?>Нет записей<? } else
			foreach ($MODULE_DATA["output"]["logs"]["yesterday"] as $log) {
			?>* Модуль "<?=$log["module"]?>", пользователь <?=$log["username"]?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /><?
			}
			
			?><br /><h2>Ранее:</h2><?
			if (!isset($MODULE_DATA["output"]["logs"]["earlier"])) {
			?>Нет записей<? } else
			foreach ($MODULE_DATA["output"]["logs"]["earlier"] as $log) {
			?>* Модуль "<?=$log["module"]?>", пользователь <?=$log["username"]?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /><?
			}
		break;
	}
}

?>