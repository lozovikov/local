<?php
// version: 2.8
// date: 2013-07-12

$MODULE_MESSAGES = array(
	101 => "��� ������ ���� �� ������������ ������������. �������.",
	102 => "������ �&nbsp;����� ������� ���������",
	103 => "������ ������� �����",
	104 => "������ ������� ������",
	105 => "������ ������� �����",
	301 => "��&nbsp;������� ��� �����������",
	302 => "��&nbsp;��������� ���� ������ �������",
	303 => "��� ������������� �������. ����������, ������� ��� ������",
	304 => "��&nbsp;������ ��� �������������",
	305 => "������� ������ ��� �������������",
	310 => "������ ��&nbsp;������ �&nbsp;���� ������",
	401 => "������ ���� ������ ��� ���������� �������. ���������� �&nbsp;��������������",
	402 => "������ ���� ������ ��� ���������� ������� �&nbsp;������. ���������� �&nbsp;��������������",
	403 => "������ ���� ������ ��� ������� �������. ���������� �&nbsp;��������������",
	403 => "������ ���� ������ ��� ������� �������. ���������� �&nbsp;��������������",
	404 => "������ ���� ������ ��� �������� �������. ���������� �&nbsp;��������������",
	405 => "������ ���� ������ ��� �������� �������. ���������� �&nbsp;��������������",
	501 => "�������� ������ ������ e-mail",
//	1001 => "��&nbsp;������ ���� ������������",
//	1002 => "���������� ���������� ���� ������������",
//	1100 => "����������� ����� ������",
	);


if ($MODULE_OUTPUT["messages"]["good"]) {
	$array = array();

	foreach ($MODULE_OUTPUT["messages"]["good"] as $elem) {
		if (isset($MODULE_MESSAGES[$elem])) {
			$array[] = $MODULE_MESSAGES[$elem];
		}
	}
	if ($array) {
		foreach ($array as $elem) {
			echo "<p class=\"message\">$elem</p>\n";
		}
	}
}

