<?php
// version 2.3  2012/09/11

$MODULE_MESSAGES = array(
	301 => "Формат почтового ящика неверен",
	302 => "Не указан пароль",
	303 => "Не указано ФИО владельца",
	304 => "Не указана папка",
	305 => "Не указана квота",
	306 => "Не указан домен",
	307 => "Не указан почтовый ящик",
	308 => "Пароль подтверждён неверно",
	);

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data) {
	echo "<p class=\"message\">$data</p>\n";
}

/*foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}*/

if (isset($MODULE_DATA["output"]["data"])) {
	$data = $MODULE_DATA["output"]["data"];
} else {
	$data = "";
}
	//echo isset($data["username"]) ? $data["username"] : "11111";

$array = array();

foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem) {
	if (isset($MODULE_MESSAGES[$elem])) {
		$array[] = $MODULE_MESSAGES[$elem];
	}
}

if ($array) { ?>
	<ul>
<?php
	foreach ($array as $elem) { ?>
		<li><?=$elem?></li>
<?php
	} ?>
	</ul>
<?php
}

if (isset($MODULE_DATA["output"]["mode"])) {
	switch ($MODULE_DATA["output"]["mode"]) {
		case "request": {
			if ($_SESSION["user_id"]) { ?>
	<br /><br />Если Вы получили логин и пароль для своего почтового ящика, то укажите их в разделе "Мои настройки".<br />В противном случае обратитесь к системному администратору Вашего подразделения.
<?php		}
		}
		break;
	
		case "hidden_form": {
			if ($MODULE_DATA["output"]["ml"] && $MODULE_DATA["output"]["mp"]) { ?>
	<form action="/mail/" name="mailform" id="mailform" method="post">
		<input type="hidden" name="_user_t" id="rcmloginuser" value="<?=$MODULE_DATA["output"]["ml"]?>" />
		<input type="hidden" name="_pass_t" id="rcmloginpwd" value="<?=$MODULE_DATA["output"]["mp"]?>" />
		<input type="hidden" name="_action" value="login" />
		<input type="hidden" name="_task" value="login" />
		<!--<input type="hidden" value="<?=(intval(substr(date("O"), 1, 2)))?>" id="rcmlogintz" name="_timezone" />
		<input type="hidden" value="" id="rcmloginurl" name="_url" />
		<input type="hidden" value="b432532766db6ae4dd021f4b6298bf39" name="_token" />-->
		<!--<input type="submit" value="Войти в почтовый ящик" /><br />-->
		<a onmouseover="this.style.cursor='pointer';" onclick="document.getElementById('mailform').submit();">Войти в почтовый ящик</a>
	</form>
<?php 		} else { ?>
	<a href="/mailreg/">Получить почтовый ящик</a>
<?php 		}
		}
		break;
		
		case "save_post":
		case "edit_post": { ?>
	<script src="/scripts/mailbox.js"></script>
	<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<p>
			<label class="block wide"><strong>Почтовый ящик:</strong></label>
			<input type="text" id="username" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][username]" value="<?=(isset($data["username"]) ? $data["username"] : "")?>" onblur="if (this.value!='') javascript:process(); else { document.getElementById('exists').innerHTML=''; document.getElementById('exists_short').innerHTML=''; }" />
			<select  onchange="javascript:process();" id="domain" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][domain]"><option>@nsau.edu.ru</option><option>@nripk.ru</option></select> <span id="exists"></span><span id="exists_short" style="display:none;"></span><span id="username_double" style="display:none;"><?=(isset($data["username"]) ? $data["username"] : "")?></span><br />
		</p>
		<p>
			<label class="block wide"><strong>Пароль:</strong>&nbsp;<span id="genpass"></span></label>
			<span id="copypass"><a onclick="copypass('genpass','add_pass','repeatpass');">использовать этот пароль<span id="instead"></span></a></span><br />
			<input type="password" id= "add_pass" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][password]" value="<?=(isset($data["password"]) ? $data["password"] : "")?>" />
			<a onclick="passgen('genpass',3,1,1,'add_pass');">сгенерировать пароль</a>
