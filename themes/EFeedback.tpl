<?php
// version: 2.2
// date: 2012-05-10
global $Engine, $Auth, $EE;

$MODULE_MESSAGES = array(
	301 => "�� ��������� ���� ���",
	302 => "�� ������� �����",
	303 => "�� ������ ������",
	304 => "�� ������ �����",
	305 => "�� ������ �����",
	306 => "�� ������� ����� ����������",
	307 => "�� ������� ��������",
	308 => "�������� ������� ����� 500 ��������",
	309 => "������� �������� ���������",
	310 => "������� ������� ���������",
	311 => "�� ������� ���",
	312 => "������� �������� ���� ��������",
	313 => "������� ������� ���� ��������",
	314 => "�� ������ email",
	315 => "Email ������ �� �����"
	);

if ($MODULE_OUTPUT["display_variant"] == "send_ok") { ?>
	<h3 class="red">��������� ����������!</h3>
	<p >���� ��������� ���������� �������. ��� ������������� �&nbsp;���� �������� ��� ����������.</p>
<?php
} elseif ($MODULE_OUTPUT["display_variant"] == "send_fail") { ?>
	<h3 class="red">������ �������� ���������</h3>
	<p class="pusher">����� ��������� ���� ��������� �����, ��&nbsp;��� ��� �������� ��������� �������������� ��������. ����������, ���������� �&nbsp;�������������� �����. �������� ��������� ��&nbsp;������������ ����������.</p>
<?php
} else {
	if ($MODULE_OUTPUT["display_variant"] == "form_fill_error") { ?>
	<h3 class="red">����� ��������� ��������� �������</h3>
	<p >����������, ��������� ������ ����������:</p>
<?php 	$array = array();

		foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem) {
			if (isset($MODULE_MESSAGES[$elem])) {
				$array[] = $MODULE_MESSAGES[$elem];
			}
		}

		if ($array) {
			echo "<ul>\n";
			foreach ($array as $elem) {
				echo "	<li>$elem</li>\n";
			}
			echo "</ul>\n";
		}
	}
	
	switch ($MODULE_OUTPUT["mode"]) {
		case "olymp": { ?>
<form action="<?=$EE["unqueried_uri"]?>" method="post"<?echo $MODULE_OUTPUT["having_files"] ? " enctype=\"multipart/form-data\">\n\t<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"{$MODULE_OUTPUT["max_filesize"]}\" />\n" : ">" ?>
	<p class="pusher"><label class="block"><strong>���� ���<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][fio]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["fio"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["fio"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["fio"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>����� �����<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][school]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["school"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["school"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["school"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][region]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["region"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["region"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["region"]}\"" : ""; ?> class="text" /></p>		
	<p class="pusher"><label class="block"><strong>��������� �����<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][city]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["city"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["city"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["city"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>�����<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][district]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["district"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["district"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["district"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>����� ����������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<select name="<?=$NODE_ID?>[send_message][place]" size="1" />
		<option value="�. �����������">�. �����������</option>
		<option value="�. ��������">�. ��������</option>
		<option value="�. ����">�. ����</option>
		<option value="�.�. ����������">�.�. ����������</option>
		<option value="�.�. �����">�.�. �����</option>
		</select>
		</p>	
	<p class="pusher"><label class="block"><strong>��������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<textarea name="<?=$NODE_ID?>[send_message][contacts]" cols="45" rows="5" class="common"><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["contacts"])?></textarea></p>
	<p class="pusher"><input type="submit" value="��������� ���������" /></p>
</form>
<?php	}
		break;
		
		case "abit": { ?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<p class="pusher"><label class="block"><strong>�������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][lastname]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["lastname"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["lastname"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["lastname"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>���� ���<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][firstname]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["firstname"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["fio"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["firstname"]}\"" : ""; ?> class="text" /></p>
		<p class="pusher"><label class="block"><strong>���� ��������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][surname]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["surname"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["surname"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["surname"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>�������������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][speciality]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["speciality"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["speciality"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["speciality"]}\"" : ""; ?> class="text" /></p>
	<p><b>�������� �����������:</b></p>
	<p class="pusher"><label class="block"><strong>����<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" name="<?=$NODE_ID?>[send_message][senddate]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["senddate"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["senddate"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["senddate"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>�<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][sendnumber]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["sendnumber"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["sendnumber"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["sendnumber"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>������������ ��������� �������� �����<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="text" class="input_long" name="<?=$NODE_ID?>[send_message][postoffice]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["postoffice"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["postoffice"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["postoffice"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher"><label class="block"><strong>����� ����������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<input type="checkbox" name="is_zayav"> ���������<br />
		<input type="checkbox" name="is_ege"> ����� ������������� � ����������� ���<br />
		<input type="checkbox" name="is_passport"> ����� ��������<br />
		</p>	
	<p class="pusher"><label class="block"><strong>������ ���������:</strong></label><br />
		<textarea name="<?=$NODE_ID?>[send_message][other_docs]" cols="45" rows="5" class="common"><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["other_docs"])?></textarea></p>
	<p class="pusher"><input type="submit" value="���������" /></p>
</form>
<?php	}
		break;
		/*
		case "user_alert_form": { ?>
		<script>
			(function($) {
				
				$().createAjaxForm(supportFormIniter);
				
			})(jQuery);
		</script>
<?php 	}
		break;
	
		case "user_alerts": { ?>
			<table id="user_messages_table" cellpadding="1"	cellspacing="0" >
				<tr id="user_messages_header" >
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">����</th>
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">������������</th>
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">�������� � �������</th>
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">������</th>
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">�����������</th>
					<th class="user_messages_td" style="border: 1px solid; border-collapse: collapse">���������</th>
					
				</tr>
				<?php
					foreach($MODULE_OUTPUT['user_messages'] as $message) {?>
						<tr class="user_messages_tr" style="background-color: <?=($message['is_checked']?'#a0e0a0':'#f0a0a0')?>">
							<td class="user_messages_td user_msg_date" style="width:15%; border: 1px solid; border-collapse: collapse"><?=$message['date']?></td>
							<td class="user_messages_td user_msg_username" style="width:5%; border: 1px solid; border-collapse: collapse"><?=($message['username']?$message['username']:'-')?></td>
							<td class="user_messages_td user_msg_page" style="width:25%;; border: 1px solid; border-collapse: collapse"><a href="<?=$message['page']?>"><?=$message['page']?></a></td>
							<td class="user_messages_td user_msg_text" style="width:25%; border: 1px solid; border-collapse: collapse"><?=$message['text']?></td>
							<td class="user_messages_td user_msg_comment" style="width:25%; border: 1px solid; border-collapse: collapse"><?=($message['comment']?$message['comment']:'&nbsp;')?></td>
							<td class="user_messages_td user_msg_is_checked" style="width:5%; border: 1px solid; border-collapse: collapse"><?=($message['is_checked']?'<img src="/themes/images/edit-add.png" />':'<a id="userMsg_'.$message['id'].'" class="checkUserMsg"><img src="/themes/images/delete.png" /></a>')?></td>
						</tr>
					<? }  
				?>
			</table>
			<form>
			<input type="hidden" id="page_field" name="page" value="1" />
			</form>
			<div class="pager_cont" id="pager_cont">
		    <?php
		    //print_r($MODULE_OUTPUT["pager_output"]);
		    include 'Pager.tpl';
			?>
			</div>
			
			<script>
			(function ($) {
				$('#pager_cont').createPager({
					'onResponse': function(response) {
						var checkedMessageHTML = '<img src=\"/themes/images/edit-add.png\" />'
							var notCheckedMessageHTML = '<a id=\"userMsg_[MSG_ID]\" class=\"checkUserMsg\"><img src=\"/themes/images/delete.png\" /></a>'
							
							$('table#user_messages_table tr').each( function() {
								$(this).css('display', $(this).index() > response[0].length ? 'none' : 'table-row');
							});
							for ( var ind in response[0]) { 
								for ( var field in response[0][ind]) {
									switch (field) {
										case 'is_checked' :
											$('td.user_msg_is_checked').eq(ind).html(response[0][ind]['is_checked'] == 1 ? checkedMessageHTML : notCheckedMessageHTML.replace('[MSG_ID]', $('td.user_msg_id').eq(ind)));
											$('td.user_msg_is_checked').eq(ind).closest('tr').css('backgroundColor', response[0][ind]['is_checked'] == 1 ? '#a0e0a0' : '#f0a0a0');
										break;
										case 'page' :
											var pageHref = $('td.user_msg_page').eq(ind).find('a');
											pageHref.attr('href', response[0][ind][field]);
											pageHref.text(response[0][ind][field]);
										break;
										default: 
											$('td.user_msg_'+field).eq(ind).text(response[0][ind][field]);
										break;
									}
								};	
							}
		
						}
					});
			})(jQuery);
		

		</script>
			
<?php 	}	 
		break;
		*/
		default: { ?>
<form action="<?=$EE["unqueried_uri"]?>" style="width:45%;position: relative;float: left" method="post"<?echo $MODULE_OUTPUT["having_files"] ? " enctype=\"multipart/form-data\">\n\t<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"{$MODULE_OUTPUT["max_filesize"]}\" />\n" : ">" ?>
	<p class="pusher"><label class="block"><strong>���� ��� � �������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[send_message][name]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["name"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["name"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["name"]}\"" : ""; ?> class="text" /></p>
	<p class="gorod"><label class="block"><strong>�����:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[send_message][city]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["city"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["city"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["city"]}\"" : ""; ?> class="text" /></p>
	<p class="pusher">
		<label class="block"><strong>E-mail<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[send_message][email]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["email"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["email"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["email"]}\"" : ""; ?> class="text" />
	</p>
	<p class="pusher">
		<label class="block"><strong>��������:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[send_message][contacts]" value="<?=htmlspecialchars($MODULE_OUTPUT["form_data"]["contacts"])?>"<?php echo $MODULE_OUTPUT["maxlen"]["contacts"] ? " maxlength=\"{$MODULE_OUTPUT["maxlen"]["contacts"]}\"" : ""; ?> class="text" />
	</p>
	<p class="pusher"><strong>���� ���������<span class="hint red" title="������������ ��� ���������� ����">*</span>:</strong><br />
		<textarea name="<?=$NODE_ID?>[send_message][message]" cols="45" rows="5" class="common"><?=htmlspecialchars($MODULE_OUTPUT["form_data"]["message"])?></textarea></p>
	<p class="pusher"><input type="submit" value="��������� ���������" /></p>
</form>
<div style="width:10%;position: relative; float: left; height: 10px;"></div>
<?php	}
		break;
	}
}

?>
<!-- <style>
	table#user_messages_table {
		width: 90%;
	}
	
	tr#user_messages_header {
		background-color: #f0a0c0;
	}
	
	div.current-page {
		display: inline;
		color: #000;
		font-weight: bold;
	}
</style> -->