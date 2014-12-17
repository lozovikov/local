<?php

switch ($EE["language"])
{
	case "en":
		$LANGUAGE["polls"] = array(
			"title" => "Our polls",
			"vote" => "Vote",
			"poll_voted" => "Your vote has been accepted. Thank&nbsp;you!",
			"poll_completed" => "This polling is&nbsp;already finished. Thanks for those who casted their votes!",
			"results" => "polling results",
			);
		break;

	default:
		$LANGUAGE["polls"] = array(
			"title" => "Наш опрос",
			"vote" => "Голосовать",
			"poll_voted" => "Ваш голос по&nbsp;данному опросу был принят, спасибо!",
			"poll_completed" => "Данный опрос уже завершён. Спасибо всем, кто принял в&nbsp;нём участие!",
			"results" => "Результаты",
			);
		break;
}

switch ($MODULE_OUTPUT["mode"])
{
	case "poll":
?>
<!-- <h2 class="ball"><span class="right"><span class="line-wrapper"><span class="line"><?=$LANGUAGE["polls"]["title"]?></span></span></span></h2>-->
<? if (isset($MODULE_OUTPUT["poll_set_title"]))
	echo "<h2>".$MODULE_OUTPUT["poll_set_title"]."</h2><br />";
?>

<?php
		switch ($MODULE_OUTPUT["display_mode"])
		{
			case "choices":
			
?>
<h3 class="top-sticky"><span id='titleBlock'><?=(count($MODULE_OUTPUT["choices"])>1 ? "1. " : "").$MODULE_OUTPUT["title"][0]?></span></h3><br />
<div>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
<?php

				$num = count(current($MODULE_OUTPUT["choices"]));
				$i = 0;
				echo "<div id='choicesBlock'>";
				foreach (current($MODULE_OUTPUT["choices"]) as $key => $data)
				{
					echo  "<label><input class=\"voteOpt\" type=\"radio\" name=\"" . $NODE_ID . "[vote][choice]\" value=\"" . $key . "\" /> " . $data["title"] . "</label>";

					if (++$i != $num)
					{
						//echo "<br />";
					}

					echo "\n";
				}
				echo "</div>";

?>
	<div id="loadingBlock" ><img src='/<?=THEMES_DIR.IMAGES_DIR?>loading.gif' /></div>
	<h3 id="afterPollBlock"><strong>Спасибо за участие в опросе!</strong></h3>
	<p><input id="voteButton" type="submit" value="<?=$LANGUAGE["polls"]["vote"]?>" />&nbsp;&nbsp;&nbsp;&nbsp;<input id='resultsButton' style="display:<?=(count($MODULE_OUTPUT["choices"])>1 ? "none" : "block")?>" type="button" onclick="document.location.href='<?=$MODULE_OUTPUT['results_link']?>'" value="<?=$LANGUAGE["polls"]["results"]?>" /></p>
</form>
</div>
<?php
				break;


			case "voted":
?>
<p><br /><?=$LANGUAGE["polls"]["poll_voted"]?></p>
<p><input type="button" onclick="document.location.href='<?=$MODULE_OUTPUT['results_link']?>'" value="<?=$LANGUAGE["polls"]["results"]?>" /></p>
<?php
				break;


			case "ended":
?>
<p><strong><?=( isset($MODULE_OUTPUT["poll_set_title"]) ? $MODULE_OUTPUT["poll_set_title"] : $MODULE_OUTPUT["title"][0])?></strong></p>
<p><?=$LANGUAGE["polls"]["poll_completed"]?></p>
<p><strong><a href="<?php echo $MODULE_OUTPUT["results_link"] . "#poll_" . $MODULE_OUTPUT["issue_id"]; ?>"><?=$LANGUAGE["polls"]["results"]?> &raquo;&raquo;</a></strong></p>
<?php
				break;
		}
		
		/*if ($MODULE_OUTPUT["allow_handle"])
			echo "	<form name='pollHandler' action='".$MODULE_OUTPUT["results_link"]."' method='post'>
					<input type='hidden' name='issue_id' value='".(isset($MODULE_OUTPUT["issue_id"]) ? $MODULE_OUTPUT["issue_id"] : '')."' />
					<input type='hidden' name='node_id' value='".$NODE_ID."' />
					<input type='hidden' name='folder_id' value='".$MODULE_OUTPUT["folder_id"]."' />
					<div class='caption'>
					<p>
					<a onclick='document.forms[\"pollHandler\"].submit(); return false;' href=''>[Редактировать]</a>
					</p>
					</div>
					</form>
				";*/
		
		
		break;

	case "add_issue": ?>
		<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<p>Страница результатов голосования:<br />
		<input type="text" name="<?=$NODE_ID?>[add_item][hidden_folder_id]" value="<?=$MODULE_OUTPUT["hidden_folder_id"]?>"></p>
		<p>Вид опроса:<br />
		<label><input onchange="document.getElementById('compoundPollChoiceForm').style.display='none'" type="radio" name="<?=$NODE_ID?>[add_item][is_compound_poll]" checked="checked" value="0" />Простой</label>
		<label><input onchange="document.getElementById('compoundPollChoiceForm').style.display='block'" type="radio" name="<?=$NODE_ID?>[add_item][is_compound_poll]" value="1" />Составной</label>
		</p>
		<div style="display:none" id="compoundPollChoiceForm">
		<label>Название опроса: <input type="text" name="<?=$NODE_ID?>[add_item][poll_set_new_name]" value="" /></label>
		<?php  if (isset($MODULE_OUTPUT['polls_sets']) && !empty($MODULE_OUTPUT['polls_sets'])) { ?>
			<select  name="<?=$NODE_ID?>[add_item][poll_set_id]" >
		<?php 
			foreach ($MODULE_OUTPUT['polls_sets'] as $ind=>$poll_set) {?>
				<option value="<?=$poll_set['id']?>"><?=$poll_set['name']?></option>
		<?php } ?>
			</select> 
		<?php } ?>
		</div>
		<p>Вопрос:<br />
		<input type="text" name="<?=$NODE_ID?>[add_item][title]" class="input_long"></p>
		<p>Начало <input type="text" name="<?=$NODE_ID?>[add_item][begin_day]" size="2" maxlength="2" value="<?=date("d")?>">.<input type="text" name="<?=$NODE_ID?>[add_item][begin_month]" size="2" maxlength="2" value="<?=date("m")?>">.<input type="text" name="<?=$NODE_ID?>[add_item][begin_year]" size="4" maxlength="4" value="<?=date("Y")?>"> года в <input type="text" name="<?=$NODE_ID?>[add_item][begin_hours]" size="2" value="<?=date("H")?>" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][begin_minutes]" size="2" value="<?=date("i")?>" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][begin_seconds]" size="2" value="<?=date("s")?>" maxlength="2">, окончание <input type="text" name="<?=$NODE_ID?>[add_item][end_day]" size="2" maxlength="2" value="<?=$MODULE_OUTPUT["day_end"]?>">.<input type="text" name="<?=$NODE_ID?>[add_item][end_month]" size="2" maxlength="2" value="<?=$MODULE_OUTPUT["month_end"]?>">.<input type="text" name="<?=$NODE_ID?>[add_item][end_year]" size="4" maxlength="4" value="<?=$MODULE_OUTPUT["year_end"]?>"> года в <input type="text" name="<?=$NODE_ID?>[add_item][end_hours]" size="2" maxlength="2" value="00">:<input type="text" name="<?=$NODE_ID?>[add_item][end_minutes]" size="2" value="00" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][end_seconds]" size="2" value="00" maxlength="2">.
		<p>Варианты ответов (1 вариант в строке!):<br>
		<textarea name="<?=$NODE_ID?>[add_item][choices]" cols="80" rows=10></textarea></p>
		<input type="hidden" name="<?=$NODE_ID?>[add_item][hidden_node_id]" value="<?=$MODULE_OUTPUT["hidden_node_id"]?>">
		<p><input type="submit" value="Добавить опрос" /></p>
		</form> <?
	break;

	case "full_list":
