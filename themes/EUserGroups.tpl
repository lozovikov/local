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
			<h2>������ �������������</h2><p><?
			foreach ($MODULE_DATA["output"]["groups"] as $group) {
				?><a href="<?=$EE["unqueried_uri"]?>userslist/<?=$group["id"]?>/"><?=$group["comment"]?></a> (<?=$group["num_users"]?>) <a href="<?=$EE["unqueried_uri"]?>edit/<?=$group["id"]?>/"><img src="/themes/images/edit.png" border="0" title="�������������"></a> <a href="<?=$EE["unqueried_uri"]?>delete/<?=$group["id"]?>/" onclick="if(!confirm('�� ������������� ������ ������� ������ ������������� <?=$group["comment"]?>?')) return false;"><img src="/themes/images/delete.png" border="0" title="�������"></a><br /><?
			}
			
			?></p><br /><h2>���������� ������</h2>
			<p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<!--<p>�������� ������ ������������� (��������):<br />
			<input type="text" name="group_name"></p>-->
			<p>��������:<br />
			<input type="text" name="group_comment" class="input_long"></p>
			<p><input type="submit" value="������"></p>
			</form>
			</p><?
			break;
			
		case "edit_group":
		?>
			<h2>�������������� ������ �������������</h2>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<!--<p>�������� ������ ������������� (��������):<br />
			<input type="text" name="group_name" value="<?=$MODULE_DATA["output"]["edit_group"]["name"]?>"></p>-->
			<p>��������:<br />
			<input type="text" name="group_comment" value="<?=$MODULE_DATA["output"]["edit_group"]["comment"]?>" class="input_long"></p>
			<p><input type="submit" value="������"></p>
			</form>
		<?
			break;
			
		case "userslist":
			if (isset($MODULE_DATA["output"]["users"]) && sizeof($MODULE_DATA["output"]["users"])) {
		?>
			<h2>������ ������������� ������ "<?=$MODULE_DATA["output"]["group"]["comment"]?>"<a href="<?=$EE["engine_uri"]?>edit/<?=$MODULE_DATA["output"]["group"]["id"]?>/"><img src="/themes/images/edit.png" border="0" title="�������������"></a></h2>
			
			<?
			foreach ($MODULE_DATA["output"]["users"] as $user) {
				$dt = explode(" ", $user["create_time"]);
				$parts = explode("-", $dt[0]);

				$cdate = $parts[2].".".$parts[1].".".$parts[0];
				?><span<? echo $user["is_active"] ? "" : " class=\"user_inactive\""; ?>><?=$user["displayed_name"]?></span> <font color="#777"<?php if($user["last_login_time"]) { ?> title="��������� ����: <?=$user["last_login_time"]?>, IP: <?=$user["last_ip"]?>"<?php } ?>>(�������� <?=$cdate?>)</font><a href="<?=$EE["unqueried_uri"]?>edit/<?=$user["id"]?>/"><img src="/themes/images/edit.png" border="0" title="�������������"></a> <a href="<?=$EE["unqueried_uri"]?>delete/<?=$user["id"]?>/" onclick="if(!confirm('�� ������������� ������ ������� ������������ <?=$user["displayed_name"]?>?')) return false;"><img src="/themes/images/delete.png" border="0"></a><?php if($MODULE_DATA["output"]["loginas"] && $user["is_active"]) { ?><?php /*?><a href="<?=$EE["unqueried_uri"]?>loginas/<?=$user["id"]?>/">����� ��� ������������</a><?php */ ?> <a href="<?=$EE["unqueried_uri"]?>?<?=$_SESSION['private_node_id'];?>[loginas]=<?=$user["id"]?>">����� ��� ������������</a><?php } ?><br /><?
			}
			}
			?><br /><br /><h2>���������� ������ ������������</h2><p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>������������ ���:<br />
			<input type="text" name="displayed_name" value="<?=$MODULE_DATA["output"]["displayed_name"]?>"></p>
			<p>�����:<br />
			<input type="text" name="username" value="<?=$MODULE_DATA["output"]["username"]?>" autocomplete="off"></p>
			<p>������:<br />
			<input type="password" name="pass" autocomplete="off"></p>
			<p>��������� ������:<br />
			<input type="password" name="repass" autocomplete="off"></p>
			<p>E-mail:<br />
			<input type="text" name="email" value="<?=$MODULE_DATA["output"]["email"]?>"></p>
			<input type="hidden" name="usergroup_id" value="<?=$MODULE_DATA["output"]["group"]["id"]?>">
			<p><input type="submit" value="������"></p>
			</form>
			</p><?	

			break;
			
		case "edit_user":
			?><br /><br /><h2>�������������� ������������</h2><p>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>������������ ���:<br />
			<input type="text" name="displayed_name" value="<?=$MODULE_DATA["output"]["edit_user"]["displayed_name"]?>"></p>
			<p><select name="new_usergroup_id" size="1"><?
			foreach ($MODULE_DATA["output"]["groups"] as $group) {
				?><option value="<?=$group["id"]?>"<? if($group["id"]==$MODULE_DATA["output"]["edit_user"]["usergroup_id"]) { ?> selected<? } ?>><?=$group["comment"]?></option><?
			} ?>
			</select>
			<p>�����:<br />
			<input type="text" name="username" value="<?=$MODULE_DATA["output"]["edit_user"]["username"]?>" autocomplete="off">
      <?php if($Engine->OperationAllowed(0, "userGroup.users.loginAs", $MODULE_DATA["output"]["edit_user"]["usergroup_id"], $Auth->usergroup_id) && $MODULE_DATA["output"]["edit_user"]["is_active"] ){?><a href="<?=$EE["unqueried_uri"]?>?<?=$_SESSION['private_node_id'];?>[loginas]=<?=$MODULE_DATA["output"]["edit_user"]["id"]?>">����� ��� ������������</a><?php } ?></p>
			<p>������ (�������� ���� ������, ���� �� ������ ������):<br />
			<input type="password" name="pass" autocomplete="off"></p>
			<p>��������� ������ (�������� ���� ������, ���� �� ������ ������):<br />
			<input type="password" name="repass" autocomplete="off"></p>
			<p>E-mail:<br />
			<input type="text" name="email" value="<?=$MODULE_DATA["output"]["edit_user"]["email"]?>"></p>
			<p><input type="checkbox" name="is_active" <? echo $MODULE_DATA["output"]["edit_user"]["is_active"] ? "checked=\"checked\"" : ""; ?>> ������� ������ �������</p>
			<input type="hidden" name="usergroup_id" value="<?=$MODULE_DATA["output"]["group"]["id"]?>">
			<p><input type="submit" value="������"></p>
			</form>
			</p><?
			break;
	}
}

?>