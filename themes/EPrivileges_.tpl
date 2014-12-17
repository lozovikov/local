<?php

/*echo '<pre>';
print_r($MODULE_DATA["output"]);
echo '</pre>';*/

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

if (ALLOW_AUTH)
{
	switch ($MODULE_DATA["output"]["mode"])
	{
		case "show_modules":
			?><h2>Выберите модуль:</h2>
			<a href="<?=$EE["unqueried_uri"]?>0/">Системные операции</a><br /><?
			foreach ($MODULE_DATA["output"]["modules"] as $module) {
				?><a href="<?=$EE["unqueried_uri"]?><?=$module["id"]?>/"><?=$module["comment"]?></a><br /><?
			}
			break;

		case "privileges_form":
                        if($MODULE_DATA["output"]["module_id"] != NULL) { 
			if ($MODULE_DATA["output"]["module_name"] != "Системные операции") {
				?><h2>Операции модуля "<?=$MODULE_DATA["output"]["module_name"]?>"</h2><?
			}
			else {
				 ?><h2>Системные операции</h2><?
			}
			?>
			<form action="<?=$EE["unqueried_uri"]?>" method="post">
			
			<input type="hidden" name="<?=$NODE_ID?>[give_privileges][module_id]" value="<?=$MODULE_DATA["output"]["op_module_id"]?>">
			
			<input id="entry_branch_id" type="hidden" name="<?=$NODE_ID?>[give_privileges][entry_branch_id]" value="" />
			<input id="entry_branch_level" type="hidden" name="<?=$NODE_ID?>[give_privileges][entry_branch_level]" value="" />
			
			<p>Операция:<br />
			<select id="opList" name="<?=$NODE_ID?>[give_privileges][operation_name]" size="1" onchange="jQuery('#op_entries_list').getOpEntriesInfo(this.value); jQuery('#op_entries_aliases').checkOpEntriesAliases(this); jQuery('#opList').checkInheritanceOption();"><?
			foreach ($MODULE_DATA["output"]["operations"] as $operation) {
				?><option data-inheritable="<?=$operation["is_inheritable"]?>" value="<?=$operation["operation_name"]?>">
				<?php
				if ($operation["comment"])
					echo $operation["comment"];
				else
					echo $operation["operation_name"];
				?>
				</option><?
			}
			?>
			</select>
			<a id='add_operation' href="">&nbsp;Добавить операцию</a>
			</p>
			
			<p>Группа пользователей:<br />
			<select name="<?=$NODE_ID?>[give_privileges][usergroup_id]" size="1">
			<option value="-1">Все пользователи</option>
			<option value="0">Незарегистрированные пользователи</option><?
			foreach ($MODULE_DATA["output"]["usergroups"] as $usergroup) {
				?><option value="<?=$usergroup["id"]?>"><?=$usergroup["comment"]?></option><?
			}
			?>
			</select></p>
			
			<p>
			<select id="op_entries_aliases" style="display:<?=($MODULE_DATA["output"]["operations"][0]["entry_alias_path"]?'display':'none')?>">
			<?php
				$operation = $MODULE_DATA["output"]["operations"][0];
			?><option data-inheritable="<?=$operation["inheritable"]?>" value="<?=$operation["operation_name"]?>">
				<?php
					echo $operation["entry_alias_path"];
				?>
				</option><?
						
			?>
			</select>
			</p>
			<div id="op_entries_list" style="width:300px; height: 330px; clear:both;">
				<span>Элемент (entry):</span><br />
			</div>
			<p id="entry_id_cont">ID элемента (entry):<br />
			<input type="text" id="entry_id" name="<?=$NODE_ID?>[give_privileges][entry_id]" size="3" disabled>
			<input type="checkbox" id="all_entries" name="<?=$NODE_ID?>[give_privileges][all_entries]" onclick="jQuery('#all_entries').checkInheritanceOption();" checked>
			Для всех элементов
			<input type="checkbox" id="child_entries" name="<?=$NODE_ID?>[give_privileges][child_entries]"  disabled>
			С учетом дочерних элементов
			</p>
			
			<p>Действие:<br />
			<select name="<?=$NODE_ID?>[give_privileges][is_allowed]" size="1">
			<option value="1">Разрешить</option>
			<option value="0">Запретить</option>
			</select></p>
			
			<p><input type="submit" value="Готово"></p><hr>
			<?php } ?>
			<h2>Выданные права</h2>
			<ul><?
			if (isset($MODULE_DATA["output"]["privileges"]))
			foreach ($MODULE_DATA["output"]["privileges"] as $privilege) {
				?><li><? if (!$privilege["is_allowed"]) { ?>Запретить<? } else { ?>Разрешить<? }
				if ($privilege["usergroup"] == "-1") { ?> всем пользователям<? }
				elseif (!$privilege["usergroup"]) { ?> незарегистрированным пользователям<? }
				else { ?> группе пользователей "<?=$privilege["usergroup"]?>" <? } ?>
				действие "<?=$privilege["operation"]?>"
				<? if ($privilege["entry_id"] == "-1") { ?> на всех элементах<? }
				else { ?> на элементе <?=$privilege["entry_id"]?><? } ?>. 
				<a href="?delete_name=<?=$privilege["operation_code"]?>&delete_module=<?=$privilege["module_id"]?>&delete_usergroup=<?=$privilege["usergroup_id"]?>&delete_entry=<?=$privilege["entry_id"]?>&delete_allowed=<?=$privilege["is_allowed"]?>" onclick="if(!confirm('Вы действительно хотите удалить эту привилегию?')) return false;"><img src="/themes/images/delete.png"></a>
				<?
			} ?>
			</ul>
			<?
			
			break;
			
		case "message":
		
			break;
	}
}