<?php		if ($MODULE_DATA["output"]["mode"] == "edit_post") { ?>
				<br /><small>(если не хотите менять - оставьте поле пустым)</small>
<?php 		} ?>
		</p>
		<p>
			<label class="block wide"><strong>Повторите пароль:</strong></label><br />
			<input type="password" id="repeatpass" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][repeat_password]" value="<?=(isset($data["repeat_password"]) ? $data["repeat_password"] : "")?>" /><br />
<?php 		if ($MODULE_DATA["output"]["mode"] == "edit_post") { ?>
			<small>(если не хотите менять - оставьте поле пустым)</small>
<?php 		} ?>
		</p>
		<p>
			<label class="block wide"><strong>ФИО владельца:</strong></label><br />
			<input type="text" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][name]" value="<?=(isset($data["name"]) ? $data["name"] : "")?>" />
		</p>
		<p>
			<label class="block wide"><strong>Квота:</strong></label>
<?php 		$min_quota = "300";		
			if ($MODULE_DATA["output"]["quota_handle"]) { ?>
			<input type="text" size="4" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][quota]" value="<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?>" class="block text" /> мб
		</p>
<?php 		} else { ?>
		<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?> Мб
		<input type="hidden" size="4" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][quota]" value="<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?>" />
<?php		} ?>
			<p><input type="checkbox" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][active]" <? echo isset($data["active"])&&!$data["active"] ? "" : "checked=\"checked\""; ?>> <label class="block wide"><strong>Включить</strong></label></p>
			<p><input type="submit" onclick="if (document.getElementById('exists_short').innerHTML == 'occ') { alert('Укажите свободное имя почтового ящика'); return false; }" value="<?php echo $MODULE_DATA["output"]["mode"]=="save_post" ? "Создать ящик" : "Редактировать ящик"; ?>" /></p>
		</form>
<?php	}
		break;
		
		case "list_mailboxes": { ?>
		<p>
			<b><a href="create/">Создать ящик</a></b>
		</p>
		<p>
			Сортировать по:
<?php 		if (isset($_GET["sortby"]) && $_GET["sortby"] == "name") { ?>
			<a href="?sortby=email">адресу</a> | <a href="?sortby=size">размеру</a> | владельцу 
<?php 		} else if (isset($_GET["sortby"]) && $_GET["sortby"] == "size"){ ?>
			<a href="?sortby=email">адресу</a> | размеру | <a href="?sortby=name">владельцу</a>
<?php 		} else { ?>
			адресу | <a href="?sortby=size">размеру</a> | <a href="?sortby=name">владельцу</a>
<?php		}
?>
		</p>
		<table>
<?php		foreach ($MODULE_DATA["output"]["mailboxes"] as $mailbox) { ?>
			<tr>
				<td>
					<a href="edit/<?=$mailbox["username"]?>/"><?=$mailbox["username"]?></a>
				</td>
				<td>
					<?=($mailbox["name"] ? " (".$mailbox["name"].")" : "")?>
				</td>
				<td>
					писем <?=(isset($mailbox['messages']) ? $mailbox['messages'] : "0")?>
				</td>
				<td>
					(<?=(isset($mailbox['bytes']) ? ($mailbox['bytes']/1048576 >= 1 ? floor($mailbox['bytes']/1048576)." Мб)" : ($mailbox['bytes']/1024 >= 1 ? floor($mailbox['bytes']/1024)." Кб)" : $mailbox['bytes']." б)")) : "0  б)")?>
				</td>
				<td>
					последний заход <?=$mailbox["lasttime"]?>
				</td>
				<td>
					<a href="delete/<?=$mailbox["username"]?>/" onclick="if (!confirm('Вы уверены, что хотите удалить ящик <?=$mailbox["username"]?>?')) return false;"><img src="/themes/images/delete.png" alt="" /></a>
				</td>
			</tr>
<?php 		} ?>
		</table>
<?php	}
		break;
		
		case "delete_request": { ?>
		<br />Заявка на удаление почтового ящика отправлена и будет рассмотрена системным администратором. Вы можете вернуться на <a href="/office/mailboxes/">страницу управления почтовыми ящиками</a>.
<?php	}
		break;
		
		case "checkexists": {
			echo $MODULE_DATA["output"]["exists"];
		}
		break;
		
		default: {
			
		}
		break;
	}
} ?>