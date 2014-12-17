<?php

$MODULE_OUTPUT = $MODULE_DATA["output"];

	if(!function_exists("OutPutGroups"))
	{
		function OutPutGroups($array)
		{
		//die(print_r($array[3]));
			echo "<ul>";
			foreach($array as $id => $item)
			{
				if ($array[$id]["manage_groups"]) {
					echo "<li>".$item["descr"]." <a href=\"edit_menugroup/".$id."/\"<img src=\"/themes/images/edit.png\" border=\"0\"><br />";
					echo "[<a href=\"add/".$id."/0/\" title=\"������� ����� ������ &laquo;".$item["descr"]."&raquo;\" style=\"cursor: pointer;\">������� �����</a>]&nbsp;";

					echo "</li>\n";
					if(!empty($item["subitems"]))
						OutPutItems($item["subitems"]);
				}
			}    
			echo "</ul>";
		}
	}

	if(!function_exists("OutPutItems"))
	{
		function OutPutItems($array)
		{
		
			$displayed = 0;
			echo "<ul>";
		foreach($array as $id => $item)
		{
			if (!$uri = $item["direct_link"])
				$uri = $item["uri"];
			
			if($item["is_active"])
				echo "<li><a href=\"".$uri."\" title=\"".$item["descr"]."\">".$item["title"]."</a>";
			else
				if($item["manage_items"])
					echo "<li><a href=\"".$uri."\" title=\"".$item["descr"].".\" style=\"color: grey;\">".$item["title"]."</a>";
			
			if (count($array) > 1)
				echo "&nbsp;[&nbsp;";
			
			if($item["manage_items"])
			{
				if ($displayed)
					echo "<a href=\"posup/".$id."/\" title=\"����������� �� ���� ������� �����\">&uarr;</a>&nbsp;";
				if ($displayed < count($array) - 1)
					echo "<a href=\"posdown/".$id."/\" title=\"����������� �� ���� ������� ����\">&darr;</a>&nbsp;";
				$displayed++;
			}
						
			if (count($array) > 1)
				echo "]";
			echo "<br /><small>";
			
			if($item["manage_items"])
			{
				if($item["is_active"])
					echo "[<a href=\"hide/".$id."/\" title=\"�� ���������� ������ ����� �����������\">������</a>]&nbsp;";
				else            
					echo "[<a href=\"show/".$id."/\" title=\"�������� ������ ����� �����������\">��������</a>]";
			}
			
			if($item["manage_items"])
			{
				echo "[<a href=\"add/".$item["group_id"]."/".$id."/\" title=\"������� �������� ��� ������ &laquo;".$item["title"]."&raquo;\" style=\"cursor: pointer;\">������� ��������</a>]&nbsp;";
			}
			
			if($item["manage_items"])
			echo "[<a href=\"edit/".$id."/\" title=\"������������� �������� ������ &laquo;".$item["title"]."&raquo;\">�������������</a>]&nbsp;";
			
			if($item["manage_items"] && $id)
				echo "[<a href=\"delete/".$id."/\" title=\"�������\" onClick=\"return del(".$id.")\">�������</a>]";
			echo "</small>";
			echo "<div class=\"item_add\" id=\"add".$id."\"></div>";
			echo "</li>\n";
			if(!empty($item["subitems"]))
				OutPutItems($item["subitems"]);
			}
			echo "</ul>";
		}
	}
	
	if(!function_exists("OutPutFoldersOptions"))
	{
/*		function OutPutFoldersOptions($array, $selected_id = NULL)
		{
			foreach($array as $id => $item)
			{
				$sel_attr = "";
				if ($id == $selected_id) { $sel_attr = " selected"; }
				echo "<option value=\"".$id."\"".$sel_attr.">".$item["descr"]."</option>";
				if(!empty($item["subitems"]))
					OutPutFoldersOptions($item["subitems"], $selected_id);
			}
		}*/
		
		function OutPutFoldersOptions($array, $selected_id  = NULL, $depth = 0)
		{
			//die(print_r($array));
			$displayed = 0;
			$level = "";
			for ($i = $depth; $i > 0; $i--)
				$level .= '-';
			
			foreach($array as $id => $item)
			{		
				if ($id == $selected_id)
					$selected = " selected";
				else
					$selected = "";
			
				if($item["is_active"])
					echo "<option value=\"".$id."\"".$selected.">".$level." ".$item["title"]."</option>";
				else
					echo "<option value=\"".$id."\"".$selected.">".$level." ".$item["title"]." (�� �������)</option>";
				
			if(!empty($item["subitems"]))
				OutPutFoldersOptions($item["subitems"], $selected_id, $depth+1);
			}
		}
	}


