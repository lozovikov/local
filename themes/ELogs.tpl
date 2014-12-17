<?php
//CF::debug($MODULE_DATA["output"]);

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
				?>
			<br />
			<form id="post_form" method="post" action="">
			<b><? if(!$MODULE_DATA["output"]["show_earlier"]) { ?><div class="href"  onclick="document.getElementById('earlier_field').value='1'; document.getElementById('post_form').submit()"><u>Показывать записи за последний месяц</u></div><? } else { ?><div class="href" onclick="document.getElementById('earlier_field').value='0'; document.getElementById('post_form').submit()"  ><u>Показывать записи со вчерашнего дня</u></div><? } ?></b>
			<br /><br />
			<input type="hidden" id="earlier_field" name="earlier" value="<?=$MODULE_DATA["output"]["show_earlier"]?>" />
			<input type="hidden" id="page_field" name="page" value="1" />
			<fieldset style="width:250px;">
			<legend>Выводить записи для модулей:</legend>
			<div id="filters_cont">
			<?
			foreach ($MODULE_DATA["output"]["modules"] as $key => $module) {
				?><input onchange="document.getElementById('post_form').submit()" type="checkbox" name="checkmod[<?=$key?>]" <? if ($module['checked']) { ?> checked="checked" <? } ?> ><?=$module['comment']?><br /><?
			}
			
			?>
			</div>
			<br /><a style="cursor: pointer;" onclick="var mass = document.getElementById('filters_cont').getElementsByTagName('INPUT'); for (var i=0; i<mass.length; i++) mass[i].setAttribute('checked', 'checked'); document.getElementById('post_form').submit();">Выделить все</a> / <a style="cursor: pointer;" onclick="var mass = document.getElementById('filters_cont').getElementsByTagName('INPUT'); for (var i=0; i<mass.length; i++) mass[i].removeAttribute('checked'); document.getElementById('post_form').submit();">Снять выделение</a>
			
			</fieldset>
			</form><?
			?><div id="logs_container"><?
			if (!isset($MODULE_DATA["output"]["logs"]["today"])) {
			?></a><!-- Нет записей --><? } else {
				?><h2>Сегодня:</h2><?
				foreach ($MODULE_DATA["output"]["logs"]["today"] as $log) {
				?><span class="mod<?=$log["module_id"]?>">* Модуль "<?=$log["module"]["comment"]?>", пользователь <? if (isset($log["usergroup_name"])) { ?><a href="/office/usergroups/userslist/<?=$log["usergroup_id"]?>/" title="<?=$log["usergroup_name"]?>"><?=$log["username"]?></a><? } else { ?><?=$log["username"]?><? } ?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /></span><?
				}
			}
			
			if (!isset($MODULE_DATA["output"]["logs"]["yesterday"])) {
			?><!-- Нет записей --><? } else {
				?><br /><h2>Вчера:</h2><?
				foreach ($MODULE_DATA["output"]["logs"]["yesterday"] as $log) {
				?><span class="mod<?=$log["module_id"]?>">* Модуль "<?=$log["module"]["comment"]?>", пользователь <? if (isset($log["usergroup_name"])) { ?><a href="/office/usergroups/userslist/<?=$log["usergroup_id"]?>/" title="<?=$log["usergroup_name"]?>"><?=$log["username"]?></a><? } else { ?><?=$log["username"]?><? } ?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /></span><?
				}
			}
			
			if ($MODULE_DATA["output"]["show_earlier"]) {
				if (!isset($MODULE_DATA["output"]["logs"]["earlier"])) {
				?><!-- Нет записей --><? } else {
					?><br /><h2>Ранее:</h2><?
					foreach ($MODULE_DATA["output"]["logs"]["earlier"] as $log) {
					?><span class="mod<?=$log["module_id"]?>">* Модуль "<?=$log["module"]["comment"]?>", пользователь <? if (isset($log["usergroup_name"])) { ?><a href="/office/usergroups/userslist/<?=$log["usergroup_id"]?>/" title="<?=$log["usergroup_name"]?>"><?=$log["username"]?></a><? } else { ?><?=$log["username"]?><? } ?>, действие: <?=$log["action"]?>, элемент: <?=$log["entry_id"]?>, время: <?=$log["time"]?><br /></span><?
					}
				}
			}
			
			if (!isset($MODULE_DATA["output"]["logs"]["today"]) && !isset($MODULE_DATA["output"]["logs"]["yesterday"]) && !isset($MODULE_DATA["output"]["logs"]["earlier"])) {
				?>Нет записей.<?
			}
				
			?></div>
			<?
			// Pager block
			if (isset($MODULE_OUTPUT["pager_output"])) 
			{
				$pager_output = $MODULE_OUTPUT["pager_output"]; 
				if (count($pager_output["pages_data"]) > 1) // если есть что выводить, и страниц больше одной
		        {
		            echo "<br><div class=\"pager\">\n";
		           
		            if($pager_output["prev_page"])
		            {
		                echo "<div class='href' onclick='document.getElementById(\"page_field\").value=\"".$pager_output['prev_page']."\"; document.getElementById(\"post_form\").submit();' title=\"" . 'Предыдущая страница' . "\"";
		                echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span>";
		                echo $pager_output["prev_page"] ? "</div>" : "</span>";
		                echo " ";
		            }
		         
		
		            foreach ($pager_output["pages_data"] as $page => $data)
		            {
		                if (is_int($page))
		                {
		                    echo ($data["is_current"] ? "<strong>" : "<div class='href' onclick='document.getElementById(\"page_field\").value=\"".$page."\"; document.getElementById(\"post_form\").submit();'>") . $page . ($data["is_current"] ? "</strong>" : "</div>") . " ";
		                }
		
		                else
		                {
		                    echo "&hellip; ";
		                }
		            }
		
			            if ($pager_output["next_page"])
			            {
			                echo "<div class='href' onclick='document.getElementById(\"page_field\").value=\"".$pager_output['next_page']."\"; document.getElementById(\"post_form\").submit();' title=\"" . 'Следующая страница' . "\"";
			                echo " id=\"next_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&nbsp;&rarr;</span>";
			                echo "</div>";
			            }
			            echo "    </p>\n";
			            echo "</div>\n";
		        }
			}
		break;
	}
}




?>