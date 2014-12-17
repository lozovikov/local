<?php
// version: 1.1
// date: 2012-10-24

$MODULE_MESSAGES = array(
	301 => "�� ������� �������",
	302 => "�� ������� ���",
	303 => "�� ������� ��������",
	304 => "�� ������� ������ ��������",
	305 => "�� ������� ���� ��������",
	306 => "�� ������ ����� ����������",
	307 => "�� ������� ������������ �������� ���������",
	308 => "�� ������� ���� ��������� �������� ���������",
	309 => "�� ������������ �������� �� ��������� ������",
	310 => "�� ������� �������� ��� ������� � ���������",
	311 => "�� ������ ����� ��� ������� ������",
	312 => "�� ������ ������ ��� ������� ������",
	313 => "�� ������ ����� ����������� ����� ��� ������� ������",
	314 => "������ � ������������� ������ �� ���������",
	);

if ($MODULE_OUTPUT["display_variant"] == "form_ok")
{
?>
<h3>������ ����������������!</h3>
<p class="pusher">���� ������ ���� ������� ����������������.</p>
<?php
}

elseif ($MODULE_OUTPUT["display_variant"] == "form_fail")
{
?>
<h3 class="red">������ �����������</h3>
<p class="pusher">����� ������ ���� ��������� �����, ��&nbsp;��� �� ����������� ��������� �������������� ��������. ����������, ���������� �&nbsp;������ ���.��������� �����. �������� ��������� ��&nbsp;������������ ����������.</p>
<?php
}


else
{
	if ($MODULE_OUTPUT["display_variant"] == "form_fill_error")
	{
?>
<h3 class="red">����� ������ ��������� �������</h3>
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
		
		case "list": 
			if (isset($MODULE_OUTPUT["people"]) && !empty($MODULE_OUTPUT["people"])) {
			?>
			<h2>������ ����������:</h2>
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
		<h1>������ ��������� ���������</h1>
		<hr />
		
		<p>��� ���� �� ���������� �������� ������������� ��� ����������.</p>
		<form onsubmit="unifyFormFields(this)" id="save_form" action="<?=$EE["unqueried_uri"]?>" method="post">
		<p class="pusher"><label class="block"><h2>�������<span class="obligatorily" title="������������ ��� ���������� ����">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][last_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["last_name"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>���<span class="obligatorily" title="������������ ��� ���������� ����">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>��������<span class="obligatorily" title="������������ ��� ���������� ����">*</span>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][patronymic]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["patronymic"])?>" class="text" /></p>
		<p class="pusher"><label class="block"><h2>�������<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		����� <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_serial]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_serial"])?>" class="text" /><br />
		����� <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_number]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_number"])?>"class="text" /><br />
		���� ������ <input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][passport_date]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_date"])?>"class="text" /><br />
		��� ����� <input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][passport_who]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["passport_who"])?>"class="text" /></p>
		<p class="pusher"><label class="block"><h2>���� �������� (����-��-��)<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][dob]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["dob"])?>" class="text" /></p>
		
		<p class="pusher"><label class="block"><h2>���<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		<input type="radio" name="<?=$NODE_ID?>[save_form][gender]" value=1 checked="checked"> �������<br />
		<input type="radio" name="<?=$NODE_ID?>[save_form][gender]" value=2> �������<br />
		</p>
		
		<p class="pusher"><label class="block"><h2>�����������<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
			<select id="citizenship" name="<?=$NODE_ID?>[save_form][citizenship]" size="1">
				<option value="0">�� �������</option>
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
		
		<p class="pusher"><label class="block"><h2>����� ����������<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		<input type="text" class="input_long" name="<?=$NODE_ID?>[save_form][address]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["address"])?>" class="text" /></p>
		
		<p class="pusher"><label class="block"><h2>��������� �������:</h2></label>
		<input type="text" maxlength="13" class="input_long" name="<?=$NODE_ID?>[save_form][cell_phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["cell_phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["cell_phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["cell_phone"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><h2>�������� �������:</h2></label>
		<input type="text" maxlength="13" class="input_long" id="phone" name="<?=$NODE_ID?>[save_form][phone]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["phone"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["phone"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["phone"]}\"" : ""; ?> class="text" /></p>
				
		<p class="pusher"><label class="block"><h2>������������ ������� ���������<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		<input checked="checked" type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="1"> �����
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 2) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="2"> ��������
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 3) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="3"> �������
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 4) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="4"> �����
		<input <?=((htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_type"]) == 5) ? "checked='checked'" : "") ?> type="radio" name="<?=$NODE_ID?>[save_form][institution_type]" value="5"> ��������
		<br /><br />
		� ��� ������������ �������� ���������<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][institution_name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["institution_name"])?>" class="text" />
		</p>
		
		<p class="pusher"><label class="block"><h2>���� ��������� �������� ��������� (����-��-��)<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?><span class="obligatorily" title="������������ ��� ���������� ����">*</span><? } ?>:</h2></label>
		<input type="text" class="input_short" name="<?=$NODE_ID?>[save_form][graduation_date]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["graduation_date"])?>" class="text" />
		</p>
		
		<p class="pusher"><label class="block"><h2>�������� ���������<span class="obligatorily" title="������������ ��� ���������� ����">*</span>:</h2></label>
			<?php
				if (!empty($MODULE_OUTPUT["subjects"]))
					foreach ($MODULE_OUTPUT["subjects"] as $ind=>$subj) { ?>
				<input type="checkbox" name="<?=$NODE_ID?>[save_form][subj][<?=$ind?>]" value="<?=$subj["id"]?>" <?=(isset($MODULE_OUTPUT["form_data"]["subj"][$ind]) ? "checked='checked'" : "") ?> ><?=$subj["name"]?></input>
			<?php } ?>
		</p>
		
		<? if (!$MODULE_OUTPUT["is_admin_user"]) { ?>
		<p class="pusher"><label class="block"><strong>�������� �� ��������� ���� ������:</strong></label>
		<input type="checkbox" name="<?=$NODE_ID?>[save_form][agreed]" <?=(htmlspecialchars($MODULE_OUTPUT["form_data"]["agreed"]) ? "checked='checked'" : "") ?>/>
		</p>
		<? } ?>
				
		<hr />
		
				
		<p><br />��� ����������� ��������� ������ ��� ���������� ������� � ������� ���� ������� ������.<br/>(<small>����� ������ � ������ �� ������ ��������� 25 ��������</small>)</p>
		
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

