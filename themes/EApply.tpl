<?php

$MODULE_MESSAGES = array(
	301 => "�� ������� �������",
	302 => "�� ������� ���",
	303 => "�� ������� ��������",
	304 => "�� ������� ���� ��������",
	305 => "�� ������ ����� ��������� �����������",
	306 => "�� ������ �������� �������� �����",
	307 => "�� ������ ��������� �������",
	308 => "�� ������ e-mail",
	309 => "�� ������ �������� �������",
	310 => "�� ������� ����� ����������",
	311 => "�� ������� ������ �������������",
	401 => "� ��� ��� ����� �� �������� �������"
	);

if ($MODULE_OUTPUT["display_variant"] == "send_ok")
{
?>
<h3>��������� ����������!</h3>
<p class="pusher">���� ��������� ���������� �������. ��� ������������� �&nbsp;���� �������� ��� ����������.</p>
<?php
}

elseif ($MODULE_OUTPUT["display_variant"] == "send_fail")
{
?>
<h3 class="red">������ �������� ���������</h3>
<p class="pusher">����� ��������� ���� ��������� �����, ��&nbsp;��� ��� �������� ��������� �������������� ��������. ����������, ���������� �&nbsp;�������������� �����. �������� ��������� ��&nbsp;������������ ����������.</p>
<?php
}


