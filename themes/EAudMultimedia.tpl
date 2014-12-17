<?php
// version: 1.00.0
// date: 2013-03-27
global $Engine, $Auth, $EE;
$MODULE_OUTPUT = $MODULE_DATA["output"];

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
  echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}
//var_dump($MODULE_OUTPUT["mode"]);
//print_r($MODULE_DATA);

if (isset($MODULE_OUTPUT["mode"])) {
  switch ($MODULE_OUTPUT["mode"]) {
  case "apply":
  $timepars = array("09:00 - 10:20","10:30 - 11:50","12:30 - 13:50","14:00 - 15:20","15:30 - 16:50","17:00 - 18:20","18:30 - 19:50");
  ?>
  <?php  
  if ($Engine->OperationAllowed($MODULE_OUTPUT["module_id"], "multimedia.apply", -1, $Auth->usergroup_id)) {   
  ?>
  <script>jQuery(document).ready(function($) {InputCalendar();});</script>
  <h2>Добавление заявки на использование мультимедийного оборудования</h2>
  <form action="<?=$EE["unqueried_uri"]?>" method="post" name="apply_form">
			
			<input type="hidden" name="module_id" value="<?=$MODULE_DATA["output"]["module_id"]?>" />
      <p>Аудитория:<br />
			<select name="auditorium" size="1"><?
			foreach ($MODULE_DATA["output"]["auditories"] as $auditorium) {
				?><option value="<?=$auditorium["id"]?>">
				<?=$auditorium['label'];?>-<?=$auditorium['name'] ?>
				</option><?
			}
			?>
			</select></p>
      <p>Дата: <br />
      <input type="text" name="date" class="date_time"  value="<?=date('Y-m-d')?>" id="apply_date" /> 
      </p>
      <p>Номер пары: <br />
      <select name="num" id="apply_num">
<?php           for($i=1; $i<8; $i++) { ?>
													<option value="<?=$i?>"><?=$i?> (<?=$timepars[$i-1]?>)</option>
<?php    		} ?>
												</select>
      </p>
      <div class="wide">
								<input type="submit" value="Добавить запись" class="button" id="apply" />
							</div>
      </form>
      <?php } ?>
      <table width="1000px" cellspacing="2" cellpadding="3">
      <tr bgcolor="#BBBBBB">
      <td>Преподаватель</td>
      <td>Аудитория</td>
      <td>Пара</td>
      <td>Дата</td>
      <td></td>
      </tr>
      <?
      $i = 0; 
				if (isset($MODULE_OUTPUT["applications"]) && !empty($MODULE_OUTPUT["applications"]))
					foreach ($MODULE_OUTPUT["applications"] as $application) {
						?>
            <tr id="app_row_<?=$application['id']?>" style="background-color: <?php echo (($i++ % 2) ? '#E5DDDD':'#F5EAEA');?>">
            <td><?=$application['last_name']?> <?=$application['first_name']?> <?=$application['patronymic']?></td>
            <td><?=$application['label'] ?>-<?=$application['name'] ?></td>
            <td><?=$application['num'] ?>  (<?=$timepars[$application['num']-1]?>)</td>
            <td><?=$application['date'] ?></td>
            <td><a href="del_app/<?=$application['id']?>" class="del_app" onclick="if(confirm('Вы действительно желаете удалить заявку?')){return true;}else{return false;}"><img src="/themes/images/delete.png" alt="Удалить заявку" /></a></td>
            </tr>
          <?php 
          }
          ?>
      </table>
  <?php
  break;
  }
}

?>