switch ($MODULE_DATA["output"]["mode"])
	{
		case "manage":
		
			if(!empty($MODULE_OUTPUT["groups"]))
			{
				echo "<h2>������ ����</h2>";
				OutPutGroups($MODULE_OUTPUT["groups"]);
				/*if($MODULE_OUTPUT["manage_groups"])  //���������� ������ ���� - �� �������
				{        
					echo "<i>[<a style=\"cursor: pointer;\" onClick=\"return add(0)\">�������� ������</a>]</i>\n";
					echo "<div class=\"group_add\" id=\"add0\"></div>\n";	
				};*/
			}
			
			if(!empty($MODULE_OUTPUT["folders"]) && !isset($MODULE_OUTPUT["menu_item"]))
			{
				echo "<h2>���������� ������ ����</h2><br />";
				
				echo "<form action=\"".$EE["unqueried_uri"]."\" method=\"post\" enctype=\"multipart/form-data\">
				<input name=\"pid\" type=\"hidden\" value=\"".$MODULE_OUTPUT["pid"]."\">
				<input name=\"group_id\" type=\"hidden\" value=\"".$MODULE_OUTPUT["group_id"]."\">
                <strong>��������������� ��������:</strong><br />
				<select name=\"folder_id\" size=1 />";
				
				
				OutPutFoldersOptions($MODULE_OUTPUT["folders"]);
				
				echo "</select><br /><br />
				<div id=\"linkshow\"><a style=\"cursor: pointer\" onclick=\"document.getElementById('addfields').style.display='block'; document.getElementById('linkhide').style.display='block'; document.getElementById('linkshow').style.display='none';\">�������� �������������� ����</a></div>
				<div id=\"linkhide\" style=\"display: none;\"><a style=\"cursor: pointer\" onclick=\"document.getElementById('addfields').style.display='none'; document.getElementById('linkshow').style.display='block'; document.getElementById('linkhide').style.display='none';\">������ �������������� ����</a></div>
				<br />
				<fieldset id=\"addfields\" style=\"display:none; width: 500px;\">
				<legend>������������� ��� ����������</legend>
				<strong>��������:</strong><br /><input name=\"title\" type=\"text\"><br />
                <strong>�������� (����������� ���������):</strong><br /><input name=\"descr\" type=\"text\"><br />
				<strong>������ ������:</strong><br /><input name=\"direct_link\" type=\"text\"><br />
				<strong>������:</strong><br /><input name=\"attach\" type=\"file\"><br />
				</fieldset>
				<input type=\"Submit\" value=\"�������� �����\">
                </form>";				
			}
			
			if (isset($MODULE_OUTPUT["menu_item"]))
			{
			?>
			<h2>�������������� ������ ����</h2>
			<form action="<?=$EE["unqueried_uri"]?>" method="post" enctype="multipart/form-data">
			<p>
			<strong>��������������� ��������:</strong><br />
			<select name="<?=$NODE_ID?>[save][folder_id]" size=1 />
			<?php

			OutPutFoldersOptions($MODULE_OUTPUT["folders"], $MODULE_OUTPUT["menu_item"]["folder_id"]);
			
			?>
			</select>
			</p>
			<div id="linkshow"><a style="cursor: pointer" onclick="document.getElementById('addfields').style.display='block'; document.getElementById('linkhide').style.display='block'; document.getElementById('linkshow').style.display='none';">�������� �������������� ����</a></div>
			<div id="linkhide" style="display: none;"><a style="cursor: pointer" onclick="document.getElementById('addfields').style.display='none'; document.getElementById('linkshow').style.display='block'; document.getElementById('linkhide').style.display='none';">������ �������������� ����</a></div>
			<br />
			<fieldset id="addfields" style="display:none; width: 500px;">
			<legend>������������� ��� ����������</legend>
				<p>
				��������:<br />
				<input name="<?=$NODE_ID?>[save][title]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["title"]?>">
				</p>
				<p>
				�������� (����������� ���������):<br />
				<input name="<?=$NODE_ID?>[save][descr]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["descr"]?>">
				</p>
				<p>
				������ ������:<br />
				<input name="<?=$NODE_ID?>[save][direct_link]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["direct_link"]?>">
				</p>
				<p>
				<strong>������ (�������� ��� ���� ������, ���� �� ������ ������ ������):</strong><br /><input name="attach" type="file"><br />
				<input type="checkbox" name="<?=$NODE_ID?>[save][icon_delete]"> ������� ������<br />
				</p>
			</fieldset>
			<p>
			<input type="submit" value="���������">
			</p>
			</form>
			<?php
			}

		break;
		
		case "edit":
			?>
			<h2>�������������� ������ ����</h2>
			<form action="<?=$EE["unqueried_uri"]?>" method="post" enctype=\"multipart/form-data\">
			<p>
			<strong>��������������� ��������:</strong><br />
			<select name=\"<?=$NODE_ID?>[save][folder_id]\" size=1 />
			<?php
				
			OutPutFoldersOptions($MODULE_OUTPUT["folders"], $MODULE_OUTPUT["menu_item"]["folder_id"]);
			
			?>
			</select>
			</p>
			<fieldset name="�������������">
				<p>
				��������:<br />
				<input name="<?=$NODE_ID?>[save][title]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["title"]?>">
				</p>
				<p>
				�������� (����������� ���������):<br />
				<input name="<?=$NODE_ID?>[save][descr]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["descr"]?>">
				</p>
				<p>
				������ ������:<br />
				<input name="<?=$NODE_ID?>[save][direct_link]" type="text" value="<?=$MODULE_OUTPUT["menu_item"]["direct_link"]?>">
				</p>
			</fieldset>
			<p>
			<input type="submit" value="���������">
			</p>
			</form>
			<?php
		break;
        
		case "edit_menugroup":
		?>
		<h2>�������������� ������ ����</h2>
		<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>
			��������:<br />
			<input name="<?=$NODE_ID?>[save][descr]" type="text" class="input_long" value="<?=$MODULE_OUTPUT["menu_group"]["descr"]?>">
			</p>
			<p>
			<input type="submit" value="���������">
			</p>
		<?
		break;
        
        case "submenu":
            {             
                function print_array($ar) {
                    static $count; 
                    $count = (isset($count)) ? ++$count : 0;
                    if (!is_array($ar)) {
                        return; 
                    }
                    if(!$count) {
                    ?>
                    <ul class="main">
                    <?php
                    } else {
                    ?>
                    <ul>
                    <?php
                    }
                    foreach($ar as $data) {
						if(isset($data["submenu"])) {
							//echo "<li class=\"submenu_li\">";
							echo $data["uri_is_current"] ?"<li class=\"submenu_li active\"><a href=\"{$data["uri"]}{$data["uri_part"]}/\" class=\"active\" title=\"{$data["descr"]}\">" : "<li class=\"submenu_li\"><a href=\"{$data["uri"]}{$data["uri_part"]}/\" title=\"{$data["descr"]}\">";
							echo $data["title"];
							echo "</a>";
							print_array($data["submenu"]); 
						} else {
							echo "<li>";
							echo $data["uri_is_current"] ?"<a href=\"{$data["uri"]}{$data["uri_part"]}/\" class=\"active\" title=\"{$data["descr"]}\">" : "<a href=\"{$data["uri"]}{$data["uri_part"]}/\" title=\"{$data["descr"]}\">";
							echo $data["title"];
							echo "</a>";
						}
                        echo "</li>\n";      
                    }
                    echo "</ul>";
                    $count--;
                } 
                print_array($MODULE_OUTPUT["items"]);
                break;
            }
        
  
		default: {
			
			if (0) { /* ���� ������� �������� ���� ���� */
				echo "<ul class=\"nav\" id=\"horiznav\">\n";
				foreach ($MODULE_OUTPUT["items"] as $data) { /* ����� ������� ��������� ���� */
					echo "<li><span class=\"top\">";
					echo $data["uri_is_current"] ? "<a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">" : "<a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">";
					if(!empty($data["options"]["icon"]))
						echo "<img src=\"/files/icons/".$data["options"]["icon"]."\">"; /* ������ */
					echo $data["title"];
					echo "</a>";
					if ($data["subitems"]) {
						echo "<ul>\n";
						foreach ($data["subitems"] as $data2) { 
							echo $data2["uri_is_current"] ? "<li class=\"active\"><a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">" : "<li><a href=\"{$data2["uri"]}\" title=\"{$data2["descr"]}\">";
							echo $data2["title"];
							echo "</a>";
							
							if ($data2["subitems"]) {
								echo "<ul>\n";
								foreach ($data2["subitems"] as $data3) { 
									echo $data3["uri_is_current"] ? "<li class=\"active\"><a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">" : "<li><a href=\"{$data3["uri"]}\" title=\"{$data3["descr"]}\">";
									echo $data3["title"];
									echo "</a></li>\n";
								}
								echo "</ul>";
							}
								
							echo "</li>\n";
						}
						echo "</ul>";
					}
					echo "</span></li>\n";
				}
				echo "</ul>\n";
			}
			
			
			else {
				echo "<ul>\n";
				foreach ($MODULE_OUTPUT["items"] as $data) { /* ����� ������� ��������� ���� */
					echo "	<li>";
					echo $data["uri_is_current"] ? "<a href=\"{$data["uri"]}\" class=\"active\" title=\"{$data["descr"]}\">" : "<a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">";
					if(!empty($data["options"]["icon"]))
						echo "<img src=\"/files/icons/".$data["options"]["icon"]."\">"; /* ������ */
					echo $data["title"];
					echo "</a>";
					if ($data["subitems"]) {
						echo "<ul>\n";
						foreach ($data["subitems"] as $data2) { 
							echo $data2["uri_is_current"] ? "<li><a href=\"{$data["uri"]}\" class=\"active\" title=\"{$data["descr"]}\">" : "<li><a href=\"{$data2["uri"]}\" title=\"{$data2["descr"]}\">";
							echo $data2["title"];
							echo "</a>";
							
							if ($data2["subitems"]) {
								echo "<ul>\n";
								foreach ($data2["subitems"] as $data3) { 
									echo $data3["uri_is_current"] ? "<li><a href=\"{$data["uri"]}\" class=\"active\" title=\"{$data["descr"]}\">" : "<li><a href=\"{$data3["uri"]}\" title=\"{$data3["descr"]}\">";
									echo $data3["title"];
									echo "</a></li>\n";
								}
								echo "</ul>";
							}
								
							echo "</li>\n";
						}
						echo "</ul>";
					}
					echo "</li>\n";
				}
				echo "</ul>\n";
				break;
			}
		}
	}
	
?>