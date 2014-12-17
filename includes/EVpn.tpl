<?php
// version 2.3  2012/09/11

$MODULE_MESSAGES = array(
	301 => "������ ��������� ����� �������",
	302 => "�� ������ ������",
	303 => "�� ������� ��� ���������",
	304 => "�� ������� �����",
	305 => "�� ������� �����",
	306 => "�� ������ �����",
	307 => "�� ������ �������� ����",
	308 => "������ ���������� �������",
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
	<br /><br />���� �� �������� ����� � ������ ��� ������ ��������� �����, �� ������� �� � ������� "��� ���������".<br />� ��������� ������ ���������� � ���������� �������������� ������ �������������.
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
		<!--<input type="submit" value="����� � �������� ����" /><br />-->
		<a onmouseover="this.style.cursor='pointer';" onclick="document.getElementById('mailform').submit();">����� � �������� ����</a>
	</form>
<?php 		} else { ?>
	<a href="/mailreg/">�������� �������� ����</a>
<?php 		}
		}
		break;
		
		case "save_post":
		case "edit_post": { ?>
	<script src="/scripts/mailbox.js"></script>
	<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<p>
			<label class="block wide"><strong>�������� ����:</strong></label>
			<input type="text" id="username" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][username]" value="<?=(isset($data["username"]) ? $data["username"] : "")?>" onblur="if (this.value!='') javascript:process(); else { document.getElementById('exists').innerHTML=''; document.getElementById('exists_short').innerHTML=''; }" />
			<select  onchange="javascript:process();" id="domain" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][domain]"><option>@nsau.edu.ru</option><option>@nripk.ru</option></select> <span id="exists"></span><span id="exists_short" style="display:none;"></span><span id="username_double" style="display:none;"><?=(isset($data["username"]) ? $data["username"] : "")?></span><br />
		</p>
		<p>
			<label class="block wide"><strong>������:</strong>&nbsp;<span id="genpass"></span></label>
			<span id="copypass"><a onclick="copypass('genpass','add_pass','repeatpass');">������������ ���� ������<span id="instead"></span></a></span><br />
			<input type="password" id= "add_pass" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][password]" value="<?=(isset($data["password"]) ? $data["password"] : "")?>" />
			<a onclick="passgen('genpass',3,1,1,'add_pass');">������������� ������</a>
<?php		if ($MODULE_DATA["output"]["mode"] == "edit_post") { ?>
				<br /><small>(���� �� ������ ������ - �������� ���� ������)</small>
<?php 		} ?>
		</p>
		<p>
			<label class="block wide"><strong>��������� ������:</strong></label><br />
			<input type="password" id="repeatpass" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][repeat_password]" value="<?=(isset($data["repeat_password"]) ? $data["repeat_password"] : "")?>" /><br />
<?php 		if ($MODULE_DATA["output"]["mode"] == "edit_post") { ?>
			<small>(���� �� ������ ������ - �������� ���� ������)</small>
<?php 		} ?>
		</p>
		<p>
			<label class="block wide"><strong>��� ���������:</strong></label><br />
			<input type="text" class="input_long" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][name]" value="<?=(isset($data["name"]) ? $data["name"] : "")?>" />
		</p>
		<p>
			<label class="block wide"><strong>�����:</strong></label>
<?php 		$min_quota = "300";		
			if ($MODULE_DATA["output"]["quota_handle"]) { ?>
			<input type="text" size="4" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][quota]" value="<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?>" class="block text" /> ��
		</p>
<?php 		} else { ?>
		<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?> ��
		<input type="hidden" size="4" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][quota]" value="<?=(isset($data["quota"]) ? $data["quota"] : $min_quota)?>" />
<?php		} ?>
			<p><input type="checkbox" name="<?=$NODE_ID?>[<?=$MODULE_DATA["output"]["mode"]?>][active]" <? echo isset($data["active"])&&!$data["active"] ? "" : "checked=\"checked\""; ?>> <label class="block wide"><strong>��������</strong></label></p>
			<p><input type="submit" onclick="if (document.getElementById('exists_short').innerHTML == 'occ') { alert('������� ��������� ��� ��������� �����'); return false; }" value="<?php echo $MODULE_DATA["output"]["mode"]=="save_post" ? "������� ����" : "������������� ����"; ?>" /></p>
		</form>
<?php	}
		break;
		
		case "list_mailboxes": { ?>
		<p>
			<b><a href="create/">������� ����</a></b>
		</p>
		<p>
			����������� ��:
<?php 		if (isset($_GET["sortby"]) && $_GET["sortby"] == "name") { ?>
			<a href="?sortby=email">������</a> | <a href="?sortby=size">�������</a> | ��������� 
<?php 		} else if (isset($_GET["sortby"]) && $_GET["sortby"] == "size"){ ?>
			<a href="?sortby=email">������</a> | ������� | <a href="?sortby=name">���������</a>
<?php 		} else { ?>
			������ | <a href="?sortby=size">�������</a> | <a href="?sortby=name">���������</a>
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
					����� <?=(isset($mailbox['messages']) ? $mailbox['messages'] : "0")?>
				</td>
				<td>
					(<?=(isset($mailbox['bytes']) ? ($mailbox['bytes']/1048576 >= 1 ? floor($mailbox['bytes']/1048576)." ��)" : ($mailbox['bytes']/1024 >= 1 ? floor($mailbox['bytes']/1024)." ��)" : $mailbox['bytes']." �)")) : "0  �)")?>
				</td>
				<td>
					��������� ����� <?=$mailbox["lasttime"]?>
				</td>
				<td>
					<a href="delete/<?=$mailbox["username"]?>/" onclick="if (!confirm('�� �������, ��� ������ ������� ���� <?=$mailbox["username"]?>?')) return false;"><img src="/themes/images/delete.png" alt="" /></a>
				</td>
			</tr>
<?php 		} ?>
		</table>
<?php	}
		break;
		
		case "delete_request": { ?>
		<br />������ �� �������� ��������� ����� ���������� � ����� ����������� ��������� ���������������. �� ������ ��������� �� <a href="/office/mailboxes/">�������� ���������� ��������� �������</a>.
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