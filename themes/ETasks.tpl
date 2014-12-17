<?php
// version: 1.6
// date: 2013-11-18
if(!isset($MODULE_OUTPUT['mode'])) {$MODULE_OUTPUT['mode'] = 'default';}
	switch($MODULE_OUTPUT['mode']) {
		case "task_count": {
			if(isset($MODULE_OUTPUT['tasks_count'])) {
				header("Content-type: text/html; charset=windows-1251"); ?>
	<div class="tasks_count">
		<div class="tasks_count_title"><a href="http://rm.nsau.edu.ru">Задачи</a></div>
		<p class="new_tasks">Новые: <span><?=$MODULE_OUTPUT['tasks_count']['new']?></span></p>
		<p class="new_current">На выполнении: <span><?=$MODULE_OUTPUT['tasks_count']['current']?></span></p>
		<p class="new_tobechecked">На проверке: <span><?=$MODULE_OUTPUT['tasks_count']['tobechecked']?></span></p>
		<script>jQuery(document).ready(function($) {TaskCount(<?=$MODULE_OUTPUT['module_id']?>);});</script>
	</div>			
<?php		}
		}
		break;
		case "user_task_count": {
			if(isset($MODULE_OUTPUT['tasks_count'])) {
				header('Content-Type: text/xml,  charset=windows-1251');
				$dom = new DOMDocument();
				$user_tasks = $dom->createElement('user_tasks');
				$dom->appendChild($user_tasks);
				
				$new_tasks = $dom->createElement('new_tasks');
				$new_count = $dom->createTextNode($MODULE_OUTPUT['tasks_count']['new']);
				$new_tasks->appendChild($new_count);
				
				$current_tasks = $dom->createElement('current_tasks');
				$current_count = $dom->createTextNode($MODULE_OUTPUT['tasks_count']['current']);
				$current_tasks->appendChild($current_count);
				
				$tobechecked_tasks = $dom->createElement('tobechecked_tasks');
				$tobechecked_count = $dom->createTextNode($MODULE_OUTPUT['tasks_count']['tobechecked']);
				$tobechecked_tasks->appendChild($tobechecked_count);
				
				$user_tasks->appendChild($new_tasks);
				$user_tasks->appendChild($current_tasks);
				$user_tasks->appendChild($tobechecked_tasks);
					
				$xmlString = $dom->saveXML();	
				echo $xmlString;			
			}
		}
		break;
		case "tasks": { ?>	
		<script>
			var task_statuses = new Array();
			var full_task_statuses = new Array();
			var task_statuses1 = 0;
<?php	foreach($MODULE_OUTPUT['task_statuses'] as $ind => $status) { ?>
			task_statuses[<?=$ind?>] = '<?=$status?>';
<?php	}
		foreach($MODULE_OUTPUT['full_task_statuses'] as $ind => $status) { ?>
			full_task_statuses[<?=$ind?>] = '<?=$status?>';
<?php	}
		if(is_array($MODULE_OUTPUT['task_statuses'])) { ?>
			task_statuses1 = '<?=(implode(';', $MODULE_OUTPUT['task_statuses']))?>';
<?php	} else { ?>
			task_statuses1 = '<?=$MODULE_OUTPUT['task_statuses']?>';
<?php	} ?>
			jQuery(document).ready(function($) {
				Tasks(<?=$MODULE_OUTPUT['module_id']?>,'<?=$MODULE_OUTPUT['show_mode']?>',<?=(isset($MODULE_OUTPUT['to_print'])?1:0)?>,<?=$MODULE_OUTPUT['id']?>,task_statuses,full_task_statuses,task_statuses1);
			});
		</script>
		<script>jQuery(document).ready(function($) {InputCalendar();});</script>	
<?php		if (isset($MODULE_OUTPUT['to_print']) && $MODULE_OUTPUT['to_print']) { ?>
	<link rel="stylesheet" href="<?=HTTP_THEMES?>styles/print.css" type="text/css" />
<?php 	}
		foreach ($MODULE_DATA["output"]["messages"]["good"] as $data) {
			echo "<p class=\"message\">$data</p>\n";
		}
		foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data) {
			echo "<p class=\"message red\">$data</p>\n";
		}
		$MODULE_OUTPUT = $MODULE_DATA["output"]; ?>
	<div id='tasks_container'>
<?php	if ($MODULE_OUTPUT['show_mode'] == 'executor_reports') { ?>
		<div>
			<br />
			Выберите исполнителя: 
			<select id='executors_list' onchange="showExecutorTasks(this.options[this.selectedIndex].id);">
				<!--<option></option>-->
<?php 		if ($MODULE_OUTPUT['users'] && !empty($MODULE_OUTPUT['users'])) 
				foreach ($MODULE_OUTPUT['users'] as $user)
					echo '<option '.(isset($_GET['exec']) && $_GET['exec'] == $user["id"] ? 'selected' : '').' id="'.$user["id"].'">'.$user["name"].'</option>'; ?>
			</select>
		</div>
		<br />
<?php	} else {
			if ($MODULE_OUTPUT['show_mode'] == 'my'){ ?>
		<br />
		<hr />
		<div>
			<form id="new_task_form" method="post" onsubmit="return false" action="">
				<div class="href active" onclick="changeAddTaskTableDisplay(); "><strong>Добавить задачу</strong></div><br />
				<div class="ajax_msg" style="display:none; color: #ff505e" id="add_task_msg_box"></div>
				<br />
				<table style="display:none;" id="add_task_table" border=0 cellpadding="3">
				    <tr>
				        <td width="120px">
				           Кто озадачил: <span style="color:red">*</span>
				        </td>
				        <td align="right">   
				            <select style="display:none" id="new_task_users" name="new_task[executor]" >
<?php			foreach ($MODULE_OUTPUT["users"] as $user) {
					if ($user['id'] != -1) { // $MODULE_OUTPUT['id'] ?> 
								<option id="<?=$user["id"]?>"><?=$user["name"]?></option>
<?php 				}
				} ?>
						    </select> 
							<input type="text" style="width:250px" id="new_task_auth" />
						</td>
					</tr>
					<tr>
						<td>
							Описание: <span style="color:red">*</span>
						</td>
						<td>
							<textarea id="new_task_descr" cols="50" rows="20" name="new_task[descr]"></textarea>
						</td>
					</tr>
					<td colspan=2 align="right">
						<input id="new_task_submit" type="submit" value="Сохранить изменения" onclick="addNewTask()">
					</td>
				</table>
			</form>
		</div>
		<hr />
<?php 		} ?>
		<div>
			<br />
			<div id="my_tasks_href" class="href title active" onclick="changeTasksMode('my')">Мои задачи</div>|
			<div id="for_me_tasks_href" class="href title" onclick="changeTasksMode('me')">Задачи для меня <span><?=(isset($MODULE_OUTPUT['tasks_count']['new']) ? "(".$MODULE_OUTPUT['tasks_count']['new'].")" : "")?></span></div>|
			<div id="all_tasks_href" class="href title" onclick="changeTasksMode('<?=( (isset($MODULE_OUTPUT['edit_all']) && $MODULE_OUTPUT['edit_all']) ? 'edit_all' : 'all')?>')">Все задачи</div>
		</div>
		<br />
<?php	} ?>
		<div>
			<form id="filters_form" method="post" onsubmit="return false" action="">
				<input type="hidden" id="earlier_field" name="earlier" value="<?=$MODULE_DATA["output"]["show_earlier"]?>" />
				<input type="hidden" id="page_field" name="page" value="1" />
				<fieldset style="width:250px;">
					<legend>Показать задачи:</legend>
					<div id="filters_cont">
						<input onclick="updateStatusesFilter(this)" type="checkbox" data-status="new" name="tasks[new]" /> Новые <br />
						<input onclick="updateStatusesFilter(this)" type="checkbox" data-status="current" name="tasks[current]" /> Исполняемые<br />
						<input onclick="updateStatusesFilter(this)" type="checkbox" data-status="tobechecked" name="tasks[tobechecked]" /> На подтверждении<br />
						<input onclick="updateStatusesFilter(this)" type="checkbox" data-status="done" name="tasks[done]" /> Выполненные <br />
					</div>
					<hr />
					<div>
						<input onclick="changeCalendarAvailable()" type="checkbox" data-status="assign_date" name="assign_date" /> Дата поступления:<br />
						с: <input id='assign_date_from' type="text" class="calendar-field date_time"  value="2010-01-01" />&nbsp;
						до: <input id='assign_date_to' type="text" class="calendar-field date_time" value="2020-01-01" />
					</div>
					<? if (isset($MODULE_OUTPUT['assigners']) && !empty($MODULE_OUTPUT['assigners']) ) {?>
					<hr />
					<div>
						Кто озадачил <br />
						<select style="width:250px;" onchange="updateAssignersFilter(this)"  name="assigner">
							<option></option>
							<? 	foreach ($MODULE_OUTPUT['assigners'] as $assigner) {?>
								<option value="<?=$assigner?>"><?=$assigner?></option>
							<? } ?>
						</select>
					</div>
					<? } ?>
<?php		if ($MODULE_OUTPUT['show_mode'] == 'executor_reports') { ?>
					<div><a id="print_report_href" href="" target="_blank"><img title="Распечатать без постраничного отображения" src="<?=HTTP_THEMES?>styles/printer.png" /></a></div>
<?php 		} ?>
					<br /><a style="cursor: pointer;" onclick="refreshStatusesFilter(1)">Выделить все</a> / <a style="cursor: pointer;" onclick="refreshStatusesFilter(0)">Снять выделение</a>
				</fieldset>
			</form>
		</div>
		<br />
		<div>
			<div id="task_table_cont">
<?php 		if ($MODULE_OUTPUT['tasks'][$MODULE_OUTPUT['show_mode']] && !empty($MODULE_OUTPUT['tasks'][$MODULE_OUTPUT['show_mode']]) ) {?>
			    <table id="task_table" width="1000px" cellspacing="2" cellpadding="3">
					<tr height="30px" bgcolor="#BBBBBB">
					    <td align="center" width="1px"><strong>Дата поступления</strong></td><td align="center"><strong>Кто озадачил</strong></td><td align="center"><strong>Исполнитель</strong></td><td align="center"><strong>Описание</strong></td><td align="center"><strong>Статус</strong></td><td width="1px" align="center"><strong>Дата назначения</strong></td><td width="1px" align="center"><strong>Дата выполнения</strong></td><td align="center"><strong>Комментарий исполнителя</strong></td><td align="center"><strong>Снять</strong></td>
					</tr>
<?php 			foreach ($MODULE_OUTPUT['tasks'][$MODULE_OUTPUT['show_mode']] as $ind=>$task) { ?>
					<tr id="<?=$task['id']?>" bgcolor=<?=($ind%2 ? "#E5DDDD" : "#F5EAEA")?>>
						<td align="center"><?=$task['creation_date']?></td>
						<td align="center">
<?php 				if ($task['status'] != 'done') {?>
							<input type="text" value="<?=$task['author_name']?>" />
							<div  class="href author-update" onclick="changeAuthorName(this)"> <img src="<?=HTTP_THEMES?>images/edit.png" title="%title%" /></div>
<?php 				} else {
						echo $task['author_name'];
					} ?>
						</td>
						<td data-task="<?=$task['id']?>" >
							<div>
								<div class="href executor-add" onclick="changeSubjectName(this, 1)"><img src="<?=HTTP_THEMES?>images/edit-add.png" title="Добавить исполнителя" /></div>
							</div>
							<hr />
<?php				if (!empty($task['executors'])) {
						foreach($task['executors'] as $executor) { ?>
							<div style="margin-bottom:10px">
								<a href="reports/<?='#'.$executor['id']?>"><?=$executor['name']?></a>
<?php 						if ($task['status'] != 'done' && $executor['name']) {?>
								<div class="href executor-update" onclick="changeSubjectName(this, 0)"><img src="<?=HTTP_THEMES?>images/edit.png" title="%title%" /></div>
<?php 						} ?>
							</div>
<?php 					}
					}?>
						</td>
						<td><?=trim($task['description'])?><div  class="href descr-update" onclick="changeDescr(this)"> <img src="<?=HTTP_THEMES?>images/edit.png" title="%title%" /></div></td>
						<td align="center">
							<?=$MODULE_OUTPUT['statuses_titles'][$task['status']]?><?=($task['status'] == 'tobechecked' ? '<div onclick="updateStatus(this)" data-status="'.$task['status'].'" class="href status-update"><img src="'.HTTP_THEMES.'images/edit.png" title="%title%" /></div>' : '')?>
						</td>
						<td align="center" title="<?=( !is_null($task['execution_start_date']) ? 'принята исполнителем '.$task['execution_start_date'] : '') ?>" class='start-date'><?=$task['assignment_date']?></td>
						<td align="center" class='finish-date'><?=$task['execution_finish_date']?></td>
						<td><?=$task['executor_comment']?></td>
						<td align="center"><div  class="href" onclick="unassignTask(this)"> <img src="<?=HTTP_THEMES?>images/delete.png"></div></td>
					</tr>
<?php 			} ?>
				</table>
<?php      	} elseif ($MODULE_OUTPUT['show_mode'] == 'my'){?>
				<p id="no_tasks_msg"><strong>Задач не найдено.</strong></p>
<?php 		}?>
				<div id="pager_cont">
<?php	    // Pager block
	    	if (isset($MODULE_OUTPUT["pager_output"]))  { 
				$pager_output = $MODULE_OUTPUT["pager_output"]; 
				if (count($pager_output["pages_data"]) > 1) { // если есть что выводить, и страниц больше одной
					echo "<br><div id='pager' class=\"pager\">\n";
					if($pager_output["prev_page"]) {
		                echo "<div class='pager-href href' data-pager_num='".$pager_output['prev_page']."' onclick='document.getElementById(\"page_field\").value=\"".$pager_output['prev_page']."\"; ' title=\"" . 'Предыдущая страница' . "\"";
		                echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span>";
		                echo $pager_output["prev_page"] ? "</div>" : "</span>";
		                echo " ";
		            }		         
		
		            foreach ($pager_output["pages_data"] as $page => $data) {
		                if (is_int($page)) {
		                    echo ($data["is_current"] ? "<strong>" : "<div class='pager-href href' data-pager_num='".$page."' onclick='document.getElementById(\"page_field\").value=\"".$page."\";'>") . $page . ($data["is_current"] ? "</strong>" : "</div>") . " ";
		                } else {
		                    echo "&hellip; ";
		                }
		            }
		
			        if ($pager_output["next_page"]) {
			            echo "<div class='pager-href href' data-pager_num='".$pager_output['next_page']."' onclick='document.getElementById(\"page_field\").value=\"".$pager_output['next_page']."\"; ' title=\"" . 'Следующая страница' . "\"";
			            echo " id=\"next_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&nbsp;&rarr;</span>";
			            echo "</div>";
			        }
			        echo "</div>\n";
		        } 
			} ?>
				</div>
			</div>
		</div>
		<br />
	</div>	
<?php	}
		break;
		case "apply_support_link": {
			if(!$MODULE_OUTPUT['allow_handle']) { ?>
			<div class="tasks_count" style="height: 9.5ex; ">
				<div class="tasks_count_title">
					<a href="<?=$MODULE_OUTPUT['apply_uri'];?>">Заявка в ЦИТ</a>
				</div>
			</div>
			<?php 
			}
		}
		break; 
		case "apply_support": {
			$examples = $MODULE_OUTPUT["examples"];
			?>
			<div class="student_registr_form">
			
			<!--<div id='tasks_container'><div class="href active" onclick="changeAddTaskTableDisplay(); " style="border-bottom-style: dashed;font-weight: normal;"><strong>Добавить заявку</strong></div><br />-->
			<div class="center_cont" style="margin-left: 0px; width: 48%;">
			<a class="bayan" onclick="window.location = '/office/multimedia/';" id="link12">Заявка на использование мультимедиа-проектора</a><br />
			<div id="choice_links">
			<a class="bayan" onclick="showChoice(this, 'pub')" id="link13">Публикация на портале</a><br />
			<a class="bayan" onclick="showChoice(this, 'comp')" id="link14">Компьютеры, сеть, техника</a><br />
			</div>
			<form id="new_task_form" method="post" onsubmit="return false" action="">
				<input type="hidden" name="subject" value="" />				
				<div class="ajax_msg" style="display:none; color: #ff505e" id="add_task_msg_box"></div>
				<br />
				<table id="add_task_table" border=0 cellpadding="3" style="display: none; ">
				<tr>
						<td>
							Описание: <span style="color:red">*</span>
						</td>
						<td>
							<textarea id="new_app_descr" cols="50" rows="20" name="new_app[descr]"></textarea><br/>
							Пример: <span id="apply_example" style="border-bottom-style: dashed; border-bottom-width: 1px; cursor: pointer;"><?=$examples[rand(0, count($examples) - 1)]?></span> 
						</td>
					</tr>
					<tr>
						<td colspan=2 align="right">
							<input id="new_apply_submit" type="submit" value="Отправить заявку" onclick="applySubmit()">
						</td>
					</tr>
				</table>
			</form>
			</div>			
				<div class="right_cont" id="apply_from" style="margin-top: 1em; width: 48%; display: none; ">
				<div style="background: none repeat scroll 0 0 #EAEAEA;border-radius: 3px 3px 3px 3px;margin-bottom: 20px;padding: 6px 15px 10px 30px;">
				<h3>Заявка от</h3>
				<?=$Auth->user_displayed_name; ?><br />
				<?=$MODULE_OUTPUT["people"]["comment"]?>
				</div>
				</div>
			</div>
			<div style="clear: both;"></div>
			<div id="apply_success" style="display: none; "></div>
			<img src="http://nsau.edu.ru/images/rm/rm.jpg" id="comp_img"  style="display: none; " />
			<?php 
		}
		break;
		default: {
			
		}
		break;
	}

	