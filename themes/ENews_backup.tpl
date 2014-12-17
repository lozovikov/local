<?php

$MODULE_MESSAGES = array(
	101 => "Материал успешно добавлен",
	102 => "Материал успешно обновлён",
	103 => "Материал успешно скрыт",
	104 => "Материал успешно открыт",
	105 => "Материал успешно удалён",
	106 => "Комментарий успешно добавлен",
	107 => "Комментарий успешно обновлён",
	107 => "Комментарий успешно скрыт",
	107 => "Комментарий успешно открыт",
	107 => "Комментарий успешно удалён",
	150 => "Информация об&nbsp;изображении успешно обновлена",
	301 => "Не&nbsp;указана категория материала",
	302 => "Неверный формат части пути (допустимы только латинские буквы, цифры, дефис и&nbsp;знак подчёркивания; строка, состоящая целиком из&nbsp;цифр, недопустима!)",
	303 => "Не&nbsp;заполнено поле краткого текста материала",
	310 => "Материал не&nbsp;найден в&nbsp;базе данных",
	311 => "Не заполнено поле &laquo;Автор&raquo;",
	312 => "Неверный формат поля &laquo;E-mail&raquo;",
	313 => "Не заполнено поле &laquo;Текст комментария&raquo;",
	314 => "Код подтверждения устарел. Пожалуйста, укажите новый код подтверждения",
	315 => "Не указан код подтверждения",
	316 => "Указан неверный код подтверждения",
	317 => "Ещё не истёк защитный интервал между сообщениями. Пожалуйста, повторите через несколько секунд",
	318 => "Комментарий не&nbsp;найден в&nbsp;базе данных",
	401 => "Ошибка базы данных при добавлении материала. Обратитесь к&nbsp;администратору",
	402 => "Ошибка базы данных при обновлении материала. Обратитесь к&nbsp;администратору",
	403 => "Ошибка базы данных при скрытии материала. Обратитесь к&nbsp;администратору",
	404 => "Ошибка базы данных при открытии материала. Обратитесь к&nbsp;администратору",
	405 => "Ошибка базы данных при удалении материала. Обратитесь к&nbsp;администратору",
	406 => "Ошибка базы данных при добавлении комментария. Обратитесь к&nbsp;администратору",
	407 => "Ошибка базы данных при обновлении комментария. Обратитесь к&nbsp;администратору",
	408 => "Ошибка базы данных при скрытии комментария. Обратитесь к&nbsp;администратору",
	409 => "Ошибка базы данных при открытии комментария. Обратитесь к&nbsp;администратору",
	410 => "Ошибка базы данных при удалении комментария. Обратитесь к&nbsp;администратору",
	450 => "Ошибка базы данных при обновлении информации об&nbsp;изображении. Обратитесь к&nbsp;администратору",
	901 => "Не&nbsp;выбран файл изображения",
	902 => "Размер файла изображения превышает максимально допустимый",
	903 => "Не&nbsp;удалось обнаружить закачанный файл. Обратитесь к&nbsp;администратору",
	904 => "Непредвиденная ошибка. Обратитесь к&nbsp;администратору",
	905 => "Не удаётся определить высоту и/или ширину изображения. Обратитесь к&nbsp;администратору",
	906 => "Размеры изображения превышают максимально допустимые",
	907 => "Файл не-изображения без расширения",
	908 => "Неизвестное расширение файла не-изображения",
	909 => "Неизвестный формат файла изображения",
	910 => "Ошибка создания файла изображения. Обратитесь к&nbsp;администратору",
	911 => "Ошибка копирования файла не-изображения. Обратитесь к&nbsp;администратору",
//	1001 => "Не&nbsp;указана группа новостей",
//	1002 => "Не&nbsp;указана папка новостей в&nbsp;режиме анонса",
//	1003 => "Не&nbsp;указано число выводимых новостей в&nbsp;режиме анонса",
//	1100 => "Неизвестный режим модуля",
	);


