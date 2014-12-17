<?php

$MODULE_MESSAGES = array(
	301 => "Не указана фамилия",
	302 => "Не указано имя",
	303 => "Не указано отчество",
	304 => "Не указана дата отправки",
	305 => "Не указан номер почтового отправления",
	306 => "Не указан оператор почтовой связи",
	307 => "Не указан мобильный телефон",
	308 => "Не указан e-mail",
	309 => "Не указан домашний телефон",
	310 => "Не указано место жительства",
	311 => "Не указана первая специальность",
	401 => "У вас нет права на удаление заявкок"
	);

if ($MODULE_OUTPUT["display_variant"] == "send_ok")
{
?>
<h3>Сообщение отправлено!</h3>
<p class="pusher">Ваше сообщение отправлено успешно. При необходимости с&nbsp;вами свяжется наш специалист.</p>
<?php
}

elseif ($MODULE_OUTPUT["display_variant"] == "send_fail")
{
?>
<h3 class="red">Ошибка отправки сообщения</h3>
<p class="pusher">Форма сообщения была заполнено верно, но&nbsp;при его отправке произошла непредвиденная проблема. Пожалуйста, обратитесь к&nbsp;администратору сайта. Приносим извинения за&nbsp;доставленные неудобства.</p>
<?php
}