else
{
	if ($MODULE_OUTPUT["display_variant"] == "form_fill_error")
	{
?>
<h3 class="red">����� ��������� ��������� �������</h3>
<p class="pusher">����������, ��������� ������ ����������:</p>
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
	<p class="pusher"><label class="block"><strong>�������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][last_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["last_name"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["last_name"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["last_name"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>���� ���<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["name"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["name"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>���� ��������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][patronymic]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["patronymic"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["patronymic"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["patronymic"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>��������� �������:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][cell_phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["cell_phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["cell_phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["cell_phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>�������� �������:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>E-mail<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][email]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["email"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["email"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["email"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>����� ����������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][address]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["address"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["address"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["address"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>������������� 1<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality1]" size="1">
		<option value="0">�� �������</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality1"] == $spec["code"]) { ?> selected="selected"<? } ?>><?=$spec["name"]?><?php if($spec['qual_name']) { ?> (<?=$spec['qual_name'];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
		<p class="pusher"><label class="block"><strong>������������� 2:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality2]" size="1">
		<option value="0">�� �������</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality2"] == $spec["code"]) { ?> selected="selected"<? } ?> data-code="<?=$spec["code"];?>"><?=$spec["name"]?><?php if($spec["qual_name"]) { ?> (<?=$spec["qual_name"];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
		<p class="pusher"><label class="block"><strong>������������� 3:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][speciality3]" size="1">
		<option value="0">�� �������</option>
		<?
		foreach ($MODULE_OUTPUT["specialities"] as $spec) {
		?>
		<option value="<?=$spec["id"]?>"<? if ($MODULE_OUTPUT["form_data"]["speciality3"] == $spec["code"]) { ?> selected="selected"<? } ?>><?=$spec["name"]?><?php if($spec['qual_name']) { ?> (<?=$spec['qual_name'];?>)<?php } ?></option>
		<? } ?>
		</select>
		</p>
	<p><b>�������� �����������:</b></p>
	<p class="pusher"><label class="block"><strong>���� �������� (����-��-��)<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="date_time" name="<?=$NODE_ID?>[send_message][senddate]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["senddate"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["senddate"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["senddate"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>�<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][sendnumber]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["sendnumber"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["sendnumber"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["sendnumber"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>������������ ��������� �������� ����� <small><span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][postoffice]" id="postoffice" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["postoffice"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["postoffice"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["postoffice"]}\"" : ""; ?> class="text" /><br />
		(��������: <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">����� ������</a>, <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">DHL</a>, <a onclick="document.getElementById('postoffice').value = this.innerHTML;" class="apply_example">��������-����� "�������"</a>)</small></p>
	<p class="pusher"><label class="block"><strong>����� ����������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_zayav]"> ���������<br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_ege]"> ����� ������������� � ����������� ���<br />
		<input type="checkbox" name="<?=$NODE_ID?>[send_message][is_passport]"> ����� ��������<br />
		<input type="text" class="gorod" name="spamcheck">
		</p>
	<p class="pusher"><label class="block"><strong>������ ���������:</strong></label><br />
		<textarea name="<?=$NODE_ID?>[send_message][otherdocs]" cols="45" rows="5" class="common"><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["otherdocs"])?></textarea></p>
	<p class="pusher"><input type="submit" value="���������" /></p>
</form><br /><br /><? if($MODULE_OUTPUT["allow_handle"]) { ?><a href="manage/">���������� ��������</a><br /><a href="list/">������ ������</a><? } ?>
<?php
		break;
		
		case "applies_manage":
		
		if (isset($MODULE_OUTPUT["applies"]))
			foreach ($MODULE_OUTPUT["applies"] as $apply) {
				?><b>���:</b> <?=$apply["last_name"]?> <?=$apply["name"]?> <?=$apply["patronymic"]?><br />
				<b>�������� �������:</b> <?=$apply["phone"]?><br />
				<b>��������� �������:</b> <?=$apply["cell_phone"]?><br />
				<b>E-mail:</b> <?=$apply["email"]?><br />
				<b>����� ����������:</b> <?=$apply["address"]?><br />
				<b>���� ��������:</b> <?=$apply["senddate"]?><br />
				<b>����� ��������� �����������:</b> <?=$apply["sendnumber"]?><br />
				<b>�������� ��������� �����:</b> <?=$apply["postoffice"]?><br />
				<b>������������� 1:</b> <?php if($apply["code1"]) { ?><?=$apply["spec_name1"];?> <?php if($apply["qual_name1"]) { ?> (<?=$apply["qual_name1"];?>)<?php } ?><?php } else { ?><?=$apply["speciality1"]?><?php } ?><br />
				<? if ($apply["speciality2"]) { ?>
        <b>������������� 2:</b> <?php if($apply["code2"]) { ?><?=$apply["spec_name2"];?> <?php if($apply["qual_name2"]) { ?> (<?=$apply["qual_name2"];?>)<?php } ?><?php } else { ?><?=$apply["speciality2"]?><?php } ?><br />
        <? } ?>
				<? if ($apply["speciality3"]) { ?>
        <b>������������� 3:</b> <?php if($apply["code3"]) { ?><?=$apply["spec_name3"];?> <?php if($apply["qual_name3"]) { ?> (<?=$apply["qual_name3"];?>)<?php } ?><?php } else { ?><?=$apply["speciality3"]?><?php } ?><br />
        <? } ?>
				<b>����� ����������:</b> <? if ($apply["is_zayav"]) { ?>���������.<? } ?><? if ($apply["is_ege"]) { ?> ����� ������������� � ����������� ���.<? } ?><? if ($apply["is_passport"]) { ?> ����� ��������.<? } ?><br />
				<? if ($apply["otherdocs"]) { ?><b>������ ���������:</b> <?=$apply["otherdocs"]?><br /><? } ?>
				<form action="./" method="post">
				<input type="hidden" name="edit_apply_id" value="<?=$apply["id"]?>">
				<b>������:</b> <select name="status_id" size="1">
				<? foreach ($MODULE_OUTPUT["statuses"] as $status) { ?>
				<option value="<?=$status["id"]?>" <? if ($apply["status_id"] == $status["id"]) { ?>selected="selected"<? } ?>><?=$status["title"]?></option>
				<? } ?>
				</select><br />
				<b>���������:</b> <textarea cols="30" rows="4" wrap="virtual" name="notices"><?=$apply["notices"]?></textarea><br />
				<input type="submit" value="���������">
				</form><br/>
				<? if($MODULE_OUTPUT["allow_delete"]) { ?><a href="../delete/<?=$apply["id"]?>/" onclick="if(!confirm('�� �������, ��� ������ ������� ������ ������?')) return false;">�������</a><? } ?>
				<hr />
				<?
			}
		
		break;
		
		case "one_apply":
			$apply = $MODULE_OUTPUT["apply"];
			if (!empty($apply)) {
		?>
				<b>���:</b> <?=$apply["last_name"]?> <?=$apply["name"]?> <?=$apply["patronymic"]?><br />
				<b>�������� �������:</b> <?=$apply["phone"]?><br />
				<b>��������� �������:</b> <?=$apply["cell_phone"]?><br />
				<b>E-mail:</b> <?=$apply["email"]?><br />
				<b>����� ����������:</b> <?=$apply["address"]?><br />
				<b>���� ��������:</b> <?=$apply["senddate"]?><br />
				<b>����� ��������� �����������:</b> <?=$apply["sendnumber"]?><br />
				<b>�������� ��������� �����:</b> <?=$apply["postoffice"]?><br />
				<b>������������� 1:</b> <?php if($apply["code1"]) { ?><?=$apply["spec_name1"];?> <?php if($apply["qual_name1"]) { ?> (<?=$apply["qual_name1"];?>)<?php } ?><?php } else { ?><?=$apply["speciality1"]?><?php } ?><br />
				<? if ($apply["speciality2"]) { ?>
        <b>������������� 2:</b> <?php if($apply["code2"]) { ?><?=$apply["spec_name2"];?> <?php if($apply["qual_name2"]) { ?> (<?=$apply["qual_name2"];?>)<?php } ?><?php } else { ?><?=$apply["speciality2"]?><?php } ?><br />
        <? } ?>
				<? if ($apply["speciality3"]) { ?>
        <b>������������� 3:</b> <?php if($apply["code3"]) { ?><?=$apply["spec_name3"];?> <?php if($apply["qual_name3"]) { ?> (<?=$apply["qual_name3"];?>)<?php } ?><?php } else { ?><?=$apply["speciality3"]?><?php } ?><br />
        <? } ?>
				<b>����� ����������:</b> <? if ($apply["is_zayav"]) { ?>���������.<? } ?><? if ($apply["is_ege"]) { ?> ����� ������������� � ����������� ���.<? } ?><? if ($apply["is_passport"]) { ?> ����� ��������.<? } ?><br />
				<? if ($apply["otherdocs"]) { ?><b>������ ���������:</b> <?=$apply["otherdocs"]?><br /><? } ?>
				<form action="<?php echo $EE["engine_uri"];?>manage/" method="post">
				<input type="hidden" name="edit_apply_id" value="<?=$apply["id"]?>">
				<b>������:</b>
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
				if (!$apply["status_id"]) echo "���������";
				?>
        <?php } ?>
				<br />
				<b>���������:</b> <? if($MODULE_OUTPUT["allow_handle"]) { ?>
        <textarea cols="30" rows="4" wrap="virtual" name="notices"><?=$apply["notices"]?></textarea>
        <?php } else { ?><?=$apply["notices"]?>
        <?php } ?><br />
        <? if($MODULE_OUTPUT["allow_handle"]) { ?>
        <input type="submit" value="���������"><br />
        <?php } ?>
        <? if($MODULE_OUTPUT["allow_handle"]) { ?><br /><a href="<?php echo $EE["engine_uri"];?>manage/">���������� ��������</a><br /><a href="<?php echo $EE["engine_uri"];?>list/">������ ������</a><? } ?>
		<?
			}
			else { ?>������ �� �������.<? }
		break;
		
		case "applies_list":
			?>
			<table width="100%" id="applies">
				<tr align="left">
					<th>���</th>
					<th>���� ��������</th>
					<th>������</th>
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
					if (!$apply["status_id"]) echo "���������";
				?>
			</td></tr>
			<?
			}
			?></table>
      <? if($MODULE_OUTPUT["allow_handle"]) { ?><br /><a href="<?php echo $EE["engine_uri"];?>manage/">���������� ��������</a><br /><? } ?>
      <?
		break;
	
		default:

		break;
	}

}

?>