switch ($MODULE_OUTPUT["mode"]) {
	case "announce": { ?>
		<h2><a href="<?=$MODULE_OUTPUT["module_folder_uri"]?>" title="�������� ��� �������">��� �������</a></h2>
<?php 	foreach ($MODULE_OUTPUT["posts"] as $data) { ?>
		<div class="aggregate">
			<p class="author">
				<strong><?=$data["author_name"]?></strong>
				<?=($data["author_from"] ? " (".$data["author_from"].")" : "")?>, <?=(date("d.m.Y", strtotime($data["post_time"])))?>(<?=$data["post_category"]?>)
			</p>
			<div class="post">
				<?=(CF::LimitStr($data["post_text"], 200, CODEPAGE))?>
			</div>
<?php		if (CF::IsNonEmptyStr($data["response_text"])) { ?>
			<div class="response">
				<p class="author">����� �����������, <?=(date("d.m.Y, H:i", strtotime($data["response_time"])))?>:</p>
				<div class="text">
					<?=(CF::LimitStr($data["response_text"], 200, CODEPAGE))?>
				</div>
			</div>
<?php		} ?>
		</div>
<?php	}
	}
	break;

	case "combo": {
//		$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<link rel=\"stylesheet\" href=\"" . $EE["http_styles"] . "screen-page-consumer.css\" type=\"text/css\" />\n";
		if ((@$MODULE_OUTPUT["display_variant"] != "edit_post") && !$MODULE_OUTPUT["status"]) {
			$array = array();

			foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem) {
				if (isset($MODULE_MESSAGES[$elem])) {
					$array[] = $MODULE_MESSAGES[$elem];
				}
			}

			if ($array) { ?>
		<h2>������: <strong>��</strong>&nbsp;���������!</h2>
		<h3>��������� ��������� ������:</h3>
		<ul>
<?php			foreach ($array as $elem) { ?>
			<li class="message red"><?=$elem?></li>
<?php			} ?>
		</ul>
<?php
//				$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<script type=\"text/javascript\" src=\"" . $EE["http_scripts"] . "show_form.js\"></script>\n";
			} else {
//				$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<script type=\"text/javascript\" src=\"" . $EE["http_scripts"] . "hide_form.js\"></script>\n";
			}
		} else {
//			$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<script type=\"text/javascript\" src=\"" . $EE["http_scripts"] . "hide_form.js\"></script>\n";
		}

//		$CODE_SUBSTITUTES["EXTRA_HEAD_CONTENT"] .= "	<script type=\"text/javascript\" src=\"" . $EE["http_scripts"] . "show_hide.js\"></script>\n";

//		<h2><a href="javascript:ShowHide()" id="iconed_link" title="�������� ����� �������� �������"><span id="link_icon"><script type="text/javascript">document.write(link_icon_content)</script></span> ������ ������</a></h2>

//		<script type="text/javascript">document.getElementById("add_post").style.display = form_display</script>
?>
		<?php 
		if (!isset($MODULE_OUTPUT["allow_empty_theme"]) || !$MODULE_OUTPUT["allow_empty_theme"]) { ?>
		<div class="EGuestbook_select_category">
			<script>jQuery(document).ready(function($) {EGuestbookCombo();});</script>
			<div class="category-href">�������� ����</div><br />
			<div class='category-cont'>
				<form name="guestbookCategoryForm" action="<?=$EE["unqueried_uri"]?>" method="post">
<?php  	foreach($MODULE_OUTPUT["categories"] as $category) { ?>
					<label>
						<input name="<?=$category?>" type="checkbox" <?=(in_array($category, $MODULE_OUTPUT['checked_categories']) ? 'checked="checked"' : '')?> /> <?=$category?>
					</label><br />
<?php	} 
		 if (isset($MODULE_OUTPUT["allow_empty_theme"]) && $MODULE_OUTPUT["allow_empty_theme"]) {
		?>
		<input name="NOCAT" type="checkbox" <?=(in_array("NOCAT", $MODULE_OUTPUT['checked_categories'])?'checked':'')?> /><label>��� ����</label><br />
		<? } 
		?>
					<!--<input name="NOCAT" type="checkbox" <?=(in_array("NOCAT", $MODULE_OUTPUT['checked_categories']) ? 'checked="checked"' : '')?> /><label>������</label><br />-->
					<input type="hidden" name="are_categories" />
					<div><a href="javascript:void()" class="checked_all">�������� ���</a>&nbsp;|&nbsp;<a href="javascript:void()" class="unchecked_all">����� ���</a></div>
					<input class='category-submitter' type="submit" value="OK" />
				</form>
			</div>
		</div>
		<?php } ?>
<?php 	$pager_output = $MODULE_OUTPUT["pager_output"];
		if (count($pager_output["pages_data"]) > 1) { // ���� ���� ��� ��������, � ������� ������ ����� ?>
		<div class="pager">
			<p>
<?php		if ($pager_output["prev_page"]) { ?>
				<a href="<?=$pager_output["pages_data"][$pager_output["prev_page"]]["link"]?>" title="���������� ��������" id="prev_page_link" class="prev-next-link">
					<span class="arrow">&larr;&nbsp;</span>
				</a>&nbsp;
<?php		}
			foreach ($pager_output["pages_data"] as $page => $data) {
				if (is_int($page)) { ?>
				<?=($data["is_current"] ? "<span class='active item'>" : "<a href='".$data["link"]."' class='item'>")?><?=$page?><?=($data["is_current"] ? "</span>" : "</a>")?>&nbsp;
<?php			} else { ?>
				&hellip;
<?php			}
			};
			if ($pager_output["next_page"]) { ?>
				<a href="<?=$pager_output["pages_data"][$pager_output["next_page"]]["link"]?>" title="��������� ��������" id="next_page_link" class="prev-next-link">
					<span class="arrow">&nbsp;&rarr;</span>
				</a>
<?php		} ?>
			</p>
		</div>
<?php	}

		foreach ($MODULE_OUTPUT["posts"] as $data) { ?>
		<div class="aggregate<?=($data["is_active"] ? "" : " inactive")?>">
			<div class="question shadow_rbg">
				<p class="author">
<?php		if ($MODULE_OUTPUT["show_number"]) { ?>
					������ �<?=$data["pos"]?> <?=( !is_null($data["post_category"]) ? ($data["post_category"] ? '('.$data["post_category"].')' : $data["post_category"]) : '' )?><br />
<?php		} ?>
					<?=(date("d.m.Y", strtotime($data["post_time"])))?>
					<?=$data["author_name"]?><?=($data["author_from"] ? ($data["author_from"]) : "")?>
					<?=($data["author_phone"] ? (", ". $data["author_phone"]) : "" )?>
					<?=($data["author_email"] ? ", <a href='mailto:".$data["author_email"]."'>".$data["author_email"]."</a>" : "" )?>
				</p>
				<p class="post"><?=$data["post_text"]?></p>
				<div class="shadow_tr">&nbsp;</div>
				<div class="shadow_b">
					<div class="shadow_br">&nbsp;</div>
					<div class="shadow_bl">&nbsp;</div>
				</div>
			</div>
<?php		if (CF::IsNonEmptyStr($data["response_text"])) { ?>
			<div class="response">
				<h1 class="author">����� �����������, <?=(date("d.m.Y, H:i", strtotime($data["response_time"])))?>:</h1>
				<p><?=$data["response_text"]?></p>
			</div>
<?php		}
			
			/*echo "<div class=\"aggregate" . ($data["is_active"] ? "" : " inactive") . "\">\n";
			echo "<p class=\"author\">";
			if ($MODULE_OUTPUT["show_number"])
				echo "������ �" . $data["id"] . "<br />";
			echo date("d.m.Y", strtotime($data["post_time"]));
			echo " " . $data["author_name"] . ($data["author_from"] ? " ({$data["author_from"]})" : "");
			echo ($data["author_phone"] ? (", ". $data["author_phone"]) : "" );
			echo ($data["author_email"] ? ", <a href=\"mailto:".$data["author_email"]."\">".$data["author_email"]."</a>" : "" );
			echo "</p>";
			echo "<p class=\"post\">".$data["post_text"]."</p>\n";


			if (CF::IsNonEmptyStr($data["response_text"]))
			{ ?>
				<div class="response">
				<?php
				echo "<div class=\"author\">����� �����������" . ", " . date("d.m.Y, H:i", strtotime($data["response_time"])) . ":</div>";
				echo "<p>".$data["response_text"]."</p>\n";
				?>
				</div>
				<?php
			}*/

			if ($MODULE_OUTPUT["manage_access"]) { ?>
<p class="actions">
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_post&amp;id=<?=$data["id"]?>#form">������/�����</a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=<?php echo $data["is_active"] ? "hide" : "unhide"; ?>_post&amp;id=<?=$data["id"]?>"><?php echo $data["is_active"] ? "������" : "�������"; ?></a>&nbsp;]
	[&nbsp;<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_post&amp;id=<?=$data["id"]?>" onclick="return confirm('�� ������������� ������ ������� ��� ������?')">�������</a>&nbsp;]
</p>
<?php		} ?>
		</div>
<?php	}

		if ($MODULE_OUTPUT["manage_access"]) {
			if ($MODULE_OUTPUT["display_variant"] == "edit_post") {
				$data = $MODULE_OUTPUT["form_data"]; ?>
<a name="form"></a>
<h2>��������������/�����</h2>
<?php 			if ($MODULE_OUTPUT["messages"]["bad"]) {
					$array = array();

					foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem) {
						if (isset($MODULE_MESSAGES[$elem])) {
							$array[] = $MODULE_MESSAGES[$elem];
						}
					}
					if ($array) {
						foreach ($array as $elem) { ?>
			<p class="message red"><?=$elem?></p>
<?php					}
					}
				} ?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<input type="hidden" name="<?=$NODE_ID?>[save_post][id]" value="<?=$data["id"]?>" />
	<input type="hidden" name="<?=$NODE_ID?>[save_post][replace_response_stats]" value="<?=$data["replace_response_stats"]?>" />
	<p>
		<small>������������ ������ ��&nbsp;����������� �&nbsp;����� �������, ������ ���� ��� ���������� (��������, ���� ��� �������� ����������� �������, �����������, ������� �&nbsp;�.�.).</small>
	</p>
	<p>
		<small>��&nbsp;���������� ��� ����������� �/��� ���� ������� �������. ���� �� ������ ������ ��� ������� ������ �������, �������������� ��������������� ��������.</small>
	</p>
	<p>
		<label class="block wide"><strong>����� �������:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_post][post_day]" value="<?=$data["post_day"]?>" maxlength="2" size="2" />.<input type="text" name="<?=$NODE_ID?>[save_post][post_month]" value="<?=$data["post_month"]?>" maxlength="2" size="2" />.<input type="text" name="<?=$NODE_ID?>[save_post][post_year]" value="<?=$data["post_year"]?>" maxlength="4" size="4" />, <input type="text" name="<?=$NODE_ID?>[save_post][post_hours]" value="<?=$data["post_hours"]?>" maxlength="2" size="2" />:<input type="text" name="<?=$NODE_ID?>[save_post][post_minutes]" value="<?=$data["post_minutes"]?>" maxlength="2" size="2" /><br />
		<small>(������ �������� ������������� ���������� �� ������� ����/�����)</small>
	</p>
	<input type="hidden" name="<?=$NODE_ID?>[save_post][post_seconds]" value="<?=$data["post_seconds"]?>" />
	<?php 
		if (!isset($MODULE_OUTPUT["allow_empty_theme"]) || !$MODULE_OUTPUT["allow_empty_theme"]) { ?><p>
		<label class="block wide"><strong>����:</strong></label>
		<select name="<?=$NODE_ID?>[save_post][post_category]" value="<?=$data["post_category"]?>" maxlength="2" size="1">
			<option></option>
<?php			if (!empty($data["categories"])) {
					foreach($data["categories"] as $category ) { ?>
			<option <?=(!is_null($data["post_category"]) && $category==$data["post_category"] ? "selected='selected'" : "")?> value="<?=$category?>"><?=$category?></option>
<?php				}
				} ?>
		</select>
	</p>
	<?php } else { ?>
	<input name="<?=$NODE_ID?>[save_post][post_category]" type="hidden" value="" />
	<?php } ?>
	<p>
		<label><strong>����� �������<span class="hint" title="������������ ��� ���������� ����">*</span>:</strong></label><br />
		<textarea name="<?=$NODE_ID?>[save_post][post_text]" cols="50" rows="3" class="common"><?=$data["post_text"]?></textarea>
	</p>
	<p>
		<label class="block wide"><strong>��� �����������<span class="hint" title="������������ ��� ���������� ����">*</span>:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[save_post][author_name]" value="<?=$data["author_name"]?>" class="block text" />
	</p>
	<p>
		<label class="block wide"><strong>������� �����������:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[save_post][phone]" value="<?=$data["phone"]?>" class="block text" />
	</p>
	<p>
		<label class="block wide"><strong>E-mail �����������:</strong></label>
		<input type="text" name="<?=$NODE_ID?>[save_post][email]" value="<?=$data["email"]?>" class="block text" />
	</p>
	<p>
		<label class="block wide"><strong>����� ������:</strong></label> <input type="text" name="<?=$NODE_ID?>[save_post][response_day]" value="<?=$data["response_day"]?>" maxlength="2" size="2" />.<input type="text" name="<?=$NODE_ID?>[save_post][response_month]" value="<?=$data["response_month"]?>" maxlength="2" size="2" />.<input type="text" name="<?=$NODE_ID?>[save_post][response_year]" value="<?=$data["response_year"]?>" maxlength="4" size="4" />, <input type="text" name="<?=$NODE_ID?>[save_post][response_hours]" value="<?=$data["response_hours"]?>" maxlength="2" size="2" />:<input type="text" name="<?=$NODE_ID?>[save_post][response_minutes]" value="<?=$data["response_minutes"]?>" maxlength="2" size="2" /><br />
		<small>(������ �������� ������������� ���������� �� ������� ����/�����)</small>
	</p>
	<input type="hidden" name="<?=$NODE_ID?>[save_post][response_seconds]" value="<?=$data["response_seconds"]?>" />
	<p>
		<label><strong>����� ������:</strong></label><br />
		<small>(����� ���� �������� ������, ���� �� ������ ������ ��������������� ��� ������)</small><br />
		<textarea name="<?=$NODE_ID?>[save_post][response_text]" cols="50" rows="3"<? //class="wysiwyg"?>><?=$data["response_text"]?></textarea>
	</p>
	<p><input type="submit" value="���������/��������" /> <input type="reset" value="�����" /> <input type="submit" name="<?=$NODE_ID?>[cancel]" value="������" /></p>
</form>
<?php 		}
		}

		if (count($pager_output["pages_data"]) > 1) { // ���� ���� ��� ��������, � ������� ������ ����� ?>
		<div class="pager">
			<p>
				<strong>��������:</strong>
<?php		if($pager_output["prev_page"]) { ?>
				<a href="<?=$pager_output["pages_data"][$pager_output["prev_page"]]["link"]?>" title="���������� ��������" class="prev-next-link">
					<span class="arrow">&larr;&nbsp;</span>����������
				</a>
<?php		} else { ?>
				<span class="prev-next-link"><span class="arrow">&larr;&nbsp;</span>����������</span>
<?php		}
			if($pager_output["prev_page"]) { ?>
				<a href="<?=$pager_output["pages_data"][$pager_output["next_page"]]["link"]?>" title="��������� ��������" class="prev-next-link">
					���������<span class="arrow">&nbsp;&rarr;</span>
				</a>
<?php		} else { ?>
				<span class="prev-next-link">���������<span class="arrow">&nbsp;&rarr;</span></span>
<?php		} ?>
			</p>
			<p>
<?php		foreach ($pager_output["pages_data"] as $page => $data) {
				if (is_int($page)) { ?>
				<?=($data["is_current"] ? "<span class='active item'>" : "<a href='".$data["link"]."' class='item'>")?><?=$page?><?=($data["is_current"] ? "</span>" : "</a>")?>&nbsp;
<?php			} else { ?>
				&hellip;
<?php			}
			} ?>
			</p>
		</div>
<?php	}
	}
	break;
}


