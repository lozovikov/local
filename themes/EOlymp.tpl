<?php
// version: 1.1
// date: 2012-10-24

$MODULE_MESSAGES = array(
	301 => "Не указана фамилия",
	302 => "Не указано имя",
	303 => "Не указано отчество",
	304 => "Не указаны данные паспорта",
	305 => "Не указана дата рождения",
	306 => "Не указан адрес проживания",
	307 => "Не указано наименование учебного заведения",
	308 => "Не указана дата окончания учебного заведения",
	309 => "Не подтверждено согласие на обработку данных",
	310 => "Не указаны предметы для участия в Олимпиаде",
	311 => "Не указан логин для учётной записи",
	312 => "Не указан пароль для учётной записи",
	313 => "Не указан адрес электронной почты для учётной записи",
	314 => "Пароль и подтверждение пароля не совпадают",
	);

if ($MODULE_OUTPUT["display_variant"] == "form_ok")
{
?>
<h3>Анкета зарегистрирована!</h3>
<p class="pusher">Ваше анкета была успешно зарегистрирована.</p>
<?php
}

elseif ($MODULE_OUTPUT["display_variant"] == "form_fail")
{
?>
<h3 class="red">Ошибка регистрации</h3>
<p class="pusher">Форма анкеты была заполнено верно, но&nbsp;при ее регистрации произошла непредвиденная проблема. Пожалуйста, обратитесь в&nbsp;службу тех.поддержки сайта. Приносим извинения за&nbsp;доставленные неудобства.</p>
<?php
}


else
{
	if ($MODULE_OUTPUT["display_variant"] == "form_fill_error")
	{
?>
<h3 class="red">Форма анкеты заполнена неверно</h3>
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
		
		case "list": 
			if (isset($MODULE_OUTPUT["people"]) && !empty($MODULE_OUTPUT["people"])) {
			?>
			<h2>Список участников:</h2>
			<?php 
		 		foreach($MODULE_OUTPUT["people"] as $ind=>$pupil) {
		 	?>
		 		<?=($ind+1)?>. <?=$pupil["last_name"]." ".$pupil["name"]." ".$pupil["patronymic"]?><br />
		 	<?php 
				}
			} 
		break;
	
		case "form":
		?>
		<h1>Анкета участника Олимпиады</h1>
		<hr />
		
		<p>Все поля со звёздочками являются обязательными для заполнения.</p>
		<form onsubmit="unifyFormFields(this)" id="save_form" action="<?=$EE["unqueried_uri"]?>" method="post">
		<p class="pusher"><label class="block"><h2>Фамилия<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][last_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["last_name"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>Имя<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>Отчество<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][patronymic]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["patronymic"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>Паспорт<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		серия <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_serial]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_serial"])?>" class="text" /><br />
		номер <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_number]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_number"])?>"class="text" /><br />
		дата выдачи <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_date]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_date"])?>"class="text" /><br />
		кем выдан <input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][passport_who]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_who"])?>"class="text" /></p>
		<p class="pusher"><label class="block"><h2>Дата рождения (гггг-мм-дд)<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][dob]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["dob"])?>" class="text" /></p>
		
		<p class="pusher"><label class="block"><h2>Пол<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		<input type="radio" name="<?=$NODE_ID?>[save_form][gender]" value=1 checked="checked"> мужской<br />
		<input type="radio" name="<?=$NODE_ID?>[save_form][gender]" value=2> женский<br />
		</p>
		
		<p class="pusher"><label class="block"><h2>Гражданство<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
			<select id="citizenship" name="<?=$NODE_ID?>[save_form][citizenship]" size="1">
				<option value="0">Не выбрана</option>
			<?
			$countryInd = 0;
			if (isset($MODULE_OUTPUT["countries"]) && !empty($MODULE_OUTPUT["countries"]))
			foreach ($MODULE_OUTPUT["countries"] as $countryGroup) {
			?>
				<optgroup label="<?=$countryGroup["name"]?>">
			<? 
				foreach ($countryGroup["countries"] as $country) { 
					$countryInd++;?>
					<option value="<?=$countryInd?>"<? if ($MODULE_OUTPUT["form_data"]["citizenship"] == $countryInd) { ?> selected="selected"<? } ?>><?=$country?></option>
			<? } ?>
				</optgroup>
			<? } ?>
			</select>
		</p>
		
		<p class="pusher"><label class="block"><h2>Место жительства<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][address]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["address"])?>" class="text" /></p>
		
		<p class="pusher"><label class="block"><h2>Мобильный телефон:</h2></label>
		<input type="text" maxlength="13" class="input_long" name="<?=$NODE_ID?>[save_form][cell_phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["cell_phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["cell_phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["cell_phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><h2>Домашний телефон:</h2></label>
		<input type="text" maxlength="13" class="input_long" id="phone" name="<?=$NODE_ID?>[save_form][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["phone"]}\"" : ""; ?> class="text" /></p>
				
		<p class="pusher"><label class="block"><h2>Оканчиваемое учебное заведение<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		<input checked="checked" type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="1"> Школа
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 2) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="2"> Гимназия
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 3) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="3"> Колледж
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 4) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="4"> Лицей
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 5) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="5"> Техникум
		<br /><br />
		№ или наименование учебного заведения<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][institution_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_name"])?>" class="text" />
		</p>
		
		<p class="pusher"><label class="block"><h2>Дата окончания учебного заведения (гггг-мм-дд)<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2></label>
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][graduation_date]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["graduation_date"])?>" class="text" />
		</p>
		
		<p class="pusher"><label class="block"><h2>Предметы Олимпиады<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2></label>
			<?php
				if (!empty($MODULE_OUTPUT["subjects"]))
					foreach ($MODULE_OUTPUT["subjects"] as $ind=>$subj) { ?>
				<input type="checkbox" name="<?=$NODE_ID?>[save_form][subj][<?=$ind?>]" value="<?=$subj["id"]?>" <?=(isset($MODULE_OUTPUT["form_data"]["subj"][$ind]) ? "checked='checked'" : "") ?> ><?=$subj["name"]?></input>
			<?php } ?>
		</p>
		
		<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?>
		<p class="pusher"><label class="block"><strong>Согласен на обработку моих данных:</strong></label>
		<input type="checkbox" name="<?=$NODE_ID?>[save_form][agreed]" <?=(htmlspecialchars($MODULE_OUTPUT["form_data"]["agreed"]) ? "checked='checked'" : "") ?>/>
		</p>
		<? } ?>
				
		<hr />
		
				
		<p><br />Для регистрации введенных данных Вам необходимо создать в системе свою учетную запись.<br/>(<small>Длина логина и пароля не должна превышать 25 символов</small>)</p>
		
		<p>
		<?php include "template/user_registration_panel.html" ?>
		</p>
		
		
		</form><br /><br />
		
<?php
		break;
		
			
		default:

		break;
	}

}

?>