?>

	<script>
		(function ($) {

<? if (!isset($MODULE_DATA["output"]["entries_info"]) || empty($MODULE_DATA["output"]["entries_info"])) { ?>
	$('#op_entries_list').css("display", "none");
<? } ?>

			$(document).ready( function() {
					$('#op_entries_list').getOpEntriesInfo($('#opList').val());
				});;

			var treeList = null;
			$.fn.getOpEntriesInfo = function(opName) {
				
				var request = {'mode': 'json', 'module': <?=$MODULE_OUTPUT['module_id']?>,  'params': 'get_op_entries_info', 'data': {'opName': opName}} ;
				$.when( $.getJSON('<?=AJAX_URL?>', request) ).then(function(response){
				
				if (response && response.info) {
					
					treeList = $('#op_entries_list').createTreeList(
							{
								'listContentCallback': {
									'ajaxUrl': '<?=AJAX_URL?>',
									'data': response.info, 
									'params': 'get_operation_entries',
									'moduleId': <?=$MODULE_OUTPUT['module_id']?>,
								},
								'width': 300, 
								'height': 300,
								'onSelect': [
									function(elemSel,msg) {
										if ($(elemSel).data('id')) {  
											$('#entry_id').val($(elemSel).data('id'));
											$('#all_entries').attr('checked', false);
											$('#all_entries').checkInheritanceOption(); 
											$('#entry_branch_id').val($(elemSel).parent('.branch').attr('id'));
											$('#entry_branch_level').val($(elemSel).parents('.branch').size()-1);
										}
										return false;
									}
									, 'test'
								]
							}
						);
					$('#op_entries_list').css('display', 'block');
				} else if(treeList) {
					treeList.remove();
					$('#op_entries_list').css('display', 'none');
				}
					
				});
			} 

			var opEntriesAliases = [];
			<? foreach($MODULE_DATA["output"]["operations"] as $ind=>$operation) { ?>
				opEntriesAliases[<?=$ind?>] = '<?=$operation["entry_alias_path"]?>';
			<? } ?>

			function fillJoinPart(aliasParts) {
				tables = []; fields = []; joinPart = '';
				for(ind in aliasParts) {
					aliasInfo = aliasParts[ind].split('.');
					tables[tables.length] = aliasInfo[0];
					fields[fields.length] = aliasInfo[1];
				}
				for(ind=1; ind<tables.length; ind++) {
					if (tables[ind] != tables[ind-1]) {
						joinPart+= ' left join '+tables[ind]+' on '+tables[ind]+'.'+fields[ind]+'='+tables[ind-1]+'.'+fields[ind-1];
					}
				}
				return joinPart;
			}
			
			$.fn.checkOpEntriesAliases = function(opList) {
				curOp = opList.selectedIndex;
				joinedTables = false;
				if (opEntriesAliases[curOp]) {
					aliasParts = opEntriesAliases[curOp].split('->');
					displayValueInfo = aliasParts[0].split('.');
					displayValue = displayValueInfo[1]; 
					displayValueTable = displayValueInfo[0];
					keyValueInfo = aliasParts[aliasParts.length-1].split('.');
					keyValue = keyValueInfo[1]; 
					keyValueTable = keyValueInfo[0];
					if (displayValueTable != keyValueTable) {
						joinedTables = true;
						displayValue = displayValueTable +'.'+displayValue; 
						keyValue = keyValueTable +'.'+keyValue;
					}

					queryPattern = "select %DISPLAY_VALUE%, %KEY_VALUE% from %DISPLAY_VALUE_TABLE% %JOIN_PART% where %KEY_VALUE% is not null";
					query = queryPattern.replace('%DISPLAY_VALUE%', displayValue).
							replace('%DISPLAY_VALUE_TABLE%', displayValueTable).
							replace(new RegExp("%KEY_VALUE%",'g'), keyValue).
							replace(new RegExp("%JOIN_PART%",'g'), joinedTables ? fillJoinPart(aliasParts) : '');

					var request = {'mode': 'json', 'module': <?=$MODULE_OUTPUT['module_id']?>,  'params': 'get_op_entries', 'data': {'aliasInfo': opEntriesAliases[curOp]}} ;
					$.when( $.getJSON('/ajax_mode/', request) ).then(function(data){
						jsonData = $.parseJSON(data);
						jsonData['test'].forEach(
							function(elem) {
								$('#op_entries_aliases').html($('#op_entries_aliases').html()+'<option value="'+elem['id']+'">'+elem['title']+'</option>');
							}
						);
					});
				}
				
			}
			
			$.fn.checkInheritanceOption = function() {
				
				if (this.selector != '#opList') { 
					if ($(this.selector).get(0).checked) {
						$('#entry_id').attr('disabled', true);
						$('#child_entries').attr('disabled', true);
					} else { 
						$('#entry_id').attr('disabled', false);
						if ($('#opList option:selected').data('inheritable')) {
							$('#child_entries').attr('disabled', false);
						} else {
							$('#child_entries').attr('disabled', true);						
						}
					}
				} else {
					if (!$('#all_entries').is(':checked')) {
						if ($('#opList option:selected').data('inheritable')) {
							$('#child_entries').attr('disabled', false);
						} else {
							$('#child_entries').attr('disabled', true);
						}							
					}
				}
			}

			String.prototype.shuffle = function () {
			    var a = this.split(""),
			        n = a.length;
			    for(var i = n - 1; i > 0; i--) {
			        var j = Math.floor(Math.random() * (i + 1));
			        var tmp = a[i];
			        a[i] = a[j];
			        a[j] = tmp;
			    }
			    return a.join("");
			}

			var ajaxFormPrefix = 'af_';	

			var refreshOperationsList = function(formId, updateData) {
				$('<option value="'+$('#'+formId).find('input').attr('value')+'" >'+$('#'+formId).find('textarea').attr('value')+'</option>').appendTo($('#opList'));
				return 1;
			}

			var checkFormFields = function(formId) {
				var errorMsg = [];
				var nesecInputData = [[$('#'+formId).find('input'), $('#'+formId).find('input[type=text]').attr('value'), 'Не указано название операции.'],
				   					[$('#'+formId).find('textarea'), $('#'+formId).find('textarea').attr('value'), 'Не указан комментарий к операции.'],
				   					[$('#'+formId).find('select:first'), $('#'+formId).find('select:first option').size(), 'Не указан элемент операции.']];

				for (var ind in nesecInputData)
					if (!nesecInputData[ind][1]) {
						nesecInputData[ind][0].addClass('wrongFilledInput');
						nesecInputData[ind][0].css('border', '1px solid red');
						errorMsg[errorMsg.length] = nesecInputData[ind][2];
					} else nesecInputData[ind][0].css('border', '0px').removeClass('wrongFilledInput');

				if (!errorMsg.length) {
					var opModuleId = <?=$MODULE_OUTPUT['op_module_id']?>;
					var params = 'add_operation';
					var operationName = $('#'+formId).find('input[type=text]').attr('value'); 
					var entryType = $('#'+formId).find('select[list=tables]').val()+'.'+$('#'+formId).find('select[list=fields]').val();
					var comment = $('#'+formId).find('textarea').attr('value');
					var inheritable = ($('#'+formId).find('input[type=checkbox]').attr('checked') ? 1 : 0);
				}
				
				return errorMsg.length ? [0, errorMsg.join('<br />')] : [1, {'module_id': opModuleId, 'params': params, 'operation_name': operationName, 'entry_type': entryType, 'comment': comment, 'inheritable': inheritable}];
			}

			var resetFormState = function(formId) { 
				$('#'+formId).find('.wrongFilledInput').css('border', '0px').removeClass('wrongFilledInput');
				$('#'+formId).find('input[type!=submit]').attr('value', '');
				$('#'+formId).find('textarea').attr('value', '');
				return 1;
			}
			
			var activateTemplateElems = function(formId) {
				$('#'+formId).find('[obligatory=true]').each(
					function () {
						$('<span style="color:red;"><strong><sup> *</sup></strong></span>').insertAfter(this);
					}
				);
				$('#'+formId).find('select[list=tables]').bind('change', function() {
					var request = {'mode': 'json', 'module': <?=$MODULE_OUTPUT['module_id']?>,  'params': 'get_cols', 'data': {'table': this.options[this.selectedIndex].text}} ;
					$.when( $.getJSON('/ajax_mode/', request) ).then(function(data){
						$($('#'+formId).find('select:last').get(0).options).remove();
						var newOptions = '';
						for (var ind in data)
							newOptions += '<option>'+data[ind]+'</option>';
						var $tableColSel = $('#'+formId).find('select:last');
						$(newOptions).appendTo($tableColSel);
						$tableColSel.css('display', ( $tableColSel.find('option').size() ? 'block' : 'none'));
						
					});
					
				}); 
				return 1;
			}

			var genId = function() {
				var id =  'abcdefghijklmnopqrstuvwxyz'.shuffle().substr(0,10);
				while (document.getElementById(ajaxFormPrefix+id)) {
					id = id.shuffle();
				}
				return ajaxFormPrefix+id;
			}
			
			var fillTemplate = function(templ) {
				var resp = $.Deferred();
				var deferCounter2 = 0;
				var operations = {
					'getOperationsInfo': function() {
						var resp = $.Deferred();
						var request = {'mode': 'json', 'module': <?=$MODULE_OUTPUT['module_id']?>,  'params': 'get_modules'} ;
						$.when( $.getJSON('/ajax_mode/', request) ).then(function(data){
							var optionsHTML = ''; 
							for(var ind in data)
								optionsHTML+= '<option id="'+data[ind]['id']+'">'+data[ind]['comment']+'</option>';
							 resp.resolve(optionsHTML);
						});
						return resp.promise();
					},
					'getEntryInfo': function() {
						var resp = $.Deferred();
						var request = {'mode': 'json', 'module': <?=$MODULE_OUTPUT['module_id']?>,  'params': 'get_tables'} ;
						$.when( $.getJSON('/ajax_mode/', request) ).then(function(data){
							var optionsHTML = ''; 
							for(var ind in data)
								optionsHTML+= '<option>'+data[ind]+'</option>';
							 resp.resolve(optionsHTML);
						});
						return resp.promise();
					} 
				}

				
				var fillPattern = '';
				var newTempl = formTemplate;
			
				for (opName in operations) {
					fillPattern = new RegExp('%'+opName+'%', 'g');
					if (fillPattern.test(newTempl)) { 
						deferCounter2++;
						fetcher =  operations[opName]();
						(function(ftr, fp) {
							var optionsHTML = '';
							ftr.done (function (res) {
								newTempl = newTempl.replace(fp, res);
								deferCounter2--;
								if (!deferCounter2) 
									resp.resolve(newTempl);
								});
						})(fetcher, fillPattern);
					}
				}
				
				return resp.promise();
			}
			
			
			var formTemplateCss = '/themes/styles/test.css',
				formId = genId(),
				formTemplate = '<div class="form" style="border:1px solid #9C0605; width:400px"><table cellpadding=2 width="100%"><tr><td><span obligatory="true">Название:</span></td><td><input style="width:120px" type="text" value="" /></td></tr><tr><td><span obligatory="true">Коммент:</span></td><td><textarea style="width:140px; height: 40px;" value="" /></td></tr><tr><td>Элемент:</td><td><select list="tables" style="width:150px"><options>%getEntryInfo%</options></select><br /><select list="fields" style="width:150px; display:none;"><options></options></select></td></tr><tr><td>Применение к дочерним элементам:</td><td><input type="checkbox" /></td></tr><tr><td colspan=2 style="padding-top: 5px; text-align:right"><input type="submit" value="Добавить" /></td></tr></table>';

			$('#add_operation').bind('click', function () {return false});
			$('#add_operation').createAjaxForm(
								{'position': 'Center', 'template':formTemplate, 'css': formTemplateCss, 'id': formId, 'title': 'Новая операция:', 'feedbackModuleId': <?=$MODULE_OUTPUT['module_id']?>, 
								'onCreate': {'funcs': [fillTemplate], 'params':[[formTemplate]]} , 
								'afterCreate': {'funcs': [activateTemplateElems], 'params':[[formId]]}, 
								'onSend': {'funcs': [checkFormFields], 'params':[[formId]]},
								'onHide': {'funcs': [resetFormState], 'params':[[formId]]},
								'afterSend': {'getAjaxResult': true, 'funcs': [refreshOperationsList], 'params':[[formId]]},
								'ajaxUrl': '<?=AJAX_URL?>'
								});
		})(jQuery);
	</script>