if ($MODULE_OUTPUT["messages"]["good"])
{
	$array = array();

	foreach ($MODULE_OUTPUT["messages"]["good"] as $elem)
	{
		if (isset($MODULE_MESSAGES[$elem]))
		{
			$array[] = $MODULE_MESSAGES[$elem];
		}
	}

	if ($array)
	{
		foreach ($array as $elem)
		{
			echo "<p class=\"message\">$elem</p>\n";
		}
	}
}

if ($MODULE_OUTPUT["messages"]["bad"] && isset($MODULE_OUTPUT["display_variant"]) && !in_array($MODULE_OUTPUT["display_variant"], array("add_item", "edit_item")))
{
	$array = array();

	foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem)
	{
		if (isset($MODULE_MESSAGES[$elem]))
		{
			$array[] = $MODULE_MESSAGES[$elem];
		}
	}

	if ($array)
	{
		foreach ($array as $elem)
		{
			echo "<p class=\"message red\">$elem</p>\n";
		}
	}
}


switch ($EE["language"])
{
	case "en":
		$LANGUAGE["news"] = array(
			"read_all_news" => "Read all news",
			"all_news" => "All news",
			"latest_news" => "News",
			"date_format" => "d/m/Y",
			"datetime_format" => "d/m/Y g:i:s A",
			"read_more" => "Read more",
			"more" => "more",
			"prev" => "prev",
			"previous_page" => "Previous page",
			"next" => "next",
			"next_page" => "Next page",
			"pages" => "Pages",
			"add_comment" => "Add comment",
			"comments" => "Comments",
			"no_comments" => "There are no comments for this item currently. Your comment could be the first one!",
			"name" => "Name",
			"location" => "Location",
			"email" => "E-mail",
			"your_comment" => "Your comment",
			"confirmation_code" => "Confirmation code",
			"confirmation_code_hint" => "Please write in a code displayed on the picture.",
			"obligatory_field" => "Obligatory field",
			"all_publications" => "all publications",
			"read_all_publications" => "Read all publications",
			);
		break;

	default:
		$LANGUAGE["news"] = array(
			"read_all_news" => "Читать все новости",
			"all_news" => "Все материалы",
			"latest_news" => "Последние материалы",
			"date_format" => "d.m.Y",
			"datetime_format" => "d.m.Y, H:i:s",
			"read_more" => "Читать подробнее",
			"more" => "подробнее",
			"prev" => "предыдущая",
			"previous_page" => "Предыдущая страница",
			"next" => "следующая",
			"next_page" => "Следующая страница",
			"pages" => "Страницы",
			"add_comment" => "Добавить комментарий",
			"comments" => "Комментарии",
			"no_comments" => "На данный момент к&nbsp;этому материалу нет ни&nbsp;одного комментария. Вы можете оставить первый!",
			"name" => "Имя",
			"location" => "Город",
			"email" => "E-mail",
			"your_comment" => "Ваш комментарий",
			"confirmation_code" => "Код подтверждения",
			"confirmation_code_hint" => "Пожалуйста, введите цифровой код, изображённый на картинке.",
			"obligatory_field" => "Поле, обязательное для заполнения",
			"all_publications" => "Все новости",
			"read_all_publications" => "Читать все новости",
			);
		break;
}