if (!isset($MODULE_OUTPUT["display_variant"]) || (isset($MODULE_OUTPUT["display_variant"]) && $MODULE_OUTPUT["display_variant"] != "edit_post")) { ?>
		<h2 class="menu2">������ ������</h2>
		<div class="pusher"></div>
		<form id="add_post" method="post">
			<p>
				<label class="block">���� ���<span class="hint" title="������������ ��� ���������� ����">*</span>:</label><br />
				<input name="<?=$NODE_ID?>[name]" maxlength="255" value="<?=$MODULE_OUTPUT["name"]?>" class="block text" />
			</p>
			<p>
				<label class="block">��� �������:</label><br />
				<input name="<?=$NODE_ID?>[phone]" maxlength="16" value="<?=$MODULE_OUTPUT["phone"]?>" class="block text" />
			</p>
			<p>
				<label class="block">E-mail:</label><br />
				<input name="<?=$NODE_ID?>[email]" maxlength="255" value="<?=$MODULE_OUTPUT["email"]?>" class="block text" />
			</p>
			<?php 
		if (!isset($MODULE_OUTPUT["allow_empty_theme"]) || !$MODULE_OUTPUT["allow_empty_theme"]) { ?>
		<p>
				<label class="block">����:</label><br />
				<select name="<?=$NODE_ID?>[category]" maxlength="255" value="<?=$MODULE_OUTPUT["category"]?>" class="block text">
				<? if (isset($MODULE_OUTPUT["allow_empty_theme"]) && $MODULE_OUTPUT["allow_empty_theme"]) { ?><option value=""></option><? };
					if (!empty($MODULE_OUTPUT["categories"])) {
						foreach($MODULE_OUTPUT["categories"] as $category) { ?>
							<option value="<?=$category?>"><?=$category?></option>
				<?php 		}
				}
				?>
				</select>
			</p>
			<?php } else { ?>
			<input name="<?=$NODE_ID?>[category]" type="hidden" value="" />
			<?php } ?>
			<p>
				<label>�����<span class="hint" title="������������ ��� ���������� ����">*</span>:</label><br />
				<textarea name="<?=$NODE_ID?>[post]" cols="50" rows="3" class="common"><?=$MODULE_OUTPUT["post"]?></textarea>
			</p>
			<p>
				<label>��� �������������<span class="hint" title="������������ ��� ���������� ����">*</span>:</label><br />
				<small>����������, ������� �������� ���, ��������� ��&nbsp;��������.</small><br /><br />
				<input name="<?=$NODE_ID?>[code]" maxlength="5" value="" class="code block"  />
				<img src="<?=$MODULE_OUTPUT["captcha_uri"]?>" alt="" class="block" style="vertical-align: middle;" valign="middle"/>
				<input type="submit" value="���������" class="block after-code" />
			</p>
		</form>
<?php
}
?>