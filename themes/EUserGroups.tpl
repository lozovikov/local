<?php

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

if (ALLOW_AUTH && $MODULE_DATA["output"]["allow_handle"])
{
	switch ($MODULE_DATA["output"]["mode"])
	{
		case "all_groups":
			?>
			<h2>Группы пользователей</h2><p><?
			foreach ($MODULE_DATA["output"]["groups"] as $group) {
				?><a href="<?=$EE["unqueried_uri"]?>userslist/<?=$group["id"]?>/"><?=$group["comment"]?></a> (<?=$group["num_users"]?>) <a href="<?=$EE["unqueried_uri"]?>edit/<?=$group["id"]?>/"><img src="/themes/images/edit.png" border="0" title="Редактировать"></a> <a href="<?=$EE["unqueried_uri"]?>delete/<?=$group["id"]?>/" onclick="if(!confirm('Вы действительно хотите удалить группу пользователей <?=$group["comment"]?>?')) return false;"><img src="/themes/images/delete.png" border="0" title="Удалить"></a><br /><?
			}
			
			?></p><br /><h2>Добавление группы</h2>
			<p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<!--<p>Название группы пользователей (латиница):<br />
			<input type="text" name="group_name"></p>-->
			<p>Название:<br />
			<input type="text" name="group_comment" class="input_long"></p>
			<p><input type="submit" value="Готово"></p>
			</form>
			</p><?
			break;
			
		case "edit_group":
		?>
			<h2>Редактирование группы пользователей</h2>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<!--<p>Название группы пользователей (латиница):<br />
			<input type="text" name="group_name" value="<?=$MODULE_DATA["output"]["edit_group"]["name"]?>"></p>-->
			<p>Название:<br />
			<input type="text" name="group_comment" value="<?=$MODULE_DATA["output"]["edit_group"]["comment"]?>" class="input_long"></p>
			<p><input type="submit" value="Готово"></p>
			</form>
		<?
			break;
			
		case "userslist":
			if (isset($MODULE_DATA["output"]["users"]) && sizeof($MODULE_DATA["output"]["users"])) {
		?>
			<h2>Список пользователей группы "<?=$MODULE_DATA["output"]["group"]["comment"]?>"<a href="<?=$EE["engine_uri"]?>edit/<?=$MODULE_DATA["output"]["group"]["id"]?>/"><img src="/themes/images/edit.png" border="0" title="Редактировать"></a></h2>
			
			<?
			foreach ($MODULE_DATA["output"]["users"] as $user) {
				$dt = explode(" ", $user["create_time"]);
				$parts = explode("-", $dt[0]);

				$cdate = $parts[2].".".$parts[1].".".$parts[0];
				?><span<? echo $user["is_active"] ? "" : " class=\"user_inactive\""; ?>><?=$user["displayed_name"]?></span> <font color="#777"<?php if($user["last_login_time"]) { ?> title="Последний вход: <?=$user["last_login_time"]?>, IP: <?=$user["last_ip"]?>"<?php } ?>>(добавлен <?=$cdate?>)</font><a href="<?=$EE["unqueried_uri"]?>edit/<?=$user["id"]?>/"><img src="/themes/images/edit.png" border="0" title="Редактировать"></a> <a href="<?=$EE["unqueried_uri"]?>delete/<?=$user["id"]?>/" onclick="if(!confirm('Вы действительно хотите удалить пользователя <?=$user["displayed_name"]?>?')) return false;"><img src="/themes/images/delete.png" border="0"></a><?php if($MODULE_DATA["output"]["loginas"] && $user["is_active"]) { ?><?php /*?><a href="<?=$EE["unqueried_uri"]?>loginas/<?=$user["id"]?>/">Зайти как пользователь</a><?php */ ?> <a href="<?=$EE["unqueried_uri"]?>?<?=$_SESSION['private_node_id'];?>[loginas]=<?=$user["id"]?>">Зайти как пользователь</a><?php } ?><br /><?
			}
			}
			?><br /><br /><h2>Добавление нового пользователя</h2><p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>Отображаемое имя:<br />
			<input type="text" name="displayed_name" value="<?=$MODULE_DATA["output"]["displayed_name"]?>"></p>
			<p>Логин:<br />
			<input type="text" name="username" value="<?=$MODULE_DATA["output"]["username"]?>" autocomplete="off"></p>
			<p>Пароль:<br />
			<input type="password" name="pass" autocomplete="off"></p>
			<p>Повторите пароль:<br />
			<input type="password" name="repass" autocomplete="off"></p>
			<p>E-mail:<br />
			<input type="text" name="email" value="<?=$MODULE_DATA["output"]["email"]?>"></p>
			<input type="hidden" name="usergroup_id" value="<?=$MODULE_DATA["output"]["group"]["id"]?>">
			<p><input type="submit" value="Готово"></p>
			</form>
			</p><?	

			break;
			
		case "edit_user":
			?><br /><br /><h2>Редактирование пользователя</h2><p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>Отображаемое имя:<br />
			<input type="text" name="displayed_name" value="<?=$MODULE_DATA["output"]["edit_user"]["displayed_name"]?>"></p>
			<p><select name="new_usergroup_id" size="1"><?
			foreach ($MODULE_DATA["output"]["groups"] as $group) {
				?><option value="<?=$group["id"]?>"<? if($group["id"]==$MODULE_DATA["output"]["edit_user"]["usergroup_id"]) { ?> selected<? } ?>><?=$group["comment"]?></option><?
			} ?>
			</select>
			<p>Логин:<br />
			<input type="text" name="username" value="<?=$MODULE_DATA["output"]["edit_user"]["username"]?>" autocomplete="off">
      <?php if($Engine->OperationAllowed(0, "userGroup.users.loginAs", $MODULE_DATA["output"]["edit_user"]["usergroup_id"], $Auth->usergroup_id) && $MODULE_DATA["output"]["edit_user"]["is_active"] ){?><a href="<?=$EE["unqueried_uri"]?>?<?=$_SESSION['private_node_id'];?>[loginas]=<?=$MODULE_DATA["output"]["edit_user"]["id"]?>">Зайти как пользователь</a><?php } ?></p>
			<p>Пароль (оставьте поле пустым, если не хотите менять):<br />
			<input type="password" name="pass" autocomplete="off"></p>
			<p>Повторите пароль (оставьте поле пустым, если не хотите менять):<br />
			<input type="password" name="repass" autocomplete="off"></p>
			<p>E-mail:<br />
			<input type="text" name="email" value="<?=$MODULE_DATA["output"]["edit_user"]["email"]?>"></p>
			<p><input type="checkbox" name="is_active" <? echo $MODULE_DATA["output"]["edit_user"]["is_active"] ? "checked=\"checked\"" : ""; ?>> Учётная запись активна</p>
			<input type="hidden" name="usergroup_id" value="<?=$MODULE_DATA["output"]["group"]["id"]?>">
			<p><input type="submit" value="Готово"></p>
			</form>
			</p><?
			break;
	}
}

?>