switch ($MODULE_OUTPUT["mode"])
{

	case "announce":
    //CF::Debug($MODULE_OUTPUT);
	if ($MODULE_OUTPUT["news"])	{
		$sub_mode = $MODULE_OUTPUT["sub_mode"];
		if($sub_mode == "none") { ?>
<div id="newscat<?=$MODULE_OUTPUT["cat_id"]?>" class="news_block"><h2><a href="<?=$MODULE_OUTPUT["folder_uri"]?>" title="<?=$LANGUAGE["news"]["read_all_news"]?>"><?=$MODULE_OUTPUT["folder_title"]?></a> <? if(isset($MODULE_OUTPUT["prev_skip"]) && 0) { ?><a style="cursor:pointer;" onclick="process(<?=$MODULE_OUTPUT["prev_skip"]?>, <?=$MODULE_OUTPUT["cat_id"]?>, <?=$MODULE_OUTPUT["news_folder_id"]?>, <?=$MODULE_OUTPUT["display_limit"]?>);"><img title="Предыдущие записи" alt="Предыдущие записи" src="/themes/images/news_previous.png"></a><? } if (isset($MODULE_OUTPUT["next_skip"])) { ?> <a style="cursor:pointer;" onclick="process(<?=$MODULE_OUTPUT["next_skip"]?>, <?=$MODULE_OUTPUT["cat_id"]?>, <?=$MODULE_OUTPUT["news_folder_id"]?>, <?=$MODULE_OUTPUT["display_limit"]?>);"><img title="Следующие записи" alt="Следующие записи" src="/themes/images/news_next.png"></a><? } ?></h2> 
<?php		foreach ($MODULE_OUTPUT["news"] as $data) {
				if ($data["has_full_text"]) {
					$link_begin_t = "<a href=\"". $data["link"] . "\" title=\"" . $LANGUAGE["news"]["read_more"] . "\">";
					$link_end = "</a>";
				} else {
					$link_begin_h = $link_begin_t = $link_end = "";
				} ?>
	<div class="col"><div class="col-inner">
<?php 			if ($data["output_files"]) {
					echo "{$link_begin_t}<img src=\"{$data["output_files"][2]}\" alt=\"{$data["title"]}\" class=\"float-left\" />{$link_end}";
				} ?>
		<p><div class="news_date"><?php echo date($LANGUAGE["news"]["date_format"], strtotime($data["time"])); ?>&nbsp;<?=$data["title"]?></div>
		<span class="news_text"><?=$link_begin_t?>
		<?php echo $data["has_full_text"] ? strip_tags($data["short_text"], "<br>, <span>") : strip_tags($data["short_text"], "<a>, <br>, <span>"); ?>
		<?=$link_end?></span></p>
	<div class="pusher"></div></div></div>
<?php 		} ?>
		</div>
<?php	} else {
			if($sub_mode == "image"){ ?>
<div id="news_annonse">
	<?php	} elseif($sub_mode == "text") {?>
<div id="dissertation">
	<?php	} elseif($sub_mode == "title") {?>
<div id="conference">
	<?php	} else {?>
<div>
	<?php	} ?>
	<div id="newscat<?=$MODULE_OUTPUT["cat_id"]?>">
		<h1>
			<a href="<?=$MODULE_OUTPUT["folder_uri"]?>" title="<?=$LANGUAGE["news"]["read_all_news"]?>"><?=$MODULE_OUTPUT["folder_title"]?></a>
	<?php 	if(isset($MODULE_OUTPUT["prev_skip"]) && $sub_mode == "none") { ?>
			<a style="cursor:pointer;" onclick="process(<?=$MODULE_OUTPUT["prev_skip"]?>, <?=$MODULE_OUTPUT["cat_id"]?>, <?=$MODULE_OUTPUT["news_folder_id"]?>, <?=$MODULE_OUTPUT["display_limit"]?>);">
				<img title="Предыдущие записи" alt="Предыдущие записи" src="/themes/images/news_previous.png">
			</a>
	<?php 	}
		if (isset($MODULE_OUTPUT["next_skip"]) && $sub_mode == "none") { ?>
			<a style="cursor:pointer;" onclick="process(<?=$MODULE_OUTPUT["next_skip"]?>, <?=$MODULE_OUTPUT["cat_id"]?>, <?=$MODULE_OUTPUT["news_folder_id"]?>, <?=$MODULE_OUTPUT["display_limit"]?>);">
				<img title="Следующие записи" alt="Следующие записи" src="/themes/images/news_next.png">
			</a>
	<?php 	} ?>
		</h1>
	<?php 	if($sub_mode == "image"){ ?>		
		<ul>
	<?php	}
		foreach ($MODULE_OUTPUT["news"] as $data) {
			if ($data["has_full_text"]) {
				$link_begin_t = "<a href=\"". $data["link"] . "\" title=\"" . $LANGUAGE["news"]["read_more"] . "\">";
				$link_end = "</a>";
			} else {
				$link_begin_h = $link_begin_t = $link_end = "";
			}
			switch($sub_mode) {
				case "image": { ?>	
			<li>
				<div>
	<?php 		if ($data["output_files"]) { ?>
					<?=$link_begin_t?><img src="<?=$data["output_files"][2]?>" alt="<?=$data["title"]?>" /><?=$link_end?>
	<?php		} ?>
					<h5><?=date($LANGUAGE["news"]["date_format"], strtotime($data["time"]))?></h5>
					<p>
						<?=$link_begin_t?><?=$data["title"]?><?=$link_end?>
					</p>
				</div>
			</li>					
	<?php 			}
				break;
				case "text": { ?>	
			<div>
				<h5><?=date($LANGUAGE["news"]["date_format"], strtotime($data["time"]))?></h5>
				<h2><?=$link_begin_t?><?=$data["title"]?><?=$link_end?></h2>
				<?=$data["short_text"]?>
			</div>					
	<?php					
				}
				break;
				case "title": { ?>
			<div>
				<h5><?=date($LANGUAGE["news"]["date_format"], strtotime($data["time"]))?></h5>
				<p><?=$link_begin_t?><?=$data["title"]?><?=$link_end?></p>
			</div>
	<?php			}
				break;
			}	
		}
		if($sub_mode == "image"){ ?>
			<li class="last_li">&nbsp;</li>
		</ul>
	<?php	} ?>		
	</div>
	
	
	<div class="shadow_tr"></div>
	<div class="shadow_b">
		<div class="shadow_br"></div>
		<div class="shadow_bl"></div>
	</div>
</div>
<?php	}
	}
	break;

	case "comments":
		
		if ($MODULE_OUTPUT["comments"] && !empty($MODULE_OUTPUT["comments"])) // !!! сделать, чтобы не показывалось при отключенных комментариях
		{
		//	CF::Debug($MODULE_OUTPUT["comments"]);
			echo "<br />\n<div class=\"news_block\"><h2>Последние комментарии:</h2></div><br />\n";
			foreach ($MODULE_OUTPUT["comments"] as $data)
			{
				echo "<div" . ($data["is_active"] ? "" : " class=\"inactive\"") . ">";
				echo "<div><small><strong>" . $data["author_name"] . "</strong>" . (CF::IsNonEmptyStr($data["author_from"]) ? " ({$data["author_from"]})" : "") . ", " . date($LANGUAGE["news"]["datetime_format"], strtotime($data["time"])) . "</small>:</div>\n";
				echo "<div>{$data["text"]}</div>\n";
				echo "</div>\n";
				echo "<br />\n";
			}
		}
		break;
	
	case "full_list":
	{
		if (!function_exists("FlattenNewsCats")) // !!! нужно выводить плоский список модулем
		{
			function FlattenNewsCats($input)
			{
				$output = array();

				if (is_array($input))
				{
					foreach ($input as $key => $elem)
					{
						$output[$key] = $elem;

						if ($elem["subitems"])
						{
							$output += FlattenNewsCats($elem["subitems"]);
						}

						unset($output[$key]["subitems"]);
					}
				}

				return $output;
			}
		}

		$array = FlattenNewsCats($MODULE_OUTPUT["cats"]);

?>
<h1><?=/*$MODULE_OUTPUT["cats"]*/$array[$MODULE_OUTPUT["root_cat_id"]]["title"]?></h1>
<?php
		/*if (isset($MODULE_OUTPUT["cats"][$MODULE_OUTPUT["cat_id"]]["subitems"]) && $MODULE_OUTPUT["cats"][$MODULE_OUTPUT["cat_id"]["subitems"]])
		{
			echo "<ul>\n";

			foreach ($MODULE_OUTPUT["cats"][$MODULE_OUTPUT["cat_id"]]["subitems"] as $data)
			{
				echo "	<li><a href=\"" . $EE["unqueried_uri"] . $data["uripart"] . "/\" title=\"" . $data["descr"] . "\">" . $data["title"] . "</a></li>\n";
			}

			echo "</ul>\n";
		}*/

		$pager_output = $MODULE_OUTPUT["pager_output"];


		foreach ($MODULE_OUTPUT["news"] as $data)
		{
			if ($data["has_full_text"])
			{
				$link_begin_h = "<a href=\"". $data["link"] . "\" title=\"" . $LANGUAGE["news"]["read_more"] . "\">";
				$link_begin_t = "<a href=\"". $data["link"] . "\" class=\"nd\" title=\"" . $LANGUAGE["news"]["read_more"] . "\">";
				$link_end = "</a>";
			}

			else
			{
				$link_begin_h = $link_begin_t = $link_end = "";
			}


			echo "<div" . ($data["is_active"] ? "" : " class=\"inactive\"") . ">";

			echo "\t<p class=\"news_date\">" . $link_begin_h . date($LANGUAGE["news"]["date_format"], strtotime($data["time"])) . "\n". $data["title"] . $link_end . "</p>\n\t<p>";

			echo "<p class=\"news_text\">";
			if ($data["output_files"])
			{
				echo "{$link_begin_h}<img src=\"{$data["output_files"][2]}\" alt=\"{$data["title"]}\" class=\"float-left\" />{$link_end}";
			}
			echo $link_begin_t . /*strip_tags*/($data["short_text"]) . $link_end. "</p>";
			
			
//			echo $data["short_text"];
			echo "</p><div class=\"pusher\"></div>\n";

			if ($MODULE_OUTPUT["privileges"]["cat.items.handle"] || ($MODULE_OUTPUT["privileges"]["cat.create.items"]["create"] && $MODULE_OUTPUT["privileges"]["cat.create.items"]["user_id"] == $data["create_user_id"]))
			{
?>
<p class="actions">
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_item&amp;id=<?=$data["id"]?>#form">Редактировать</a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=<?php echo $data["is_active"] ? "hide" : "unhide"; ?>_item&amp;id=<?=$data["id"]?>"><?php echo $data["is_active"] ? "Скрыть" : "Открыть"; ?></a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_item&amp;id=<?=$data["id"]?>" onclick="return confirm('Вы действительно хотите удалить этот материал?')">Удалить</a>&nbsp;]
</p>
<?php
			}

			echo "</div>\n";
		}

                if (count($pager_output["pages_data"]) > 1) // если есть что выводить, и страниц больше одной
        {
            echo "<div class=\"pager\">\n";
            //echo "    <p><strong>" . $LANGUAGE["news"]["pages"] . ":</strong> ";
            if($pager_output["prev_page"])
            {
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["prev_page"]]["link"]}\" title=\"" . $LANGUAGE["news"]["previous_page"] . "\"";
                echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span>";
                echo $pager_output["prev_page"] ? "</a>" : "</span>";
                echo " ";
            }
            
            //echo "</p>\n";
            //echo "    <p>";

            foreach ($pager_output["pages_data"] as $page => $data)
            {
                if (is_int($page))
                {
                    echo ($data["is_current"] ? "<strong>" : "<a href=\"{$data["link"]}\">") . $page . ($data["is_current"] ? "</strong>" : "</a>") . " ";
                }

                else
                {
                    echo "&hellip; ";
                }
            }

            if ($pager_output["next_page"])
            {
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["next_page"]]["link"]}\" title=\"" . $LANGUAGE["news"]["next_page"] . "\"";
                echo " id=\"next_page_link\" class=\"prev-next-link\">" /*. $LANGUAGE["news"]["next"]*/ . "<span class=\"arrow\">&nbsp;&rarr;</span>";
                echo "</a>";
            }
            echo "    </p>\n";
            echo "</div>\n";

            //$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "    <script type=\"text/javascript\" src=\"{$EE["http_scripts"]}pager.js\"></script>\n";
        }
        
		include "ENews_forms.tpl";
	}

	break;


	case "detail":
		$array = array();

		foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem)
		{
			if (isset($MODULE_MESSAGES[$elem]))
			{
				$array[] = $MODULE_MESSAGES[$elem];
			}
		}

		foreach ($array as $elem)
		{
			echo "<p>$elem</p>\n";
		}

		echo "<div id=\"detail_text\">\n";
		
		echo "<h1>" . "<small class=\"date\">" . date($LANGUAGE["news"]["date_format"], strtotime($MODULE_OUTPUT["item"]["time"])) . "</small>" . "\n\t" . $MODULE_OUTPUT["item"]["title"] . "</h1>\n";

		if ($MODULE_OUTPUT["item"]["output_files"])
		{
			echo "<img src=\"{$MODULE_OUTPUT["item"]["output_files"][1]}\" alt=\"{$MODULE_OUTPUT["item"]["title"]}\" class=\"float-left\" />";
		}

		echo $MODULE_OUTPUT["item"]["text"] . "\n";
		echo "</div>\n\n";
		
		echo '<p><script type="text/javascript" src="//yandex.st/share/share.js" charset="utf-8"></script>
			<div id="yandex_icons" onmouseover="change_title(this, '.'\''.$MODULE_OUTPUT["item"]["title"].'\''.', false);" class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="none" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,lj"></div> </p>';

		if ($MODULE_OUTPUT["privileges"]["cat.items.handle"])
		{
?>
<p class="actions">
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_item&amp;id=<?=$MODULE_OUTPUT["item"]["id"]?>#form">Редактировать</a>&nbsp;]
</p>

<?php
		}
		
		if(!empty($MODULE_OUTPUT["item"]["tags"]))
        {
        	echo "Метки: ";
        	foreach($MODULE_OUTPUT["item"]["tags"] as $tag)
        	echo "<a href=\"/tag/".$tag."\">".$tag."</a> ";
		}

		echo "<div class=\"pusher\" />&nbsp;</div>\n";
		echo "<p><a href=\"{$MODULE_OUTPUT["folder_uri"]}\" title=\"" . $LANGUAGE["news"]["read_all_publications"] . "\">" . $LANGUAGE["news"]["all_publications"] . "</a></p>\n";
