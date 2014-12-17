<?php

$MODULE_OUTPUT = $MODULE_DATA["output"];

/*if ($MODULE_OUTPUT["messages"]["good"])
{
    $array = array();

    foreach ($MODULE_OUTPUT["messages"]["good"] as $elem)
    {
        if (isset($MODULE_MESSAGES[$elem]))
        {
            $array[] = $MODULE_MESSAGES[$elem];
        }
    }

    if ($array)
    {
        foreach ($array as $elem)
        {
            echo "<p class=\"message\">$elem</p>\n";
        }
    }
}


if ($MODULE_OUTPUT["messages"]["bad"] && isset($MODULE_OUTPUT["display_variant"]) && !in_array($MODULE_OUTPUT["display_variant"], array("add_item", "edit_item")))
{
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
        foreach ($array as $elem)
        {
            echo "<p class=\"message red\">$elem</p>\n";
        }
    }
}*/

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

/*if(!isset($_GET["secrett"]))
	exit(1);*/

if (isset($MODULE_OUTPUT['requests_info'])) {
	$requests_info = $MODULE_OUTPUT['requests_info'];
	$updateDate = $MODULE_OUTPUT["date"];
?>
	<h2 style="text-align: center;">Информация о количестве поданных заявлений в разрезе <?=($MODULE_OUTPUT["mode"] == "spo"? "специальностей" :"направлений (специальностей)")?> на <?=$updateDate?>г.</h2>
	<table style="border-collapse: separate;" border="1" cellspacing="1" cellpadding="1" width="620" align="center">
	<tbody>
	<tr>
	<td style="width: 50px;" align="center" valign="middle" bgcolor="#f9dfc5">
	<div>Код</div>
	</td>
	<td align="center" valign="middle" bgcolor="#f9dfc5"><?=($MODULE_OUTPUT["mode"] == "spo" ? "Специальность" : "Направление (специальность)")?></td>
	<td bgcolor="#f9dfc5">
	<p style="text-align: center;">Кол-во бюджетных мест</p>
	</td>
	<td bgcolor="#f9dfc5">
	<p style="text-align: center;">Кол-во коммерческих мест</p>
	</td>
	<td style="width: 20px;" align="center" valign="middle" bgcolor="#f9dfc5">
	<div>Кол-во поданных заявлений</div>
	</td>
	<td style="background-color: #f9dfc5;">&nbsp;Конкурс</td>
	</tr>
<?

foreach ($requests_info as $faculty_name=>$faculty_info) {
	if ($MODULE_OUTPUT["mode"] != "spo" || $faculty_name == "sum") {
?>
	<tr style="background-color: #ccff33;">
	<td style="text-align: center;" colspan="2"><strong><?=($faculty_name!='sum'? $faculty_name :'Итого'.($MODULE_OUTPUT["mode"] == "spo" ? "" : " по университету"))?></strong></td>
	<td style="text-align: center;"><strong><?=$faculty_info['budget']?></strong><br /></td>
	<td style="text-align: center;"><strong><?=$faculty_info['commerce']?></strong><br /></td>
	<td><div style="text-align: center;"><strong><?=$faculty_info['req_count']?></strong></div></td>
	<td style="text-align: center;"><?=($faculty_info['contest']?:'');?></td>
	</tr>

<?
}
	foreach ($faculty_info['specs'] as $spec_info) {
?>
	<tr style="text-align:center">
	<td>
	<div><a href="/entrant/list/?type=<?=$spec_info->id?>"><?=$spec_info->code?></a></div>
	</td>
	<td style="text-align: left;" height="20"><a href="<?=$MODULE_OUTPUT['abit_list_base_href'].$spec_info->id?>"><?=trim($spec_info->type)?></a></td>
	<td style="text-align: center;"><?=$spec_info->budget?></td>
	<td style="text-align: center;"><?=$spec_info->commerce?></td>
	<td style="text-align: center;"><?=$spec_info->req_count?></td>
	<td style="text-align: center;"><?=($spec_info->contest?:'')?></td>
	</tr>
<?
	}
}
?>
	</table>
<?
} else if (isset($MODULE_OUTPUT['edit_info'])) { 
?>
	<div style="margin: 0 auto; padding-top: 20px; width: 625px">
	<form action="<?=$MODULE_OUTPUT['uri']?>" method="post" onsubmit="javascript: return do_submit()">
	<input type="hidden" id="post_data" name="data_str" value="">
	<table id='types_info' style="border-collapse: separate;" border="1" cellspacing="1" cellpadding="1" width="620" align="center">
	<tbody>
	<tr>
	<td align="center" valign="middle" bgcolor="#f9dfc5">Код</td>
	<td align="center" valign="middle" bgcolor="#f9dfc5">Направление (специальность)</td>
	<td bgcolor="#f9dfc5">
	<p style="text-align: center;">Кол-во бюджетных мест</p>
	</td>
	<td bgcolor="#f9dfc5">
	<p style="text-align: center;">Кол-во коммерческих мест</p>
	</td>
	<td bgcolor="#f9dfc5">
	<p style="text-align: center;">Кол-во целевых мест</p>
	</td>
	</tr>
<?	
$faculty_ind = 0;
foreach ($MODULE_OUTPUT['edit_info'] as $faculty_name=>$faculty_info) {
	$faculty_ind++;
?>
	<tr style="background-color: #ccff33;">
	<td colspan="2"><strong><?=($faculty_name!='sum'? $faculty_name :'Итого по университету')?></strong></td>
	<td style="text-align: center; font-weight: bold;" id="<?=($faculty_name!='sum'?$faculty_ind:'sum').'_budget'?>"><?=$faculty_info['budget']?></td>
	<td style="text-align: center; font-weight: bold;" id="<?=($faculty_name!='sum'?$faculty_ind:'sum').'_commerce'?>"><?=$faculty_info['commerce']?></td>
	<td style="text-align: center; font-weight: bold;" id="<?=($faculty_name!='sum'?$faculty_ind:'sum').'_purpose'?>"><?=$faculty_info['purpose']?></td>
	</tr>
<?
	foreach ($faculty_info['specs'] as $spec_info) {
?>
	<tr style="text-align:center">
	<td style="text-align: left;" height="20"><?=trim($spec_info->code)?></td>
	<td style="text-align: left;" height="20"><?=trim($spec_info->type)?></td>
	<td style="text-align: center;"><?=$MODULE_OUTPUT["auth"]?'<input class="info_cell" type="text" id="'.$faculty_ind.'_budget_'.$spec_info->id.'" style="text-align:center; width:40px; border: 1px solid;" value="'.$spec_info->budget.'"/>':$spec_info->budget?></td>
	<td style="text-align: center;"><?=$MODULE_OUTPUT["auth"]?'<input class="info_cell" type="text" id="'.$faculty_ind.'_commerce_'.$spec_info->id.'" style="text-align:center; width:40px; border: 1px solid;" value="'.$spec_info->commerce.'"/>':$spec_info->commerce?></td>
	<td style="text-align: center;"><?=$MODULE_OUTPUT["auth"]?'<input class="info_cell" type="text" id="'.$faculty_ind.'_purpose_'.$spec_info->id.'" style="text-align:center; width:40px; border: 1px solid;" value="'.$spec_info->purpose.'"/>':$spec_info->purpose?></td>
	</tr>
<?
	}
}
?>
</table>
<? if ($MODULE_OUTPUT["auth"]) { ?>
<div style="margin-top:10px; text-align: right;"><input type="submit"  value="Сохранить" /></div>

<script>
setKeyboardHandlers();
</script>
<? } ?>
</form>
</div>
<?
} elseif (isset($MODULE_OUTPUT["daystogo"]) && $MODULE_OUTPUT["daystogo"]) {
	echo "<span id=\"tillend\">".$MODULE_OUTPUT["daystogo"]."</span>";
} elseif (isset($MODULE_OUTPUT["abitfile"])) {
	?>
		<h1>Данные об абитуриентах</h1><form <? if (count($MODULE_DATA["output"]["messages"]["good"])) { ?>style="display: none;"<? } ?> action="/office/abit/" method="post" name="abitform" id="abitform" enctype="multipart/form-data"><p>Путь к csv-файлу:<br><input type="file" name="abit" size="40"></p>
		<input name="spo" type="checkbox" /> СПО<br /><input type="submit" size="20" value="Готово" /></form>
			<?
}
else {
?>
<select onchange="location.href=this.options[this.selectedIndex].value">
<option value="">Укажите направление</option>
<?
	foreach($MODULE_OUTPUT["types"] as $type)
	{
		if(isset($_GET["type"]) && ($type["id"] == $_GET["type"]))
			$selected = " selected=\"selected\"";
		else
			$selected = "";

		$parts = explode(".", $type["code"]);
		if (isset($parts[1]) && $parts[1]=="51")
			$type["type"] .= " (СПО)";
?>
<option value="?type=<?=$type["id"]?>"<?=$selected?>><?=$type["code"]?> - <?=$type["type"]?></option>
<?
	}
?>
</select>
<?

if(isset($_GET["type"]))
{
	 ?>
	 <p><strong>Данные на <?=$MODULE_OUTPUT['date']?>г.</strong><br/></p>
	 <p>Полный пофамильный перечень лиц, зачисление которых рассматривается приёмной комиссией университета в число студентов 1 курса.</p>
	 <!-- <p><i>Примечание: бюджетные места абитуриентов, рекомендованных к зачислению и не сдавших оригинал аттестата (диплома) до 04.08.2010 г. распределяются
	 нижестоящим по ранжированному списку лицам, сдавшим оригиналы аттестатов (дипломов).</i></p> -->
	 <h3 style="text-align: center;"><?=$MODULE_OUTPUT["type"]["code"]?> <?=$MODULE_OUTPUT["type"]["type"]?></h3>
	 <p align="center"><strong>Общее количество бюджетных мест: <?=$MODULE_OUTPUT["type"]["budget"]?>
	 <?php
	if(0 && $MODULE_OUTPUT["type"]["purpose"] > 0)
	{
	?>	
	(в&nbsp;том числе целевой приём: <?=$MODULE_OUTPUT["type"]["purpose"]?>)
	<?
	}
	?>
	</strong></p>
	<table style="margin-left: 2em;">
	<?
	$category_prev = "";
	$i = 1;
	foreach($MODULE_OUTPUT["people"] as $man)
	{	
	    $category = $man["descr"];
	    if(!empty($man["notice"]))
	    {
		    if($man["position"] == 4)
		    {
		    	if($man["notice"] == "Сироты и инвалиды")
		    	{
	    			$category = "вне конкурса (дети-сироты, инвалиды)";
	    			$notice = "";
				}
	    		else
	    			$notice = " (".$man["notice"].")";
			}
			else
			if($man["acceptance"] == "Зачислен")
			    $notice = "";
			else
				$notice = " (".$man["notice"].")";
	    	
		}
		else
			$notice = "";
	    if($category_prev != $category)
	    {
	    ?>
	    	<tr><td colspan="3"><strong><?=$category?></strong></td></tr>
	    <?
		}			
	    ?>
	    <tr><td><?=$i.".&nbsp;"?>
		
	    <?php if(/*$man["acceptance"] == "Рекомендован" || $man["acceptance"] == "Зачислен"*/ ($i<=$MODULE_OUTPUT["type"]["budget"] || $man["dogovor"]=="заключен") && $man["qualification"]!="51") echo "<strong>"; ?>
	    <a href="/people/<?=$man["id"]?>/"
	    <?php if(/*$man["acceptance"] == "Рекомендован"*/0) echo " title=\"Рекомендован к зачислению\""; ?>
	    ><?=$man["last_name"]?> <?=$man["name"]?> <?=$man["patronymic"]?></a>
	    <?php if($man["acceptance"] == "Рекомендован" || $man["acceptance"] == "Зачислен") echo "</strong>"?>
	    </td><td> 
	    <?=$man["ege"]?></td><td>
	    <?php if(/*$man["acceptance"] != "Зачислен"*/1) { ?>
	    <?=$man["documents"]?><?=$notice?>
	    <?php } ?>
	    <?php if(($man["acceptance"] == 1 || $man["acceptance"] == 2) && $man["position"]==1) echo "<strong><font color=\"green\">Зачислен</font></strong>";?>
	    </td></tr>
	    <?php
	    $i++;
	    $category_prev = $category;
	}
	?>
	</table>
	<?

}  // if
else
{
	1;
} // else

}
?>
</tbody>
</table>