<?php

$MODULE_MESSAGES = array(
	101 => "Раздел успешно добавлен",
	102 => "Файл успешно добавлен",
	103 => "Файл успешно удалён",
	104 => "Свойства файла успешно сохранены",
	105 => "Свойства раздела успешно сохранены",
	106 => "Раздел был успешно скрыт",
	107 => "Раздел был успешно открыт",
	300 => "Не&nbsp;заполнено поле &laquo;Часть адреса&raquo;",
	301 => "Неверно заполнено поле &laquo;Часть адреса&raquo; (допустимы только латинские буквы, цифры, дефис и&nbsp;знак подчёркивания)",
	302 => "Не&nbsp;указано название раздела",
	303 => "Ошибка базы данных при добавлении раздела, обратитесь к&nbsp;администратору",
	304 => "Не&nbsp;выбран файл для добавления",
	305 => "Размер файла превышает допустимый: не&nbsp;более " . CF::FormatFilesize($MODULE_OUTPUT["input_file_max_size"]),
	306 => "Не&nbsp;удалось найти закачанный файл, обратитесь к&nbsp;администратору",
	307 => "Непредвиденная ошибка, обратитесь к&nbsp;администратору",
	308 => "Не&nbsp;удаётся определить высоту и/или ширину исходного изображения",
	309 => "Размеры исходного изображения превышают допустимые: не&nbsp;более {$MODULE_OUTPUT["input_image_max_dim"]}&times;{$MODULE_OUTPUT["input_image_max_dim"]} точек)",
	310 => "Неизвестный тип файла",
	311 => "Неизвестное расширение файла",
	312 => "Ошибка создания файла изображения, обратитесь к&nbsp;администратору",
	313 => "Ошибка копирования файла, обратитесь к&nbsp;администратору",
	314 => "Ошибка базы данных при добавлении файла, обратитесь к&nbsp;администратору",
	315 => "Ошибка базы данных при удалении файла, обратитесь к&nbsp;администратору",
	316 => "Удаляемый файл не&nbsp;найден в&nbsp;базе данных, возможно, он уже был удалён раннее",
	317 => "Редактируемый файл не&nbsp;найден в&nbsp;базе данных",
	318 => "Ошибка базы данных при сохранении свойств файла, обратитесь к&nbsp;администратору",
	319 => "Редактируемый раздел не&nbsp;найден в&nbsp;базе данных",
	320 => "Ошибка базы данных при сохранении свойств раздела, обратитесь к&nbsp;администратору",
	321 => "Ошибка базы данных при скрытии раздела, обратитесь к&nbsp;администратору",
	322 => "Ошибка базы данных при открытии раздела, обратитесь к&nbsp;администратору",
	);


//$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<link rel=\"stylesheet\" href=\"{$EE["http_styles"]}screen-page-portfolio.css\" type=\"text/css\" />\n";
//$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<link rel=\"stylesheet\" href=\"{$EE["http_styles"]}screen-aux-highslide.css\" type=\"text/css\" />\n";

//CF::Debug($MODULE_OUTPUT);



switch ($EE["language"])
{
	case "en":
		$LANGUAGE["gallery"] = array(
			"entire_gallery_descr" => "See entire gallery",
			"entire_gallery_title" => "Entire gallery",
			"enlarge_descr" => "enlarge image",
			"enlarge_descr2" => "Enlarge image",
			"download_descr" => "download/open file",
			"download_descr2" => "Download/open file",
			"filesize" => array("bytes", "KB", "MB"),
			);
		break;

	default:
		$LANGUAGE["gallery"] = array(
			"entire_gallery_descr" => "Смотреть галерею полностью",
			"entire_gallery_title" => "Вся галерея",
			"enlarge_descr" => "увеличить изображение",
			"enlarge_descr2" => "Увеличить изображение",
			"download_descr" => "скачать/открыть файл",
			"download_descr2" => "Скачать/открыть файл",
			"filesize" => array("байт", "КБ", "МБ"),
			);
		break;
}



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