/*?>
<p><a href="#comment_form"><strong><?=$LANGUAGE["news"]["add_comment"]?></strong></a></p>
<h3><?=$LANGUAGE["news"]["comments"]?></h3>
<?php  */

if ($MODULE_OUTPUT["comments"]) // !!! сделать, чтобы не показывалось при отключенных комментариях
{
//	CF::Debug($MODULE_OUTPUT["comments"]);

	foreach ($MODULE_OUTPUT["comments"] as $data)
	{
		echo "<div" . ($data["is_active"] ? "" : " class=\"inactive\"") . ">";
		echo "<div><small><strong>" . $data["author_name"] . "</strong>" . (CF::IsNonEmptyStr($data["author_from"]) ? " ({$data["author_from"]})" : "") . ", " . date($LANGUAGE["news"]["datetime_format"], strtotime($data["time"])) . "</small>:</div>\n";
		echo "<div>{$data["text"]}</div>\n";

		if ($MODULE_OUTPUT["privileges"]["cat.comments.handle"])
		{
?>
<p class="actions">
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_comment&amp;id=<?=$data["id"]?>#form">Редактировать</a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=<?php echo $data["is_active"] ? "hide" : "unhide"; ?>_comment&amp;id=<?=$data["id"]?>"><?php echo $data["is_active"] ? "Скрыть" : "Открыть"; ?></a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_comment&amp;id=<?=$data["id"]?>" onclick="return confirm('Вы действительно хотите удалить этот комментарий?')">Удалить</a>&nbsp;]
</p>
<?php
		}

		echo "</div>\n";
		echo "<br />\n";
	}
}