/*?>
<h2 class="ball top-sticky"><span class="right"><span class="line-wrapper"><span class="line">Наши опросы</span></span></span></h2>
<?php*/

		if ($MODULE_OUTPUT["issues"])
		{
		

			$sum_votes = 0;
			
			$results = current($MODULE_OUTPUT["issues"]);
				foreach ($results["results"] as $data2)
					$sum_votes += $data2['num_votes']; 

			if (isset($MODULE_OUTPUT["poll_set_title"]))
				echo "<h2><strong>".$MODULE_OUTPUT["poll_set_title"]."</strong></h2><br />";
			echo "<div><strong>Всего в опросе приняло участие ".$sum_votes." чел.</strong></div><br />";
		
			$i=0;
			foreach ($MODULE_OUTPUT["issues"] as $ind=>$data)
			{
				if (count($MODULE_OUTPUT["issues"])) $i++;
				echo "<a name=\"poll_" . $data["id"] . "\"></a>";
				echo "<div class=\"poll_header\"><h2>" .($i ? $i.". " : "").$data["title"] . "</h2></div>\n";
				echo "<table style=\"width: 300px; table-layout: fixed; \">\n";
				echo "	<col style=\"width: auto\" />\n";
				echo "	<col style=\"width: 5em\" />\n";
				
				
				
				foreach ($data["results"] as $data2)
				{
					echo "	<tr><th colspan=\"2\" style=\"padding-top: 0.7em; text-align: left\">" . $data2["title"] . "</th></tr>";
					echo "	<tr><td><div style=\"background: #5b0100; width: " . round($data2["percentage_votes"], 2) . "%; height: 1em\"></div></td><td style=\"color: #5b0100; text-align: right\"><strong>" . round($data2["percentage_votes"]) . "%</strong> (" . round($data2["num_votes"]) . ")</td></tr>\n";
				}

				echo "</table>\n<br />";
			}
		}
		
		if ($MODULE_OUTPUT["allow_handle"]) 
		{
			//echo "<h3>Редактировать голосование</h3>";
			?>
			<!-- <div id="addIssueFormCont">
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			<p>Вопрос:<br />
			<input type="text" name="<?=$NODE_ID?>[add_item][title]" class="input_long"></p>
			<p>Начало <input type="text" name="<?=$NODE_ID?>[add_item][begin_day]" size="2" maxlength="2" value="<?=date("d")?>">.<input type="text" name="<?=$NODE_ID?>[add_item][begin_month]" size="2" maxlength="2" value="<?=date("m")?>">.<input type="text" name="<?=$NODE_ID?>[add_item][begin_year]" size="4" maxlength="4" value="<?=date("Y")?>"> года в <input type="text" name="<?=$NODE_ID?>[add_item][begin_hours]" size="2" value="<?=date("H")?>" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][begin_minutes]" size="2" value="<?=date("i")?>" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][begin_seconds]" size="2" value="<?=date("s")?>" maxlength="2">, окончание <input type="text" name="<?=$NODE_ID?>[add_item][end_day]" size="2" maxlength="2" value="<?=$MODULE_OUTPUT["day_end"]?>">.<input type="text" name="<?=$NODE_ID?>[add_item][end_month]" size="2" maxlength="2" value="<?=$MODULE_OUTPUT["month_end"]?>">.<input type="text" name="<?=$NODE_ID?>[add_item][end_year]" size="4" maxlength="4" value="<?=$MODULE_OUTPUT["year_end"]?>"> года в <input type="text" name="<?=$NODE_ID?>[add_item][end_hours]" size="2" maxlength="2" value="00">:<input type="text" name="<?=$NODE_ID?>[add_item][end_minutes]" size="2" value="00" maxlength="2">:<input type="text" name="<?=$NODE_ID?>[add_item][end_seconds]" size="2" value="00" maxlength="2">.
			<p>Варианты ответов (1 вариант в строке!):<br>
			<textarea name="<?=$NODE_ID?>[add_item][choices]" cols="80" rows=10></textarea></p>
			<input type="hidden" name="<?=$NODE_ID?>[add_item][hidden_node_id]" value="<?=$MODULE_OUTPUT["hidden_node_id"]?>">
			<input type="hidden" name="<?=$NODE_ID?>[add_item][hidden_issue_id]" value="<?=$MODULE_OUTPUT["hidden_issue_id"]?>"></p>
			<input type="hidden" name="<?=$NODE_ID?>[add_item][hidden_folder_id]" value="<?=$MODULE_OUTPUT["hidden_folder_id"]?>"></p>
			<p><input type="submit" value="Добавить опрос" /></p>
			</form> 
			</div> -->
			<?
		}
		break;
}