else
{
	if ($MODULE_OUTPUT["display_variant"] == "form_fill_error")
	{
?>
<h3 class="red">Форма сообщения заполнена неверно</h3>
<p class="pusher">Пожалуйста, исправьте ошибки заполнения:</p>
<?php

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
			echo "<ul>\n";

			foreach ($array as $elem)
			{
				echo "	<li>$elem</li>\n";
			}

			echo "</ul>\n";
		}

	}
	
	switch ($MODULE_OUTPUT["mode"]) {		
		case "abit":
		?>
    <script>jQuery(document).ready(function($) {InputCalendar();});</script>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<p class="pusher"><label class="block"><strong>Фамилия<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][last_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["last_name"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["last_name"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["last_name"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>Ваше имя<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["name"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["name"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>Ваше отчество<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][patronymic]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["patronymic"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["patronymic"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["patronymic"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>Мобильный телефон:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][cell_phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["cell_phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["cell_phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["cell_phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>Домашний телефон:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>E-mail<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][email]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["email"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["email"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["email"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>Место жительства<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][address]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["address"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["address"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["address"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>Специальность 1<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality1]" size="1">
		<option value="0">Не выбрана</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality1"] == $spec["code"]) { ?> selected="selected"<? } ?>><?=$spec["name"]?><?php if($spec['qual_name']) { ?> (<?=$spec['qual_name'];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
		<p class="pusher"><label class="block"><strong>Специальность 2:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality2]" size="1">
		<option value="0">Не выбрана</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality2"] == $spec["code"]) { ?> selected="selected"<? } ?> data-code="<?=$spec["code"];?>"><?=$spec["name"]?><?php if($spec["qual_name"]) { ?> (<?=$spec["qual_name"];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
		<p class="pusher"><label class="block"><strong>Специальность 3:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality3]" size="1">
		<option value="0">Не выбрана</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality3"] == $spec["code"]) { ?> selected="selected"<? } ?>><?=$spec["name"]?><?php if($spec['qual_name']) { ?> (<?=$spec['qual_name'];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
	<p><b>Почтовое отправление:</b></p>
	<p class="pusher"><label class="block"><strong>Дата отправки (гггг-мм-дд)<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="date_time" name="<?=$NODE_ID?>[send_message][senddate]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["senddate"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["senddate"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["senddate"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>№<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][sendnumber]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["sendnumber"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["sendnumber"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["sendnumber"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>Наименование оператора почтовой связи <small><span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][postoffice]" id="postoffice" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["postoffice"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["postoffice"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["postoffice"]}\"" : ""; ?> class="text" /><br />
		(например: <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">Почта России</a>, <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">DHL</a>, <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">Экспресс-почта "Энергия"</a>)</small></p>
	<p class="pusher"><label class="block"><strong>Опись документов<span class="hint red" title="Обязательное для заполнения поле">*</span>:</strong></label><br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_zayav]"> Заявление<br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_ege]"> Копия свидетельства о результатах ЕГЭ<br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_passport]"> Копия паспорта<br />
		<input type="text" class="gorod" name="spamcheck">
		</p>
	<p class="pusher"><label class="block"><strong>Другие документы:</strong></label><br />
		<textarea name="<?=$NODE_ID?>[send_message][otherdocs]" cols="45" rows="5" class="common"><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["otherdocs"])?></textarea></p>
	<p class="pusher"><input type="submit" value="Отправить" /></p>
</form><br /><br /><? if($MODULE_OUTPUT["allow_handle"]) { ?><a href="manage/">Управление заявками</a><br /><a href="list/">Список заявок</a><? } ?>
<?php
		break;
		
		case "applies_manage":
		
		if (isset($MODULE_OUTPUT["applies"]))
			foreach ($MODULE_OUTPUT["applies"] as $apply) {
				?><b>ФИО:</b> <?=$apply["last_name"]?> <?=$apply["name"]?> <?=$apply["patronymic"]?><br />
				<b>Домашний телефон:</b> <?=$apply["phone"]?><br />
				<b>Мобильный телефон:</b> <?=$apply["cell_phone"]?><br />
				<b>E-mail:</b> <?=$apply["email"]?><br />
				<b>Место жительства:</b> <?=$apply["address"]?><br />
				<b>Дата отправки:</b> <?=$apply["senddate"]?><br />
				<b>Номер почтового отправления:</b> <?=$apply["sendnumber"]?><br />
				<b>Название отделения связи:</b> <?=$apply["postoffice"]?><br />
				<b>Специальность 1:</b> <?php if($apply["code1"]) { ?><?=$apply["spec_name1"];?> <?php if($apply["qual_name1"]) { ?> (<?=$apply["qual_name1"];?>)<?php } ?><?php } else { ?><?=$apply["speciality1"]?><?php } ?><br />
				<? if ($apply["speciality2"]) { ?>
        <b>Специальность 2:</b> <?php if($apply["code2"]) { ?><?=$apply["spec_name2"];?> <?php if($apply["qual_name2"]) { ?> (<?=$apply["qual_name2"];?>)<?php } ?><?php } else { ?><?=$apply["speciality2"]?><?php } ?><br />
        <? } ?>
				<? if ($apply["speciality3"]) { ?>
        <b>Специальность 3:</b> <?php if($apply["code3"]) { ?><?=$apply["spec_name3"];?> <?php if($apply["qual_name3"]) { ?> (<?=$apply["qual_name3"];?>)<?php } ?><?php } else { ?><?=$apply["speciality3"]?><?php } ?><br />
        <? } ?>
				<b>Опись документов:</b> <? if ($apply["is_zayav"]) { ?>Заявление.<? } ?><? if ($apply["is_ege"]) { ?> Копия свидетельства о результатах ЕГЭ.<? } ?><? if ($apply["is_passport"]) { ?> Копия паспорта.<? } ?><br />
				<? if ($apply["otherdocs"]) { ?><b>Другие документы:</b> <?=$apply["otherdocs"]?><br /><? } ?>
				<form action="./" method="post">
				<input type="hidden" name="edit_apply_id" value="<?=$apply["id"]?>">
				<b>Статус:</b> <select name="status_id" size="1">
				<? foreach ($MODULE_OUTPUT["statuses"] as $status) { ?>
				<option value="<?=$status["id"]?>" <? if ($apply["status_id"] == $status["id"]) { ?>selected="selected"<? } ?>><?=$status["title"]?></option>
				<? } ?>
				</select><br />
				<b>Замечания:</b> <textarea cols="30" rows="4" wrap="virtual" name="notices"><?=$apply["notices"]?></textarea><br />
				<input type="submit" value="Сохранить">
				</form><br/>
				<? if($MODULE_OUTPUT["allow_delete"]) { ?><a href="../delete/<?=$apply["id"]?>/" onclick="if(!confirm('Вы уверены, что хотите удалить данную заявку?')) return false;">Удалить</a><? } ?>
				<hr />
				<?
			}
		
		break;
		
		case "one_apply":
			$apply = $MODULE_OUTPUT["apply"];
			if (!empty($apply)) {
		?>
				<b>ФИО:</b> <?=$apply["last_name"]?> <?=$apply["name"]?> <?=$apply["patronymic"]?><br />
				<b>Домашний телефон:</b> <?=$apply["phone"]?><br />
				<b>Мобильный телефон:</b> <?=$apply["cell_phone"]?><br />
				<b>E-mail:</b> <?=$apply["email"]?><br />
				<b>Место жительства:</b> <?=$apply["address"]?><br />
				<b>Дата отправки:</b> <?=$apply["senddate"]?><br />
				<b>Номер почтового отправления:</b> <?=$apply["sendnumber"]?><br />
				<b>Название отделения связи:</b> <?=$apply["postoffice"]?><br />
				<b>Специальность 1:</b> <?php if($apply["code1"]) { ?><?=$apply["spec_name1"];?> <?php if($apply["qual_name1"]) { ?> (<?=$apply["qual_name1"];?>)<?php } ?><?php } else { ?><?=$apply["speciality1"]?><?php } ?><br />
				<? if ($apply["speciality2"]) { ?>
        <b>Специальность 2:</b> <?php if($apply["code2"]) { ?><?=$apply["spec_name2"];?> <?php if($apply["qual_name2"]) { ?> (<?=$apply["qual_name2"];?>)<?php } ?><?php } else { ?><?=$apply["speciality2"]?><?php } ?><br />
        <? } ?>
				<? if ($apply["speciality3"]) { ?>
        <b>Специальность 3:</b> <?php if($apply["code3"]) { ?><?=$apply["spec_name3"];?> <?php if($apply["qual_name3"]) { ?> (<?=$apply["qual_name3"];?>)<?php } ?><?php } else { ?><?=$apply["speciality3"]?><?php } ?><br />
        <? } ?>
				<b>Опись документов:</b> <? if ($apply["is_zayav"]) { ?>Заявление.<? } ?><? if ($apply["is_ege"]) { ?> Копия свидетельства о результатах ЕГЭ.<? } ?><? if ($apply["is_passport"]) { ?> Копия паспорта.<? } ?><br />
				<? if ($apply["otherdocs"]) { ?><b>Другие документы:</b> <?=$apply["otherdocs"]?><br /><? } ?>
				<form action="<?php echo $EE["engine_uri"];?>manage/" method="post">
				<input type="hidden" name="edit_apply_id" value="<?=$apply["id"]?>">
				<b>Статус:</b>
        <? if($MODULE_OUTPUT["allow_handle"]) { ?>
        <select name="status_id" size="1">
				<? foreach ($MODULE_OUTPUT["statuses"] as $status) { ?>
				<option value="<?=$status["id"]?>" <? if ($apply["status_id"] == $status["id"]) { ?>selected="selected"<? } ?>><?=$status["title"]?></option>
				<? } ?>
				</select>
        <?php } else { ?>
				<? foreach ($MODULE_OUTPUT["statuses"] as $status) {
				if ($apply["status_id"] == $status["id"]) echo $status["title"];
				}
				if (!$apply["status_id"]) echo "Ожидается";
				?>
        <?php } ?>
				<br />
				<b>Замечания:</b> <? if($MODULE_OUTPUT["allow_handle"]) { ?>
        <textarea cols="30" rows="4" wrap="virtual" name="notices"><?=$apply["notices"]?></textarea>
        <?php } else { ?><?=$apply["notices"]?>
        <?php } ?><br />
        <? if($MODULE_OUTPUT["allow_handle"]) { ?>
        <input type="submit" value="Сохранить"><br />
        <?php } ?>
        <? if($MODULE_OUTPUT["allow_handle"]) { ?><br /><a href="<?php echo $EE["engine_uri"];?>manage/">Управление заявками</a><br /><a href="<?php echo $EE["engine_uri"];?>list/">Список заявок</a><? } ?>
		<?
			}
			else { ?>Запись не найдена.<? }
		break;
		
		case "applies_list":
			?>
			<table width="100%" id="applies">
				<tr align="left">
					<th>ФИО</th>
					<th>Дата отправки</th>
					<th>Статус</th>
				</tr>
				<?
				if (isset($MODULE_OUTPUT["applies"]))
				foreach ($MODULE_OUTPUT["applies"] as $apply) {
				?><tr><td><a href="<?php echo $EE["engine_uri"];?>show/<?=$apply["id"];?>"><?=$apply["last_name"]?> <?=$apply["name"]?> <?=$apply["patronymic"]?></a></td>
				<td><?=$apply["senddate"]?></td>
				<td>
					<? foreach ($MODULE_OUTPUT["statuses"] as $status) {
					if ($apply["status_id"] == $status["id"]) echo $status["title"];
					}
					if (!$apply["status_id"]) echo "Ожидается";
				?>
			</td></tr>
			<?
			}
			?></table>
      <? if($MODULE_OUTPUT["allow_handle"]) { ?><br /><a href="<?php echo $EE["engine_uri"];?>manage/">Управление заявками</a><br /><? } ?>
      <?
		break;
	
		default:

		break;
	}

}

?>