if ($MODULE_OUTPUT["messages"]["bad"] && isset($MODULE_OUTPUT["display_variant"]) && !in_array($MODULE_OUTPUT["display_variant"], array("add_section", "add_item", "edit_section", "edit_item")))
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


switch ($MODULE_OUTPUT["mode"])
{
	case "section":

//	echo "<h1>" . $MODULE_OUTPUT["current_section_data"]["title"] . "</h1>\n";
//	echo $MODULE_OUTPUT["current_section_data"]["text"];

	//CF::Debug($MODULE_OUTPUT);
    $pager_output = $MODULE_OUTPUT["pager_output"];

		if (count($pager_output["pages_data"]) > 1) // если есть что выводить, и страниц больше одной
		{
			echo "<div class=\"pager\">\n";
			echo "<p>";
			/*if ($pager_output["prev_page"])
			{
				echo "<a href=\"{$pager_output["pages_data"][$pager_output["prev_page"]]["link"]}\" title=\"Предыдущая страница\"";
				echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span>";
				echo "</a>";
				echo " ";
			}   */
			/*foreach ($pager_output["pages_data"] as $page => $data)
			{
				if (is_int($page))
				{
					echo ($data["is_current"] ? "<span class=\"active item\">" : "<a href=\"{$data["link"]}\" class=\"item\">") . $page . ($data["is_current"] ? "</span>" : "</a>") . " ";
				}

				else
				{
					echo "&hellip; ";
				}
			};  */
			/*if ($pager_output["next_page"])
			{
				echo "<a href=\"{$pager_output["pages_data"][$pager_output["next_page"]]["link"]}\" title=\"Следующая страница\"";
				echo " id=\"next_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&nbsp;&rarr;</span>";
				echo "</a>";
			}             */
			echo "</p>\n";
			echo "</div>\n";
		}		
?>
<div id="EGallery">
<div id="levo">
<?php
	if ($pager_output["prev_page"])
	{
		echo "<a href=\"?page={$pager_output["prev_page"]}\" title=\"Предыдущая страница\" alt=\"&larr;\" onclick=\"return loadXMLDoc({$MODULE_OUTPUT["section_data"]["id"]}, {$pager_output["prev_page"]});\"><img src=\"/themes/images/levo.gif\" /></a>";
	}
?>
</div>


<div class="gallery-items ">
<?php

		foreach ($MODULE_OUTPUT["items"] as $key => $data)
		{
			if ($data["is_image"])
			{
?>
	<div class="highslide-gallery" style="float: left; margin: 10px;">
		<div class="item_content_sub">
		<a href="<?=$data["output_files"][1]?>" class="highslide" onclick="return hs.expand(this,{ outlineType: 'rounded-white' })" title="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)">
		<img src="<?=$data["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" /></a>
		
		


<div class="highslide-caption">
	<?=$data["descr"]?>
</div>
</div>
		<div class="pusher"></div><?php
			}

			else
			{
?>
	<div class="gallery-item">
		
		
		<a href="<?=$data["output_files"][1]?>" 																	  title="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["download_descr"]) : $LANGUAGE["gallery"]["download_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)">
		<img src="<?=$data["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" /></a>
		
		<div class="pusher"></div><?php
			}

			

			if ($MODULE_OUTPUT["manage_access"])
			{
?>
		<div class="actions">[<a href="?node=<?=$NODE_ID?>&amp;action=edit_item&amp;id=<?=$data["id"]?>#form">Свойства</a>]<br/> [<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_item&amp;id=<?=$data["id"]?>" onclick="return confirm('Вы действительно хотите удалить этот файл?')">Удалить</a>]</div><?php
			}

			echo "</div>\n"; // gallery-item
		}
?>
<div class="pusher"></div>
</div>
<div id="pravo">
<?php
if ($pager_output["next_page"])
	{
		echo "<a href=\"?page={$pager_output["next_page"]}\" title=\"Следующая страница\" alt=\"&rarr;\" onclick=\"return loadXMLDoc({$MODULE_OUTPUT["section_data"]["id"]}, {$pager_output["next_page"]});\"><img src=\"/themes/images/pravo.gif\" /></a>";
	}
?>
</div>
</div>
<div class="pusher"></div>
<?php

		if ($MODULE_OUTPUT["subsections"])
		{

			foreach ($MODULE_OUTPUT["subsections"] as $key => $data)
			{
				if($data["items_num"]==0){

?>
<div class="gallery-items">
<div class="gallery-item">
		<!--a href="<?=$data2["output_files"][1]?>" onclick="return hs.expand(this)" title="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)"-->
		<div class="item_content">
		<a href="<?=$data["link"]?>" title="<?=$LANGUAGE["gallery"]["entire_gallery_title"]?>">
		<img src="/images/people/no_photo.jpg" alt="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" />
		
		<div class="album_title">
		<div><?=$data["title"]?></div>
		<div class="sum_photo"> <?=$data["items_num"]?></div>
		</div>
		</a>
		</div>
		<div class="pusher"></div></div></div>
<!--h2><a href="<?=$data["link"]?>" title="<?=$LANGUAGE["gallery"]["entire_gallery_title"]?>"><?=$data["title"]?></a></h2-->
<?}?>
<div class="gallery-items">
<?php

		foreach ($data["items"] as $key2 => $data2)
		{
			if ($data2["is_image"])
			{
				
?>
	<div class="gallery-item">
		<!--a href="<?=$data2["output_files"][1]?>" onclick="return hs.expand(this)" title="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)"-->
		<div class="item_content">
		<a href="<?=$data["link"]?>" title="<?=$LANGUAGE["gallery"]["entire_gallery_title"]?>">
		<img src="<?=$data2["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" />
		
		<div class="album_title">
		<div><?=$data["title"]?></div>
		<div class="sum_photo"> <?=$data["items_num"]?></div>
		</div>
		</a>
		</div>
		<div class="pusher"></div>
		<?php
			}

			else
			{
?>
	<div class="gallery-item">
		<a href="<?=$data2["output_files"][1]?>" title="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["download_descr"]) : $LANGUAGE["gallery"]["download_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)">
		<img src="<?=$data2["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data["descr"]) ? (htmlspecialchars(strip_tags($data["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" /></a><div class="pusher"></div><?php
			}

/*				echo "\n\t\t\t<small>{$data2["descr"]}</small>\n";*/
			/*  echo "
			<small>{$data["descr"]} (", CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]), ")</small>\n";    */

			if ($MODULE_OUTPUT["manage_access"])
			{
?>
		<p class="actions">[<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_item&amp;id=<?=$data2["id"]?>#form">Свойства</a>]
		<br/>
		[<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_item&amp;id=<?=$data2["id"]?>" onclick="return confirm('Вы действительно хотите удалить этот файл?')">Удалить</a>]</p><?php
			}

			echo "</div>\n"; // gallery-item
	?>
<?php
		}
?>




<!--div id="pravo"><a href=""><img src="/themes/images/pravo.gif" /></a></div>
<div class="full_gallery"><a href="<?=$data["link"]?>" title="Смотреть галерею полностью">&nbsp;&rarr;</a></div><?php echo $data["is_active"] ? "" : "</div>"; ?>
<div class="pusher">&nbsp;</div-->
</div>
<?php
			}
		}



		if ($MODULE_OUTPUT["manage_access"])
		{
			if ($MODULE_OUTPUT["display_variant"] != "add_item")
			{
?>

<div class="pusher">&nbsp;</div>
<div style="clear: both"></div>
<p class="actions">[<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_section&amp;id=<?=$MODULE_OUTPUT["section_data"]["id"]?>#form">Свойства текущего раздела</a>]</p>
<p class="actions">[<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=add_item#form">Добавить файл в текущий раздел</a>]</p>
<?php
			}

			if ($MODULE_OUTPUT["display_variant"] != "add_section")
			{
?>
<p class="actions">[<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=add_section&pid=<?=$MODULE_OUTPUT["section_data"]["id"]?>#form">Добавить подраздел</a>]</p>
<?php 
			}

			if ($MODULE_OUTPUT["display_variant"] == "add_section")
			{
				$data = $MODULE_OUTPUT["form_data"];
?>
<a name="form"></a>
<h2>Добавление раздела</h2>
<?php

				if ($MODULE_OUTPUT["messages"]["bad"])
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

?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<input type="hidden" name="<?=$NODE_ID?>[add_section][pid]" value="<?=$data["pid"]?>" />
	<p><label class="block wide"><strong>Позиция:</strong></label> <input type="text" name="<?=$NODE_ID?>[add_section][pos]" value="<?=$data["pos"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label class="block wide"><strong>Часть адреса<span class="hint" title="Обязательное для заполнения поле">*</span>:</strong></label> <input type="text" name="<?=$NODE_ID?>[add_section][uri_part]" value="<?=$data["uri_part"]?>" class="block text" id="uri_part" /><div class="pusher"></div>
		<small>(часть пути в адресной строке браузера, допустимы: латинские буквы, цифры, дефис, знак подчёркивания)</small></p>
	<p><label class="block wide"><strong>Название раздела<span class="hint" title="Обязательное для заполнения поле">*</span>:</strong></label> <input type="text" name="<?=$NODE_ID?>[add_section][title]" value="<?=$data["title"]?>" class="block text" id="section_title" /><div class="pusher"></div>
		<small>(заголовок раздела, разрешены любые символы)</small></p>
	<p><label><strong>Краткое описание раздела:</strong></label><br />
		<small>(небольшой текст, описывающий данный раздел)</small>
		<textarea name="<?=$NODE_ID?>[add_section][descr]" cols="20" rows="8" class="common wysiwyg"><?=$data["descr"]?></textarea></p>
	<p><label><strong>Полное описание раздела:</strong></label><br />
		<small>(полный текст, описывающий данный раздел)</small>
		<textarea name="<?=$NODE_ID?>[add_section][text]" cols="20" rows="8" class="common wysiwyg"><?=$data["text"]?></textarea></p>
	<p><input type="submit" value="Добавить раздел" /> <input type="submit" name="<?=$NODE_ID?>[cancel]" value="Отмена" /></p>
</form>
<?php
			}


			elseif ($MODULE_OUTPUT["display_variant"] == "edit_section")
			{
				$data = $MODULE_OUTPUT["form_data"];
?>
<a name="form"></a>
<h2>Изменение свойств раздела</h2>
<?php

				if ($MODULE_OUTPUT["messages"]["bad"])
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

?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<input type="hidden" name="<?=$NODE_ID?>[save_section][id]" value="<?=$data["id"]?>" />
	<input type="hidden" name="<?=$NODE_ID?>[save_section][pid]" value="<?=$data["pid"]?>" />
	<p><label class="block wide"><strong>Позиция:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_section][pos]" value="<?=$data["pos"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label class="block wide"><strong>Часть адреса<span class="hint" title="Обязательное для заполнения поле">*</span>:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_section][uri_part]" value="<?=$data["uri_part"]?>" class="block text" id="uri_part" /><div class="pusher"></div>
		<small>(часть пути в адресной строке браузера, допустимы: латинские буквы, цифры, дефис, знак подчёркивания)</small></p>
	<p><label class="block wide"><strong>Название раздела<span class="hint" title="Обязательное для заполнения поле">*</span>:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_section][title]" value="<?=$data["title"]?>" class="block text" id="section_title" /><div class="pusher"></div>
		<small>(заголовок раздела, разрешены любые символы)</small></p>
	<p><label><strong>Описание раздела:</strong></label><br />
		<small>(небольшой текст, описывающий данный раздел)</small>
		<textarea name="<?=$NODE_ID?>[save_section][descr]" cols="20" rows="8" class="common wysiwyg"><?=$data["descr"]?></textarea></p>
	<p><label><strong>Полное описание раздела:</strong></label><br />
		<small>(полный текст, описывающий данный раздел)</small>
		<textarea name="<?=$NODE_ID?>[save_section][text]" cols="20" rows="8" class="common wysiwyg"><?=$data["text"]?></textarea></p>
	<p><input type="submit" value="Сохранить изменения" /> <input type="reset" value="Сброс" /> <input type="submit" name="<?=$NODE_ID?>[cancel]" value="Отмена" /></p>
</form>
<?php
			}


			elseif ($MODULE_OUTPUT["display_variant"] == "add_item")
			{
				$data = $MODULE_OUTPUT["form_data"];
?>
<div style="clear: both"></div>
<a name="form"></a>

<? if (isset($_GET["test"])) { ?>
<h2>Выберите файлы для загрузки</h2>
	<form id="file_upload_form">
		<div id="queue"></div>
		<input type="hidden" name="MAX_FILE_SIZE" value="<?=$MODULE_OUTPUT["input_file_max_size"]?>" />
	<input type="hidden" id="upload_form_file_section_id" name="<?=$NODE_ID?>[add_item][section_id]" value="<?=$data["section_id"]?>" />
			<small>(при помощи кнопки обзора выберите файл размером не&nbsp;более <?php echo CF::FormatFilesize($MODULE_OUTPUT["input_file_max_size"]); ?>)</small></p>
	<p><label class="block wide"><strong>Позиция:</strong></label> <input id="upload_form_file_pos" type="text" name="<?=$NODE_ID?>[add_item][pos]" value="<?=$data["pos"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label class="block wide"><strong>Краткое описание:</strong></label> <input id="upload_form_file_descr" type="text" name="<?=$NODE_ID?>[add_item][descr]" value="<?=$data["descr"]?>" class="block text" /><div class="pusher"></div></p>
		<textarea id="upload_form_file_text" name="<?=$NODE_ID?>[add_item][text]" cols="20" rows="8" class="common wysiwyg"><?=$data["text"]?></textarea></p>
	
		<input id="file_upload" name="file_upload" type="file" multiple="true">
		<input type="button" value="Отмена" id="upload_cancel" />
		
	</form>
	<script>
	jQuery(document).ready(
		function($) {
			InitMultiUploader('file_upload_form', {'cancelElem': 'upload_cancel', 'postElems': ["MAX_FILE_SIZE", "<?=$NODE_ID?>[add_item][section_id]", "<?=$NODE_ID?>[add_item][pos]", "<?=$NODE_ID?>[add_item][descr]", {"<?=$NODE_ID?>[add_item][text]": function () {return tinyMCE.activeEditor.getContent()} } ] });
		}
	);
	</script>
	<div id="container_id"></div> 
<? } else {?>

<h2>Добавление файла</h2>
<?php

				if ($MODULE_OUTPUT["messages"]["bad"])
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

?>
<form action="<?=$EE["unqueried_uri"]?>" method="post" enctype="multipart/form-data">
	<input type="hidden" name="MAX_FILE_SIZE" value="<?=$MODULE_OUTPUT["input_file_max_size"]?>" />
	<input type="hidden" name="<?=$NODE_ID?>[add_item][section_id]" value="<?=$data["section_id"]?>" />
	<p><label class="block wide"><strong>Выбор файла<span class="hint" title="Обязательное для заполнения поле">*</span>:</strong></label> <input type="file" name="<?=$NODE_ID?>_file" class="block" /><div class="pusher"></div>
		<small>(при помощи кнопки обзора выберите файл размером не&nbsp;более <?php echo CF::FormatFilesize($MODULE_OUTPUT["input_file_max_size"]); ?>)</small></p>
	<p><label class="block wide"><strong>Позиция:</strong></label> <input type="text" name="<?=$NODE_ID?>[add_item][pos]" value="<?=$data["pos"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label class="block wide"><strong>Краткое описание:</strong></label> <input type="text" name="<?=$NODE_ID?>[add_item][descr]" value="<?=$data["descr"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label><strong>Описание:</strong></label><br />
		<small>(небольшой текст, описывающий данный файл)</small>
		<textarea name="<?=$NODE_ID?>[add_item][text]" cols="20" rows="8" class="common wysiwyg"><?=$data["text"]?></textarea></p>
	<p><input type="submit" value="Добавить файл" /> <input type="submit" name="<?=$NODE_ID?>[cancel]" value="Отмена" /></p>
</form>
<?php }
			}


			elseif ($MODULE_OUTPUT["display_variant"] == "edit_item")
			{
				$data = $MODULE_OUTPUT["form_data"];
?>
<div style="clear: both"></div>
<a name="form"></a>
<h2>Редактирование свойств файла</h2>
<?php

				if ($MODULE_OUTPUT["messages"]["bad"])
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

?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<input type="hidden" name="<?=$NODE_ID?>[save_item][id]" value="<?=$data["id"]?>" />
	<input type="hidden" name="<?=$NODE_ID?>[save_item][section_id]" value="<?=$data["section_id"]?>" />
	<p><label class="block wide"><strong>Позиция:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_item][pos]" value="<?=$data["pos"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label class="block wide"><strong>Краткое описание:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_item][descr]" value="<?=$data["descr"]?>" class="block text" /><div class="pusher"></div></p>
	<p><label><strong>Описание:</strong></label><br />
		<small>(небольшой текст, описывающий данный файл)</small>
		<textarea name="<?=$NODE_ID?>[save_item][text]" cols="20" rows="8" class="common wysiwyg"><?=$data["text"]?></textarea></p>
	<p><input type="submit" value="Сохранить изменения" /> <input type="reset" value="Сброс" /> <input type="submit" name="<?=$NODE_ID?>[cancel]" value="Отмена" /></p>
</form>
<?php
			}
		}

		break;

	case "announce": {
		$data = $MODULE_OUTPUT["section_data"];
		if ($data["items"] || $MODULE_OUTPUT["manage_access"]) { ?>
	<div class="gallery-photos">
		<ul>
<?php 		foreach ($data["items"] as $key2 => $data2) { ?>
			<li>
<?php		$title = $alt = CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])).": ".$LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"];
			if ($data2["filesize"]) {
				$title .= ' ('.CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]).')';
			}
			$alt .= " (".CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]).")";
			if ($data2["is_image"]) { ?>
				<div class="gallery-item">
					<a href="<?=$data2["output_files"][1]?>" onclick="return hs.expand(this)"<?=(CF::IsNonEmptyStr($title) ? ' title="'.$title.'"' : '')?>>
						<img src="<?=$data2["output_files"][2]?>" alt="<?=(CF::IsNonEmptyStr($alt) ? $alt : '')?>" />
					</a>
				</div>
<?php 			} else { ?>
				<div class="gallery-item">
					<a href="<?=$data2["output_files"][1]?>"<?=(CF::IsNonEmptyStr($title) ? ' title="'.$title.'"' : '')?>>
						<img src="<?=$data["output_files"][2]?>" alt="<?=(CF::IsNonEmptyStr($alt) ? $alt : '')?>" />
					</a>
				</div>
<?php 			}
				if(CF::IsNonEmptyStr($data2['section_name'])) { ?>
				<div  class="gallery-href-cont">
					<div>
						<a href="<?=$data2['section_uri']?>/"><?=$data2['section_name']?></a>
						<span class="small">(<?=$data2['icount']?>)</span>
					</div>
				</div>
<?php			} ?>			
			</li>
<?php  		} ?>
		</ul>
	</div> 
<?php 	}
	}
	break;

	case "idpo_announce": {
		$data = $MODULE_OUTPUT["section_data"];
		if ($data["items"] || $MODULE_OUTPUT["manage_access"]) { ?>
	<div class="gallery-photos gallery_animate_announce">
		<ul>
<?php 		foreach ($data["items"] as $key2 => $data2) { ?>
			<li class="inline-block">
<?php		$title = $alt = CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])).": ".$LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"];
			if ($data2["filesize"]) {
				$title .= ' ('.CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]).')';
			}
			$alt .= " (".CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]).")";
			if ($data2["is_image"]) { ?>
				<div class="gallery-item">
					<a href="<?=$data2["output_files"][1]?>" onclick="return hs.expand(this)"<?=(CF::IsNonEmptyStr($title) ? ' title="'.$title.'"' : '')?>>
						<em></em>
						<img src="<?=$data2["output_files"][2]?>" alt="<?=(CF::IsNonEmptyStr($alt) ? $alt : '')?>" />
					</a>
				</div>
<?php 			} else { ?>
				<div class="gallery-item">
					<a href="<?=$data2["output_files"][1]?>"<?=(CF::IsNonEmptyStr($title) ? ' title="'.$title.'"' : '')?>>
						<img src="<?=$data["output_files"][2]?>" alt="<?=(CF::IsNonEmptyStr($alt) ? $alt : '')?>" />
					</a>
				</div>
<?php 			}
				if(CF::IsNonEmptyStr($data2['section_name'])) { ?>
				<div  class="gallery-href-cont">
					<div>
						<a href="<?=$data2['section_uri']?>/"><?=$data2['section_name']?></a>
						<span class="small">(<?=$data2['icount']?>)</span>
					</div>
				</div>
<?php			} ?>			
			</li>