?>


<? if (isset($MODULE_OUTPUT['choices']) && count($MODULE_OUTPUT['choices']) > 1) { 


?>
<script type="text/javascript" src="/scripts/jquery/jquery-1.5.1.js"></script>
<script>

(function($) {
	$.fn.setCompoundPollHandler = function (settings) {
		var defSettings = {
			voteResultStr: "",
			issueIdsStr: "",
			voteInd: 0,
			pollData: [],
			pollMode: "simple",
			voteButton: "voteButton",
			resultsButton: "resultsButton",
			choicesBlock: "choicesBlock",
			loadingBlock: "loadingBlock",
			titleBlock: "",
			afterPollBlock: "",
			refreshDelay: 500,
			choiceIsMade: false
		};
		var settings = $.extend(
			defSettings, settings	
		);
		var handlers = {
				inputLocker: function () {return false}
		};
		
		if (settings.pollMode == 'compound')
			$('#'+settings.voteButton).css('display', 'none');	
		if (settings.afterPollBlock) 
			$('#'+settings.afterPollBlock).css('display', 'none');
		<?
		$keys = array_keys($MODULE_OUTPUT['choices']);
		$choices = explode("%", $MODULE_OUTPUT['choicesStr']); 
		for($i=1; $i<=count($MODULE_OUTPUT['choices']);$i++) { ?>
			settings.pollData[<?=$i-1?>] = {'title': '<?=$MODULE_OUTPUT['title'][$i-1]?>', 
				'id': <?=$keys[$i-1]?>, 'choices': '<?=$choices[$i-1]?>'};
		<? } ?>

		
		return this.each(function () {
			$(this).bind('change', function() {
				$('.'+this.className).bind('click', handlers.inputLocker);
				if (this.checked) { 
					$('#'+settings.loadingBlock).css('display', 'block');
					settings.voteResultStr += $(this).val()+';'; 
					settings.issueIdsStr += settings.pollData[settings.voteInd]['id']+';';
					if (settings.voteInd == settings.voteLength) {
						var request = {'module': <?=$MODULE_OUTPUT['module_id']?>, 'node':<?=$NODE_ID?>, 'params': 'poll', '<?=$NODE_ID?>': {'vote': {'resultStr': settings.voteResultStr, 'setId': <?=$MODULE_OUTPUT['set_id']?>, 'issueIdsStr': settings.issueIdsStr}} };
						$.ajax({
						 	type: 'POST',
							url: '/ajax_mode/', 
							data: request,
							success: function( data ) {
							$('#'+settings.loadingBlock).css('display', 'none');
								$('#'+settings.choicesBlock).css('display', 'none');
								$('#'+settings.resultsButton).css('display', 'block');
								if (settings.titleBlock)
									$('#'+settings.titleBlock).css('display', 'none');
								if (settings.pollMode == 'simple')
									$('#'+settings.voteButton).css('display', 'none');
								if (settings.afterPollBlock) 
									$('#'+settings.afterPollBlock).css('display', 'block');
							}
						});			
					} else {
						settings.voteInd++;
						
						checkedInput = this;
						setTimeout(
							function() { 
								$('#'+settings.loadingBlock).css('display', 'none');
								if (settings.titleBlock)
									$('#'+settings.titleBlock).attr('innerHTML', (settings.voteInd+1)+'. '+settings.pollData[settings.voteInd]['title']);
								curChoices = settings.pollData[settings.voteInd]['choices'].split(';');
								$('.'+checkedInput.className).each(
										function (ind) {$(this).unbind('click', handlers.inputLocker); this.value = curChoices[ind].split(':')[0];}
								);
								checkedInput.checked = false;
							} 
						, settings.refreshDelay);
					} 
				}
				return false;
			});
		});
	}
})(jQuery);	

$(document).ready( function() {
	$('.voteOpt').setCompoundPollHandler( {
		'pollMode': 'compound', 
		'voteButton': 'voteButton', 
		'afterPollBlock': 'afterPollBlock', 
		'titleBlock': 'titleBlock', 
		'voteLength': <?=count($MODULE_OUTPUT['choices'])-1?>
	} );
});
</script>
<? } ?>