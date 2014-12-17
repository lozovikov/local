<?php
// version: 1.3
// date: 2014-07-07

$MODULE_MESSAGES = array(
	301 => "Не указана программа",
	302 => "Не указано имя",
	303 => "Код подтверждения устарел. Пожалуйста, введите его заново",
	304 => "Не&nbsp;указан код подтверждения",
	305 => "Неверно указан код подтверждения",
	306 => "Не&nbsp;указан E-mail",
	
	);

if ($MODULE_OUTPUT["display_variant"] == "request_ok")
{
?>
<p class="pusher">Ваша заявка была успешно зарегистрирована. На указанный Вами адрес электронной почты отправлено письмо-подтверждение.</p>
<?php
}

elseif ($MODULE_OUTPUT["display_variant"] == "request_fail")
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
<h3 class="red">Форма заявки заполнена неверно</h3>
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
		
		case "requests_list": 
			if (isset($MODULE_OUTPUT["requests"]) && !empty($MODULE_OUTPUT["requests"])) {
			?>
			<h2>Список заявок</h2>
			<table border=1 cellpadding=10>
				<tr>
					<th>№</th><th>ФИО</th><th>Программа</th><th>Телефон</th><th>Комментарий</th><th>Дата</th><?php if($MODULE_OUTPUT["delete"]) { ?><th></th><?php } ?>
				</tr>
			<?php 
		 		foreach($MODULE_OUTPUT["requests"] as $ind=>$req) {
					
		 	?>
		 		<tr>
		 			<td><?=($ind+1).". "?></td>
		 			<td><?=$req["name"]?></td>
		 			<td><?=$MODULE_OUTPUT["programs"][$req["program"]]?></td>
		 			<td><?=$req["phone"]?></td>
		 			<td><?=$req["request_text"]?></td>
					<td><?
					$ccdate= explode("-", $req["date_request"]);
					if($ccdate[2]==0){ echo "-";}else{
					echo $ccdate[2].'.'.$ccdate[1].'.'.$ccdate[0];}
						?>
					
					
					</td>   
		 			<?php if($MODULE_OUTPUT["delete"]) { ?><td><a href="<?=$EE["engine_uri"]?>?del=<?php echo $req["id"];?>" onclick="return confirm('Вы уверены, что хотите удалить заявку? ');"><img src="/themes/images/delete.png" title="Удалить" /></a></td><?php } ?>
		 		</tr>
		 	<?php 
				}
			?>
			</table>
			<?php 
			} 
		break;
		
		case "list_magazine_requests":
			if (isset($MODULE_OUTPUT["requests"]) && !empty($MODULE_OUTPUT["requests"])) {
			?>
			<h2>Список заявок</h2>
			<table border=1 cellpadding=10>
				<tr>
					<th>№</th>
					<th>ФИО</th>
					<th>Период</th>
					<th>Email</th>
					<th>Телефон</th>
					<th>Тип лица</th>
					<th>Оплата</th>
				</tr>
			<?php 
		 		foreach($MODULE_OUTPUT["requests"] as $ind=>$req) {
		 	?>
		 		<tr>
		 			<td><?=($ind+1).". "?></td>
		 			<td><?=$req["name"]?></td>
		 			<td><?=$req["period"]?></td>
		 			<td><?=$req["email"]?></td>
		 			<td><?=$req["phone"]?></td>
		 			<td><?=$req["type"]?></td>
		 			<td><?=$req["payment"]?></td>
		 		</tr>
		 	<?php 
				}
			?>
			</table>
			<?php 
			} 
		break;
	
		case "user_request":
		?>
		<h1>Записаться на курсы</h1>
		<hr />
		
		<p><strong>Все поля со звёздочками являются обязательными для заполнения.</strong></p>
		<form  id="save_request" name="<?=$NODE_ID?>[save_request]" action="<?=$EE["unqueried_uri"]?>" method="post">
		
		<h2>Программа<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="Обязательное для заполнения поле">*</span><? } ?>:</h2>
			<select id="program" name="<?=$NODE_ID?>[save_request][program]" size="1">
			<?
			if (isset($MODULE_OUTPUT["programs"]) && !empty($MODULE_OUTPUT["programs"]))
			foreach ($MODULE_OUTPUT["programs"] as $ind=>$program) {
			?>
					<option value="<?=$ind?>"<? if ($MODULE_OUTPUT["form_data"]["program_id"] == $ind) { ?> selected="selected"<? } ?>><?=$program?></option>
			<? } ?>
			</select>
		<h2>Имя<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>" class="text" />
		<h2>Адрес электронной почты<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][email]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["email"])?>" class="text" />
		<h2>Телефон:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>" class="text" />
		<h2>Описание запроса:</h2>
		<textarea name="<?=$NODE_ID?>[save_request][text]" class="text" ><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["text"])?></textarea>
	
			
		<h2>Код подтверждения<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
		<small >Пожалуйста, введите цифровой код, указанный на&nbsp;картинке.</small><br /><br />
			
		<input name="<?=$NODE_ID?>[code]" maxlength="5" value="" class="code block" />
		<img src="<?=$MODULE_OUTPUT["captcha_uri"]?>" alt="" class="block" style="vertical-align:middle;" valign="middle"/>
					
		<p class="pusher"></p>
		<input type="submit" value="Отправить заявку" /> 
		
		</form><br /><br />
		
<?php
		break;
		
		case "magazine_request":
		?>
		<h1>Приобрести научный журнал
«Профессиональное образование в современном мире»</h1>
		<hr />
		
		<p><strong>Все поля со звёздочками являются обязательными для заполнения.</strong></p>
		<form  id="save_request" name="<?=$NODE_ID?>[save_request]" action="<?=$EE["unqueried_uri"]?>" method="post">
		<h2>Период</h2>
		<select name="<?=$NODE_ID?>[save_request][period]">
		<option value="Полугодие">Полугодие</option>
		<option value="Год">Год</option>
		</select>
		<h2>Имя<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>" class="text" />
		<h2>Адрес электронной почты<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][email]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["email"])?>" class="text" />
		<h2>Телефон:</h2>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_request][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>" class="text" />
		<h2>Тип клиента</h2>
		<select name="<?=$NODE_ID?>[save_request][type]" />
		<option value="Физическое лицо">Физическое лицо</option>
		<option value="Юридическое лицо">Юридическое лицо</option>
		</select>
		<h2>Оплата</h2>
		<select name="<?=$NODE_ID?>[save_request][payment]" />
		<option value="Сформировать счёт">Сформировать счет</option>
		<option value="Квитанция об оплате">Квитанция об оплате</option>
		</select>
		<h2>Код подтверждения<span class="obligatorily" title="Обязательное для заполнения поле">*</span>:</h2>
				<small >Пожалуйста, введите цифровой код, указанный на&nbsp;картинке.</small><br /><br />
					
				<input name="<?=$NODE_ID?>[code]" maxlength="5" value="" class="code block" />
				<img src="<?=$MODULE_OUTPUT["captcha_uri"]?>" alt="" class="block" style="vertical-align:middle;" valign="middle"/>
							
				<p class="pusher"></p>
		<input type="submit" value="Отправить заявку" /> 
		
		</form><br /><br />
		<?php 
		break; 
		
			
		default:

		break;
	}

}

?>