else if ($MODULE_OUTPUT["display_comments"])
{
?>
<p><?=$LANGUAGE["news"]["no_comments"]?></p>
<?php
}
if ($MODULE_OUTPUT["display_comments"]) {
?>
<a name="comment_form"></a>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<input type="hidden" name="<?=$NODE_ID?>[add_comment][item_id]" value="<?=$MODULE_OUTPUT["item"]["id"]?>" />
	<p><label class="block"><strong><?=$LANGUAGE["news"]["name"]?><span class="hint" title="<?=$LANGUAGE["news"]["obligatory_field"]?>">*</span></strong>:</label> <input name="<?=$NODE_ID?>[add_comment][author_name]" maxlength="255" value="<?=$MODULE_OUTPUT["comment_form_data"]["author_name"]?>" /></p>
	<p style="display:none;"><label class="block"><strong><?=$LANGUAGE["news"]["location"]?></strong>:</label> <input name="<?=$NODE_ID?>[add_comment][author_from]" maxlength="255" value="<?=$MODULE_OUTPUT["comment_form_data"]["author_from"]?>" /></p>
	<p><label class="block"><strong><?=$LANGUAGE["news"]["email"]?></strong>:</label> <input name="<?=$NODE_ID?>[add_comment][author_email]" maxlength="255" value="<?=$MODULE_OUTPUT["comment_form_data"]["author_email"]?>" /></p>
	<p><label><strong><?=$LANGUAGE["news"]["your_comment"]?><span class="hint" title="<?=$LANGUAGE["news"]["obligatory_field"]?>">*</span></strong>:</label><br />
		<textarea name="<?=$NODE_ID?>[add_comment][text]" cols="30" rows="8" class="common"><?=$MODULE_OUTPUT["comment_form_data"]["text"]?></textarea></p>
	<!-- <p><label><strong><?=$LANGUAGE["news"]["confirmation_code"]?><span class="hint" title="<?=$LANGUAGE["news"]["obligatory_field"]?>">*</span>:</strong></label><br />
		<small><?=$LANGUAGE["news"]["confirmation_code_hint"]?></small><br />
		<input name="<?=$NODE_ID?>[add_comment][code]" maxlength="4" value="" class="code block" /> <img src="<?=$MODULE_OUTPUT["comment_form_data"]["code"]?>" alt="" class="block" /> --> 
		<input type="submit" value="<?=$LANGUAGE["news"]["add_comment"]?>" class="block after-code" /><div class="pusher"></div></p>
</form>

<?php 
}
		include "ENews_forms.tpl";
		//echo "</div>\n";
		
		echo '<script>set_handlers();</script>';
		
		break;
		
		
	case "subscribe":
		?>
		<h2>Подписаться на новости</h2>
		<div>
		<?=$MODULE_OUTPUT["messages"]["confirmation_result"]?>
		<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<input type="text" size="30" name="<?=$NODE_ID?>[subscribe][email]" value="ваш e-mail" onclick="this.value='';" onblur="if(!this.value) this.value='ваш e-mail';" />
		<input type="submit" value="Готово" class="button" />
		</form>
		</div>
		
		<?php
	break;

	case "RSS":
		if ($MODULE_OUTPUT["news"]) {
	        header("content-type: application/rss+xml");
	        echo "<?xml version=\"1.0\" encoding=\"windows-1251\"?>\n<rss version=\"2.0\">\n<channel>\n";
	        echo "<title>".SITE_NAME."</title>\n<link>http://".APPLIED_DOMAIN."</link>\n\n";
	        foreach ($MODULE_OUTPUT["news"] as $data) {
				$title=$data["title"];
				$link=$data["link"];
				$shortText=$data["short_text"];
				$time=$data["time"];
	
				$short_text = CF::RefineText($shortText);
				echo "<item>\n
				    <title>$title</title>\n
				    <link>http://".APPLIED_DOMAIN."$link</link>\n 
				    <description>$short_text</description>\n
				    <pubDate>$time</pubDate>\n
				    </item>\n\n"; 
			}   
	        echo "</channel>\n
	                </rss>";  
	    }
    break;
}

?>