<?php  		} ?>
		</ul>
		<script>jQuery(document).ready(function($) {IDPOGallery(<?=$MODULE_OUTPUT['module_id']?>);});</script>
	</div> 
<?php 	}
	}
	break;
	
	case "last":

		$data = $MODULE_OUTPUT["section_data"];
		/*<h2 class="wide"><a href="<?=$data["link"]?>"><?=$data["title"]?></a>
	<div class="sub"><?=$data["descr"]?></div></h2>*/

		if ($data["items"] || $MODULE_OUTPUT["manage_access"])
		{
?>

<div class="gallery-photos">
<?php

		foreach ($data["items"] as $key2 => $data2)
		{
			if ($data2["is_image"])
			{
?>
	<div class="gallery-item"><a href="<?=$data2["output_files"][1]?>" onclick="return hs.expand(this)" title="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)"><img src="<?=$data2["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" /></a><div class="pusher"></div><?php
			}

			else
			{
?>
	<div class="gallery-item"><a href="<?=$data2["output_files"][1]?>" title="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["download_descr"]) : $LANGUAGE["gallery"]["download_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)"><img src="<?=$data["output_files"][2]?>" alt="<?php echo CF::IsNonEmptyStr($data2["descr"]) ? (htmlspecialchars(strip_tags($data2["descr"])) . ": " . $LANGUAGE["gallery"]["enlarge_descr"]) : $LANGUAGE["gallery"]["enlarge_descr2"]; ?> (<?php echo CF::FormatFilesize($data2["filesize"], $LANGUAGE["gallery"]["filesize"]); ?>)" /></a><div class="pusher"></div><?php
			}
			
			echo "\n\t\t\t<small>{$data2["descr"]}";
			if(!empty($data2["text"]))
			{
				/*if(!empty($data2["descr"]))
					echo ", ";*/
				echo "\n<br /><a href=\"/detail/" . $data2["id"] . "/\">подробнее</a>";
				/*echo "
			<small>{$data["descr"]} (", CF::FormatFilesize($data["filesize"], $LANGUAGE["gallery"]["filesize"]), ")</small>\n";    */
			};
			echo "</small>\n";
			
			echo "</div>\n";
	?>
<?php
		}
?>
<div class="pusher"></div></div>
<?php
		}
	break;
	
	case "detail": {
		//CF::Debug(
		$data = $MODULE_OUTPUT["item_data"]; //);
		echo "<h1>". $data["descr"] ."</h1>";
		echo $data["text"];
	}
	break;
	
}

	
?>