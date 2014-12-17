<?php
// version: 1.01.9
// date: 2014-06-18
global $Engine, $Auth, $EE;

switch ($MODULE_OUTPUT["mode"]) {
	case "ajax_edit_subj":
		//echo json_encode($MODULE_OUTPUT["curriculum"]);
	break;
	case "ajax_subjects": {
		if(isset($MODULE_OUTPUT['subjects_list'])) {
					header("Content-type: text/html; charset=windows-1251"); ?>
					<select name="edit_subject_id" size="1" class="action_edit subject_list">
												<option></option>
		<?php			if (isset($MODULE_OUTPUT["subjects_list"])) {
							foreach ($MODULE_OUTPUT["subjects_list"] as $depart) { ?>
												<optgroup label="<?=$depart["name"]?>">
		<?php					foreach ($depart["subj"] as $subject) { ?>
													<option value="<?=$subject["sid"]?>"<?=($subject["sid"] == $MODULE_OUTPUT["subject_id"] ? ' selected="selected"' : '')?>><?=$subject["sname"]?></option>
		<?php					} ?>
												</optgroup>
		<?php				}
						} ?>
											</select>
					<?php 
				}
			}
	break;
	case "show_specialities":
		foreach($MODULE_OUTPUT["specialities"] as $spec_type => $specialities){
			?>
			<h2><?=$MODULE_OUTPUT["spec_type_codes"][$spec_type] ?></h2>
 
			<ul>
			<?php 
			foreach($specialities as $spec){
				?>
				<li><a href="<?=$MODULE_OUTPUT["uri"]?>subjects/<?=$spec["id"] ?>/<?=$spec["spec_type"] ?>/"><?=$spec["code"]?>.<?=$spec["spec_type"] ?> - <?=$spec["name"] ?></a></li>
				<?php 
			}
			?>
			</ul>
			<?php
		}
	break;
	case "izop_old": {		 
		include("./izop_old/core/settings.php");
		$course = 6;
		$form = 0;  
		
		$conn=mysql_connect($database_host,$user,$password);
		if(AT_HOME) mysql_select_db("material", $conn) or die(mysql_error() );
		else mysql_select_db($db_name, $conn) or die(mysql_error() );
		mysql_query("set names cp1251", $conn) or die(mysql_error() );
		mysql_query("set character set cp1251", $conn) or die(mysql_error() );
		if($MODULE_OUTPUT["spec_id"]) {
			//////
			$spec = $MODULE_OUTPUT["spec_id"];
			if(isset($MODULE_OUTPUT['form'])) $form = $MODULE_OUTPUT['form'];
			$result=mysql_query("select name_speciality, code_spec from specialities where id_speciality='$spec'", $conn) or die(mysql_error());
			$row=mysql_fetch_array($result);
			?>
			<h1><?php echo $row['name_speciality']; ?></h1>
			<?php 
			{
	for($j=1;$j<=$course*2;$j++)
	{
$crs=ceil($j/2);
$sql = "select distinct discipline_name from materials where sem_num='$j' and ".(($branch != 0) ? " id_branch='$branch' and " : "" )." id_speciality='$spec' ".(($form != 0) ? "and id_form='$form'" : "" )." order by discipline_name";
//echo $sql;
$result=mysql_query($sql, $conn);
if(mysql_num_rows($result) == 0) continue;
?>
<!--Курс-->

<p id="blue_h2_b">Курс: <?echo $crs?> Семестр: <?echo $j?></p>


<!--<p id="blue_h2_b" style="font-size: 12px;">I курс 1 семестр</p>
<p id="blue_h2_b" style="font-size: 12px;">I курс 2 семестр</p>-->
                        <table width="100%" cellpadding="0" cellspacing="0">

                           <!--
						   <tr><td></td></tr>
						    <tr>
                                <td width="330"><p id="table_h2_b">Список дисциплин</p></td>
                                <td width="110"><p id="table_h2_b_center">Часы (теория)</p></td>
                                <td width=""><p id="table_h2_b_center">Часы (практика)</p></td>
                                <td width="150"><p id="table_h2_b_center">Отчетность</p></td>
                            </tr>
							-->
<?

$discip="";

while($row=mysql_fetch_array($result)){
      $i++;
      ?>
<!--Дисциплина-->
            <tr>
                 <td valign="top" width="489">
                     <div id="discipline">
                        <a href="javascript:ShowHide(<?echo $i?>);" class="olm_menu_first"><?echo $row["discipline_name"]?></a>
                            <div id="win<?echo $i ?>" style="display:none;">
                       <?
                       //$result2=mysql_query("select * from materials m, kind_material k where m.sem_num='$j' and m.id_form='$form' and m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind and m.id_branch='$branch'");
					   //$result2=mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind and m.id_branch='$branch'");


                        if(!isset($branch) && $branch!=0) $s_branch = " and m.id_branch='$branch'"; else $s_branch="";

                        ?>
						<?php
                        $result3 = mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and m.sem_num='$j' and id_speciality='$spec' and k.id_kind=m.id_kind and (k.cat_kind='task') ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch", $conn) or die(mysql_error());
                        if(mysql_num_rows($result3) > 0)
						{
						  $rows3 = array();
                          while($row3 = mysql_fetch_array($result3)){
                            $rows3[] = $row3;
                          }
						?>
                        <div id="olm_link_second" style="padding-left: 1ex; ">
                                <a href="javascript: " onclick="ShowHide('<?echo $i ?>-2')" class="olm_menu_second">Задания<?php if($rows3[0]['id_kind'] == 1 && $row["discipline_name"] == 'Электропривод и электрооборудование'){ ?> для контрольных работ<?php } ?></a>


                       </div>
                       <div id="win<?php echo $i ?>-2" style="display: none; ">
                       <?php
                       foreach($rows3 as $row3)
                       {
                       //print_r($row3);
					   ?>

                       <div id="olm_link_third" style="padding-left: 3ex; margin-bottom: 1ex;">
                        <a href="http://izop.nsau.edu.ru/down.php?id=<?php echo $row3['id_material'] ?>" class="olm_menu_second"><?if($row3['title']) echo (trim($row3['author'] != '') ? trim($row3['author']).'. ' : '').$row3['title']/*.' ('.$row3['name_kind'].')'*/; else echo $row3['name_kind'] . (trim($row3['author'] != '') ? ' ('.trim($row3['author']).') ' : ''); ?></a>
                       </div>
                       <?
                       }
                       ?>
                       </div>
                       <?php
					   }
					   ?>
					   <?php
                        $result3 = mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and m.sem_num='$j' and id_speciality='$spec' and k.id_kind=m.id_kind and (k.cat_kind = 'teor') ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch", $conn) or die(mysql_error());
                        ?>
                        <?php
						if(mysql_num_rows($result3) > 0)
						{
						?>
                        <div id="olm_link_second" style="padding-left: 1ex; ">
                                <a href="javascript: " onclick="ShowHide('<?echo $i ?>-1')" class="olm_menu_second">Теоретический материал</a>


                       </div>
                       <div id="win<?php echo $i ?>-1" style="display: none; ">
                       <?php
                       while($row3 = mysql_fetch_array($result3)){

                       ?>

                       <div id="olm_link_third" style="padding-left: 1ex; ">
                        <a href="http://izop.nsau.edu.ru/down.php?id=<?php echo $row3['id_material'] ?>" class="olm_menu_second"><?if($row3['title']) echo (trim($row3['author'] != '') ? trim($row3['author']).'. ' : '').$row3['title']/*.' ('.$row3['name_kind'].')'*/; else echo $row3['name_kind'] . (trim($row3['author'] != '') ? ' ('.trim($row3['author']).') ' : '');?></a>
                       </div>
                       <?
                       }
                       ?>
                       </div>
					   <?
                       }
                       ?>
                       <?php
					   //echo "select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind and k.cat_kind='' ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch";
						$result3 = mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and m.sem_num='$j' and id_speciality='$spec' and k.id_kind=m.id_kind and (k.cat_kind='' or isnull(k.cat_kind)) ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch", $conn) or die(mysql_error());
					   ?>
                       <?php
                       while($row3 = mysql_fetch_array($result3)){
                       ?>

                       <div id="olm_link_second" style="padding-left: 1ex; ">
                        <a href="http://izop.nsau.edu.ru/down.php?id=<?php echo $row3['id_material'] ?>" class="olm_menu_second"><?if($row3['title']) echo (trim($row3['author'] != '') ? trim($row3['author']).'. ' : '').$row3['title']/*.' ('.$row3['name_kind'].')'*/; else echo $row3['name_kind']?></a>
                       </div>
                       <?
                       }
                       ?>


					   <?php
                       //$result2=mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch");
                      /*$result2=mysql_query("select k.id_kind as id, k.name_kind as name from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch group by k.id_kind") or die(mysql_error());
                       while($row2=mysql_fetch_array($result2)){

                             ?>
                             <div id="olm_link_second">
                                <a href="javascript: " onclick="ShowHide(<?echo $i ?><?php echo $row2["id"]?>)" class="olm_menu_second"><?php echo $row2['name'] ?></a>
                             </div>

                             <div id="win<?echo $i ?><?php echo $row2["id"]?>" style="display: none; "><?php
                             $result3 = mysql_query("select * from materials m, kind_material k where m.discipline_name='${row[discipline_name]}' and id_speciality='$spec' and k.id_kind=m.id_kind and k.id_kind='".$row2["id"]."' ".(($form != 0) ? "and id_form='$form'" : "" )." $s_branch") or die(mysql_error());
                             while($row3 = mysql_fetch_array($result3)){
                             ?>

                             <div id="olm_link_third">
                              <a href="material/<?echo $row3["file"] ?>" class="olm_menu_second"><?if($row3['title']) echo trim($row3['author']).'. '.$row3['title'].' ('.$row3['name_kind'].')'; else echo $row3['name_kind']?></a>
                             </div>
                             <?
                             }
                             ?>
                             </div>
                             <?php
                       }*/
                       ?>
                            </div>
                     </div>
                 </td>
            </tr>
            <?
      }
  ?>
   <tr>
                                <td width="100%" height="20" colspan="6" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                          </tr>
                        </table>
  <?
}
}
			//////
		}
		else {
			if($MODULE_OUTPUT["branch"] == 'biologic') {
				?>
				<h1>Биологическое отделение</h1>
				<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">

                                <div id="specialities_source_common">
                                <? /*include("warning.php") */?>
                                    <div id="specialities_name">1. Агрономия</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/agronomy_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/agronomy_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec_id=1&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="material_1.php?spec=1&section=<? echo $section ?>" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="material_1.php?spec=1&form=2" class="map">Ускоренная форма обучения</a></div>
                                    <!--<div id="specialities_source"><a href="material_biologic_agronomy_full_1.php" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="material_biologic_agronomy_ext_1.php" class="map">Ускоренная форма обучения</a></div>-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">2. Агроэкология</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/agroecology_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/agroecology_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec_id=2&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="material_1.php?spec=2" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="material_1.php?spec=2&form=2" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">3. Технология производства и переработки с.-х. продукции</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/technology_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/technology_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=3&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="#" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="#" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">4. Стандартизация и сертификация</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <!--<div id="specialities_source"><a href="archive/curriculums/technology_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>-->
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/standart_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=25&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="#" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="#" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <!--Специальность-->

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">5. Технология продуктов питания и сервиса общепита</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/ycheb_plan_6_pitanie.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <!--<div id="specialities_source"><a href="archive/curriculums/standart_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div>--><br>

                                    <div id="specialities_source"><a href="?spec=26&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="#" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="#" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>

<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">6. Зоотехния</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/zootech_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=4&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="material_biologic_zootech_full_1.php" class="map">Полная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">7. Ветеринария</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/veterinary_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=5&branch=1&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="material_biologic_veterinary_ext_1.php" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">8. Ветеринарно-санитарная экспертиза</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/experts_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=52&section=<? echo $section ?>&form=1" class="map">Учебно-методический материал</a></div>
                                    <!--
									<div id="specialities_source"><a href="material_biologic_veterinary_ext_1.php" class="map">Ускоренная форма обучения</a></div>
									-->
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
				<?php 
			}
			if($MODULE_OUTPUT["branch"] == 'engineering') {
				?>
				<h1>Инженерное отделение</h1>
				<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">

                                <div id="specialities_source_common">
                                    <div id="specialities_name">1. Механизация сельского хозяйства</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/mechanization_full.doc" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/mechanization_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=6&branch=3&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
                        
                        <!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">2. Электрификация и автоматизация сельского хозяйства</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/electrification_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=7&branch=3&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
<!--Специальность-->
                       <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">3. Автомобили и автомобильное хозяйство</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/auto_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=8&branch=3&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">4. Технология обслуживания и ремонта машин в АПК</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/repair_full.doc" class="map">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/repair_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=9&branch=3&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>

                        <!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">5. Эксплуатация транспортно-технологических машин и комплексов</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <!--<div id="specialities_source"><a href="archive/curriculums/repair_full.doc" class="map">Полная форма обучения</a></div> -->
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/expl_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                   <div id="specialities_source"><a href="?spec=35&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
				<?php 
			}
			if($MODULE_OUTPUT["branch"] == 'economic') {
				?>
				<h1>Экономическое отделение</h1>
				<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                <? include("warning.php") ?>
                                    <div id="specialities_name">1. Бухгалтерский учет анализ и аудит</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/bookkeeper_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/bookkeeper_ext.doc" class="map" title="Скачать документ">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=10&branch=2&section=<? echo $section ?>" class="map">Учебно-методический материал</a></div>
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">2. Экономика и управление на предприятии АПК</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/economy_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/economy_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=11&branch=2&section=<? echo $section ?>" class="map">Учебно-методический материал</a>
                                    </div>
                                  </div>
                                </td>
                            </tr>
                          </table>
							<table width="100%" cellpadding="0" cellspacing="0">
               <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                            <tr>
                              <td align="left" valign="top">
							  <div id="specialities_source_common">
							  <div id="specialities_name">3. Финансы и кредит</div>
							  <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план</div>
									<div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/grafik_fin_kred.htm" class="map">График учебного процесса</a></div>
									<br>
									<div id="specialities_source"><a href="?spec=27&branch=2&section=<? echo $section ?>" class="map">Учебно-методический материал</a>
                                    </div>
									<br>
							  </div>							  </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                    <div id="specialities_name">4. Управление персоналом</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/personal_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <!--<div id="specialities_source"><a href="archive/curriculums/economy_ext.doc" class="map">Ускоренная форма обучения</a></div>--><br>

                                    <div id="specialities_source"><a href="?spec=28&branch=2&section=<? echo $section ?>" class="map">Учебно-методический материал</a>
                                    </div>
                                  </div>
                                </td>
                            </tr>
                          </table>
				
				<?php 
			}
			if($MODULE_OUTPUT["branch"] == 'gmu') {
				?>
				<h1>Отделение государственного и муниципального управления</h1>
				<!--Специальность-->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left" valign="top">
                                <div id="specialities_source_common">
                                <? /*include("warning.php")*/ ?>
                                    <div id="specialities_name">Государственное и муниципальное управление</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/gmu_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/gmu_ext.doc" class="map">Ускоренная форма обучения</a></div><br>

                                    <div id="specialities_source"><a href="?spec=12&branch=4&form=2&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал (ускоренная форма)</a></div>
									<div id="specialities_source"><a href="?spec=12&branch=4&form=1&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал (полная форма)</a></div>
                                    </div>

                                    <div id="specialities_source_common">
                                <? /*include("warning.php")*/ ?>
                                    <div id="specialities_name">Управление персоналом</div>
                                    <div id="specialities_comment"></div>
                                    <div id="specialities_source">Учебный план:</div>
                                    <div id="specialities_source"><a href="http://izop.nsau.edu.ru/archive/curriculums/personal_full.doc" class="map" title="Скачать документ">Полная форма обучения</a></div>
                                    <br>

                                    <?php /*?><div id="specialities_source"><a href="material_2.php?spec=28&form=2&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал</a></div><?php */?>
									<div id="specialities_source"><a href="?spec=28&form=1&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал (полная форма)</a></div>
                                    </div>

                                    <!--<div id="specialities_source"><a href="javascript:ShowHide(555);" class="map" title="Скачать документ">Полная форма обучения</a></div>

                                    <div id="win555" style="display:none;">
                                    <div id="olm_link_second"><a href="archive/curriculums/gmu_full.doc" class="olm_menu_second">План-график</a></div>
                                    <div id="olm_link_second"><a href="material_2.php?spec=12&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал</a></div>
                                    </div>-->
                                    <!--<div id="olm_link_second"><a href="archive/curriculums/gmu_full.doc" class="map">Полная форма</a></div>-->
                                    <!--
                                    <div id="specialities_source"><a href="javascript:ShowHide(444);" class="map">Ускоренная форма обучения</a></div>
                                    <div id="win444" style="display:none;">
                                    <div id="olm_link_second"><a href="archive/curriculums/gmu_ext.doc" class="olm_menu_second">План-график</a></div>
                                    <div id="olm_link_second"><a href="material_2.php?spec=12&branch=4&section=<? echo $section ?>" class="olm_menu_second">Учебно-методический материал</a></div>
                                    <div id="olm_link_second"><a href="#" class="olm_menu_second">Расписание</a></div>
                                    </div> -->
                                    <!--<div id="specialities_source"><a href="material_2.php?spec=12&branch=4" class="map">Учебно-методический материал</a></div>  -->
                                  </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="1" colspan="2" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
				<?php 
			}
		}
	}
	break;
	case "manage_branches": 
		foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
		{
			echo "<p class=\"message\">$data</p>\n";
		}
		
		foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
		{
			echo "<p class=\"message red\">$data</p>\n";
		}
		
		?>
		<link rel="stylesheet" href="<?=HTTP_THEMES?>styles/izop_admin.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'izop_admin.css')?>" type="text/css" />
		
<?php	if(isset($MODULE_OUTPUT['sub_mode']) && $MODULE_OUTPUT['sub_mode'] == 'edit_branch') {
	$branch = $MODULE_OUTPUT["branch"]; 
	?>
			<h2>Редактирование отделения</h2>
			<form action="" name="branch_form" method="post">
			<h3>Название отделения</h3>
			<input type="text" name="branch_name" value="<?=$branch["name"] ?>" />
			<h3>Специальности</h3>
			<?php 
			foreach($MODULE_OUTPUT["specialities"] as $speciality) {
				?>
				<input type="checkbox" name="spec[<?=$speciality["id"] ?>]" value="<?=$speciality["id"] ?>" <?php if(!empty($speciality["selected"])){?> checked="checked"<?php }?> />
				<?=$speciality["code"] ?> - <?=$speciality["name"] ?><br />
				<?php 
			}
			?>
			<input class="button" type="submit" value="Сохранить" />
			<input type="hidden" name="mode" value="edit" />
			<input type="hidden" name="id" value="<?=$branch["id"] ?>" />
			</form>

<?php	} elseif(count($MODULE_OUTPUT["branches"])) { ?>
			<div class="speciality_directory">
			<ul>
<?php	 	foreach($MODULE_OUTPUT["branches"] as $branch) { ?>
				<li>
					<div class="list_title inline-block">
						<?=$branch["name"]?>
						<div>
							<a title="Редактировать" href="edit_branch/<?=$branch["id"]?>/"><img src="/themes/images/edit.png" /></a>
							<a href="del_branch/<?=$branch["id"]?>"><img src="/themes/images/delete.png" title="Удалить отделение" onclick="if(confirm('Вы действительно желаете удалить отделение?')){return true;}else{return false;}" /></a>
						</div>
					</div>
<?php 				if(count($branch["specialities"])) { ?>
						<ul>
<?php 					foreach($branch["specialities"] as $spec) { ?>
							<li>
								<div class="list_title inline-block">
									<?=$spec["code"]?>.<?=$spec["type_code"]?> - <?=$spec["name"]?>
									<div>
										<a href="del_branch_spec/<?=$spec["branch_spec_id"]?>/"><img src="/themes/images/delete.png" alt="Удалить специальность с отделения" onclick="if(confirm('Вы действительно желаете удалить специальность?')){return true;}else{return false;}" /></a> 
										<?php if($spec["allow_edit"]) { ?><a title="Учебный план" href="edit_curriculum/<?=$spec["id"]?>/"><img src="/themes/images/clipboard.png" alt="Учебный план" /></a><?php } ?>
									</div>
								</div>
							</li>
<?php 					} ?>
						</ul>
<?php 				} ?>
				</li>
<?php	 	} ?>
			</ul>
			</div>
			<br />
			<h2>Добавить отделение</h2>
			<form action="" name="branch_form" method="post">
			<h3>Название отделения</h3>
			<input type="text" name="branch_name" />
			<input class="button" type="submit" value="Добавить" />
			<input type="hidden" name="mode" value="add" />
			</form>
<?php 	} elseif(isset($MODULE_OUTPUT["curriculum"])) {
		//print_r($MODULE_OUTPUT["curriculum"]);
		$curriculum = $MODULE_OUTPUT["curriculum"]; 
		$profiles = $MODULE_OUTPUT["profiles"]; 
		$form_back = $MODULE_OUTPUT['form_back'];
		?>
		<script>jQuery(document).ready(function($) {Curriculum(<?=$MODULE_OUTPUT['module_id']?>);ajaxSearchSubj(<?=$MODULE_OUTPUT['module_id']?>);});</script>
		<div id="curriculum">
		<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<fieldset>
			<legend>Добавить дисциплины к специальности <?=$MODULE_OUTPUT['spec']["code"]?> &quot;<?=$MODULE_OUTPUT['spec']["name"]?>&quot;</legend>
				
					<?php 
					if(isset($MODULE_OUTPUT['mess']['curriculum']) && count($MODULE_OUTPUT['mess']['curriculum'])) { ?>
								<div class="wide">
					<?php				foreach($MODULE_OUTPUT['mess']['curriculum'] as $mess) { ?>
									<p class="message red"><?=$mess?></p>
					<?php				} ?>
								</div>
					<?php			} ?>
					<div class="wide">
						<div class="form-notes">
							<dl>
							<dt>Семестр</dt>
							<dd>
								<select name="semester">
									<?php 
									for($i = 1; $i <= 12; $i++) {
										?>
										<option value="<?=$i ?>"<?=$form_back["semester"] == $i ? " selected='selected'" : "" ?>><?=$i ?></option> 
										<?php 
									}
									?>
								</select>
							</dd>
							</dl>
							<?php 
							if(count($MODULE_OUTPUT["profiles"])) {
								?>
								<dl>
									<dt>Профиль: </dt>
									<dd>
									<select name="profile_id">
									<?php 
									foreach($MODULE_OUTPUT["profiles"] as $profile) {
										?>
										<option value="<?=$profile["id"]?>"<?=$form_back["profile_id"] == $profile['id'] ? " selected='selected'" : "" ?>><?=$profile["name"]?></option>
										<?php 
									}
									?>
									</select>
									</dd>
								</dl>
								<?php
							}
							?>
						</div>
						<div class="form-notes">
							<dl>
								<dt>Форма</dt>
								<dd>
									<select name="form">
									<?php 
									foreach($MODULE_OUTPUT["forms"] as $form) {
										?>
										<option value="<?=$form?>"<?=$form_back["form"] == $form ? " selected='selected'" : "" ?>><?=$form?> форма</option>
										<?php 
									}
									?>
									</select>
								</dd>
							</dl>
						</div>
						</div>
						<div class="wide">
							<div class="form-notes">
								<dl>
									<dt><label>Выберите дисциплину: </label></dt>
									<dd>
										<ul id="subject_select" class="select_long" title="Чтобы выбрать дисциплину, дважды щелкните на ее названии">
							<?php				foreach($curriculum['departments'] as $dep_id => $dep) { ?>
											<li>
												<dl>
													<dt><?php if(!empty($dep['name'])) { ?><?=$dep['name']?><?php  } else { ?>Дисциплины, не привязанные к кафедре<?php } ?></dt>
											<?php					foreach($dep['subjects'] as $subj_id => $subj) { ?>
													<dd id="subjid_<?=$subj_id?>" data-id="<?=$subj_id?>"><?=$subj?></dd>
												<?php } ?>										
												</dl>
											</li>
										<?php } ?>
										</ul>
									</dd>
								</dl>
								<?php /* ?><div class="select_subject" style="display: none; ">
									<label>Выберите дисциплины</label>&nbsp;<a href="javascript:void(0)">Развернуть все</a>&nbsp;<a href="javascript:void(0)" style="display: none;" >Свернуть все</a>
		<?php			if(isset($curriculum['departments'])) { ?>
									<ul>
		<?php				foreach($curriculum['departments'] as $dep_id => $dep) { ?>
										<li>
											<label><?php if(!empty($dep['name'])) { ?><?=$dep['name']?><?php  } else { ?>Дисциплины, не привязанные к кафедре<?php } ?></label>
											<dl>
		<?php					foreach($dep['subjects'] as $subj_id => $subj) { ?>
												<dt class="subj_<?=$subj_id?>" data-id="<?php echo $subj_id; ?>">
													<label title="<?=$subj?>">
														<input type="checkbox" value="<?=$subj_id?>" name="subject_id[<?=$subj_id?>]"<?=(isset($form_back['add_subject']['select_subject'][$subj_id]) ? " checked='checked'" : "")?> /><?=$subj?>
													</label>
												</dt><!-- 
												<dd></dd> -->
		<?php					} ?>
											</dl>
										</li>
		<?php				} ?>
									</ul>
		<?php			} ?>
								</div><?php */ ?>							
							</div>
							<div class="form-notes">
								<dl>
									<dt>Найти дисциплину: </dt>
									<dd><input type="text" id="subject_search_and_add" size="10" title="Быстрый поиск" placeholder="Введите часть названия" style="width: 265px; " /></dd>
									<dt>Будут добавлены дисциплины: </dt>
									<dd>
									<ul id="selected_subjects" class="select_long">
									</ul>
									</dd>
								</dl>
							</div>							
						<div class="wide">
							<input type="submit" value="Добавить" />
						</div>
						</div>					
				</fieldset>	
					<input type="hidden" name="mode" value="edit" />
					<input type="hidden" name="id" value="<?=$MODULE_OUTPUT["spec"]["id"] ?>" />
		</form>
		<form action="<?=$EE["unqueried_uri"]?>" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>Загрузить дисциплины к специальности <?=$MODULE_OUTPUT['spec']["code"]?> &quot;<?=$MODULE_OUTPUT['spec']["name"]?>&quot;</legend>
				
						<div class="wide">
							<div class="form-notes">
								<dl>
									<dt>Путь к csv-файлу: </dt>
									<dd>
										<input type="file" name="csvfile" />
									</dd>
								</dl>
								<?php 
							if(count($MODULE_OUTPUT["profiles"])) {
								?>
								<dl>
									<dt>Профиль: </dt>
									<dd>
									<select name="profile_id">
									<?php 
									foreach($MODULE_OUTPUT["profiles"] as $profile) {
										?>
										<option value="<?=$profile["id"]?>"<?=$form_back["profile_id"] == $profile['id'] ? " selected='selected'" : "" ?>><?=$profile["name"]?></option>
										<?php 
									}
									?>
									</select>
									</dd>
								</dl>
								<?php
							}
							?>
							<dl>
								<dt>Форма</dt>
								<dd>
									<select name="form">
									<?php 
									foreach($MODULE_OUTPUT["forms"] as $form) {
										?>
										<option value="<?=$form?>"<?=$form_back["form"] == $form ? " selected='selected'" : "" ?>><?=$form?> форма</option>
										<?php 
									}
									?>
									</select>
								</dd>
							</dl>
							</div>
						</div>
						<div class="wide">
							<input type="submit" value="Добавить" />
						</div>
			</fieldset>
					<input type="hidden" name="mode" value="upload" />
					<input type="hidden" name="id" value="<?=$MODULE_OUTPUT["spec"]["id"] ?>" />
		</form>
		<form action="<?=$EE["unqueried_uri"]?>" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>План-графики</legend>
				<div class="wide">
				<table border="1">
				<?php 
				$profiles = $MODULE_OUTPUT["profiles"];
				$curr_files = $MODULE_OUTPUT["curriculum_files"];
				if(count($profiles) == 0) $profiles = array(array('id' => 0, 'name' => ''));
				foreach($profiles as $profile) { 
					if($profile['id'] != 0) {
						?>
						<tr><th colspan="2"><?=$profile["name"]; ?></th></tr>
						<?php
					}
					foreach($MODULE_OUTPUT['forms'] as $form) {
					?>
					<tr>
						<td><?php echo $form; ?> форма</td>
						<td>
						<select name="curriculum_file[<?=$profile['id'];?>][<?=$form?>]">
						<option value="0"></option>
						<?php 
						foreach($MODULE_OUTPUT["files"] as $file_id => $file) {
							?><option value="<?php echo $file_id;?>"<?php if(isset($curr_files[$profile['id']][$form]) && $curr_files[$profile['id']][$form] == $file_id) { ?>  selected="selected"<?php } ?>><?=$file["name"]?>.<?=$file["filename"];?></option><?php 
						}
						?>
						</select>
						</td>
					</tr>
					<?php 
					} 
				}
				?>
				</table>
				</div>
				<div class="wide">
							<input type="submit" value="Сохранить" />
						</div>
			</fieldset>
			<input type="hidden" name="mode" value="add_curriculum_files" />
			<input type="hidden" name="id" value="<?=$MODULE_OUTPUT["spec"]["id"] ?>" />
		</form><a href="/office/speciality_directory/add_profile/<?=$MODULE_OUTPUT['spec']['id']?>">Добавить профиль</a>
		<?php 
		foreach($MODULE_OUTPUT["curriculum"]["profiles"] as $profile) {
			foreach($profile['forms'] as $form => $form_subjects) { ?>
			<fieldset class="subject_group_item">
			<?php 
			if(!empty($profile["name"])){
				?>
				<legend>Профиль: <?=$profile["name"]?>, Форма: <?=$form;?></legend>
				<?php 
			}
			?>
				
				<div class="subject_list">
				<?php 
				$sem = 0;
				$i = 0;
				foreach($form_subjects["subjects"] as $cur_id => $subject){
					if($sem != $subject["semester"]) {  
/*if($sem != 0) {
?>
</div>
<?php
} */
?>
					<?php 
					$sem = $subject["semester"];  
					} 
					?>
						<a name="cur-<?php echo $cur_id; ?>"></a>
						<div class="subject_row" id="subject_row_<?=$cur_id?>">
						<form class="del_sgroup edit_form" id="edit_form_<?php echo $cur_id; ?>" action="<?=$EE["unqueried_uri"]?>" method="post">
								<div class="subject_action">
										<input type="hidden" name="edit_cur_id" value="<?=$cur_id?>" />
										<button class="input_submit action_del" type="submit" value="" title="Удалить"></button>
										<button class="input_submit action_edit" type="submit" value="" title="Сохранить"></button>
										<label class="inline-block action_del" title="Редактировать"><input type="radio" name="action_del" value="0" id="editbutton_<?=$cur_id?>" /></label>
										<label class="inline-block action_edit" title="Отмена редактирования"><input type="radio" name="action_del" value="1" checked='checked' id="cancelbutton_<?=$cur_id?>" /></label>
								</div>
								<div style="float: left; width: 6ex; padding-left: 2ex;" title="Семестр" class="subj_semester">
									<span class="action_del"><?=$subject["semester"]?></span>
									<select name="edit_semester" class="action_edit">
										<?php 
										for($i = 1; $i <= 12; $i++) {
											?>
											<option value="<?=$i ?>"<?php if($i == $subject["semester"]) {?> selected="selected"<?php } ?>><?=$i ?></option> 
											<?php 
										}
										?>
									</select>
								</div>
								<div style="float: left; width: 40%; padding-left: 1ex;" class="subj_name">
									<span class="action_del"><a href="/subjects/<?=$subject["subject_id"]?>/" title="Файлов: <?=$subject['num_files']?>"><?=$subject["name"]?></a></span>
									<select class="action_edit subject_list" name="edit_subject_id">
<?php 								/*foreach($curriculum['departments'] as $dep_id => $dep) { ?>
										<optgroup label="<?=$dep["name"]?>">
<?php 										foreach($dep['subjects'] as $subj_id => $subj) { ?>
												<option value="<?=$subj_id?>"<?php if($subj_id == $subject["subject_id"]) {?> selected="selected"<?php } ?>><?=$subj?></option>
<?php 										} ?>
										</optgroup>
<?php 								}*/ ?>
									</select>
									<input type="text" id="subject_search_<?=$cur_id?>" size="10" title="Быстрый поиск" placeholder="Введите часть названия" class="action_edit subject_search" style="display: none; width: 265px; " /> 
									<a href="javascript: void(0)" onclick="jQuery(this).parent().find('.subject_search').show(); jQuery(this).parent().find('.subject_list').hide(); jQuery(this).hide(); " class="action_edit" title="Поиск по фрагменгту названия">Искать</a>
								</div>
								<div style="float: left; width: 30%; padding-left: 1ex;" class="subj_department"><span><?=$subject['department']; ?></span></div>
								<?php if(!empty($profiles[$subject["profile_id"]])) {
									?>
								<div style="float: left; width: 40%; padding-left: 1ex; display:none; " class="subj_profile">
									<span class="action_del"><?=$profiles[$subject["profile_id"]]["name"]?></span>
									<select class="action_edit" name="edit_profile_id">
										<option value="0">---</option>
<?php 									foreach($profiles as $prof_id => $prof) {?>
											<option value="<?=$prof_id?>"<?php if($prof_id == $subject["profile_id"]) {?> selected="selected"<?php } ?>><?=$prof["name"]?></option>
<?php 									} ?>
									</select>
								</div>
								<div class="progress-bar" style="color: #f00" id="progress-bar-<?=$cur_id?>"></div>
									<?php  
								} ?>							
						</form>
						</div>
					<?php 
					$i++; 
					
					 
					?>
					
					
					<?php 
				}
				?>
				</div>
			</fieldset>
			<?php 
		}
		}
		?>
		
		</div>
			<a href="<?=$EE["engine_uri"]?>download_curriculum/<?=$MODULE_OUTPUT["spec"]["id"] ?>">Скачать</a>
		<?php 
		} 
	break; 
	case "manage_places": 
		if(isset($MODULE_OUTPUT["messages"]["bad"])) {
			foreach($MODULE_OUTPUT["messages"]["bad"] as $mess) { ?>
		<p class="message red"><?=$mess?></p>
<?php			}
			} 
	?>
	<div style="margin: 0 auto; padding-top: 20px; width: 625px">
	<form method="post" action="<?=$EE["engine_uri"]; ?>">
		<table border="1" cellpadding="1" cellspacing="1">
			<tr>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Код</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Направление (специальность)</td>
				<td bgcolor="#f9dfc5" colspan="2" align="center">Количество бюджетных мест</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Количество коммерческих мест</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Порядок сортировки</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Профиль направления</td>
			</tr>
			<tr>
				<td bgcolor="#f9dfc5" align="center">&nbsp;</td>
				<td bgcolor="#f9dfc5" align="center">В т.ч. целевых</td>
			</tr>
			<?php
			foreach($MODULE_OUTPUT["types"] as $type) {
				?>
				<tr>
					<td><input type="text" name="code[<?=$type["id"]?>]" value="<?=$type["code"]?>" size="6" /></td>
					<td><input type="text" name="type[<?=$type["id"]?>]" value="<?=$type["type"]?>" /></td>
					<td><input type="text" name="budget[<?=$type["id"]?>]" size="6" value="<?=$type["budget"] ?>" /><input type="hidden" name="id[<?=$type["id"]?>]" value="<?=$type["id"] ?>" /></td>
					<td><input type="text" name="purpose[<?=$type["id"]?>]" size="6" value="<?=$type["purpose"] ?>" /></td>
					<td><input type="text" name="commerce[<?=$type["id"]?>]" size="6" value="<?=$type["commerce"] ?>" /></td>
					<td><input type="text" name="sortorder[<?=$type["id"]?>]" size="2" value="<?=$type["sortorder"] ?>" /></td>
					<td>
						<select name="parent[<?=$type["id"]?>]" style="width: 10ex;">
						<option value="0">--</option>
						<?php
						foreach($MODULE_OUTPUT["types"] as $type2) {
							if($type2['pid'] == 0) {
							?>
							<option value="<?=$type2['id']?>"<?php if($type2["id"] == $type["pid"]){?> selected="selected"<?php   } ?>><?=$type2["type"]?></option>
							<?php 
							}
	} 
	?>
						</select>
					</td>
				</tr>
				<?php 
			} 
			?>
		</table>
		<div style="margin-top:10px; text-align: right;"><input type="submit"  value="Сохранить" /></div>
		<input type="hidden" name="mode" value="edit" />
	</form>
	</div>
	<div style="margin: 0 auto; padding-top: 20px; width: 625px">
	<h2>Добавить направление</h2>
		<form action="<?=$EE["unqueried_uri"]?>" method="post">
		<table border="1" cellpadding="1" cellspacing="1">
			<tr>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Код</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Направление (специальность)</td>
				<td bgcolor="#f9dfc5" colspan="2" align="center">Количество бюджетных мест</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Количество коммерческих мест</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Порядок сортировки</td>
				<td rowspan="2" bgcolor="#f9dfc5" align="center">Профиль направления</td>
			</tr>
			<tr>
				<td bgcolor="#f9dfc5" align="center">&nbsp;</td>
				<td bgcolor="#f9dfc5" align="center">В т.ч. целевых</td>
			</tr>
			<tr>
					<td><input type="text" name="code" value="" size="6" /></td>
					<td><input type="text" name="type" value="" /></td>
					<td><input type="text" name="budget" size="6" value="" /><input type="hidden" name="id" value="" /></td>
					<td><input type="text" name="purpose" size="6" value="" /></td>
					<td><input type="text" name="commerce" size="6" value="" /></td>
					<td><input type="text" name="sortorder" size="2" value="" /></td>
					<td>
						<select name="parent" style="width: 10ex;">
						<option value="0">--</option>
						<?php
						foreach($MODULE_OUTPUT["types"] as $type) {
							if($type['pid'] == 0) {
							?>
							<option value="<?=$type['id']?>"><?=$type["type"]?></option>
							<?php 
							}
	} 
	?>
						</select>
					</td>
				</tr>
		</table>
			<!--<h3>Название направления</h3>
			<input type="text" name="type" />
			<h3>Код</h3>
			<input type="text" name="code" />  -->
			<input class="button" type="submit" value="Добавить" />
			<input type="hidden" name="mode" value="add" />
		</form>
	</div>
	<?php 
	break;
	case "request":
		$summary = $MODULE_OUTPUT["summary"];  
		?>
		<h2>Информация о количестве поданных заявлений в разрезе направлений (специальностей) на <?=$MODULE_OUTPUT["date"]?></h2>
		<table border="1" cellspacing="1" cellpadding="1">
			<tbody>
				<tr>
					<td rowspan="2" width="70" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">Код</p>
					</td>
					<td rowspan="2" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">Направление (специальность)</p>
					</td>
					<td colspan="2" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">Кол-во бюджетных мест</p>
					</td>
					<td rowspan="2" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">Кол-во коммерческих мест</p>
					</td>
					<td rowspan="2" width="73" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">Кол-во поданных заявлений</p>
					</td>
					<td rowspan="2" bgcolor="#f9dfc5">
					<p>&nbsp;Конкурс</p>
					</td>
					</tr>
					<tr>
					<td width="67" bgcolor="#f9dfc5">
					<p align="center">&nbsp;</p>
					</td>
					<td width="93" bgcolor="#f9dfc5">
					<p align="center" style="text-align: center">В т.ч. целевых мест</p>
					</td>
				</tr>
				<?php
				foreach($MODULE_OUTPUT["types"] as $type) {
					?>
					<tr>
					<td width="70">
					<div><a href="../list/<?=$type["id"]?>"><?=$type["code"]?></a></div>
					</td>
					<td><a href="../list/<?=$type["id"]?>"><?=$type["type"]?></a></td>
					<td style="text-align: center;"><div><?=(int)$type["budget"]?></div></td>
					<td style="text-align: center;"><div><?=(int)$type["purpose"]?></div></td>
					<td style="text-align: center;"><div><?=(int)$type["commerce"]?></div></td>
					<td style="text-align: center;"><?php if($type["req_count"] > 0) { ?><a href="../list/<?=$type["id"]?>"><?php } ?><?=$type["req_count"]?><?php if($type["req_count"] > 0) { ?></a><?php } ?></td>
					<td style="text-align: center;"><div><?=$type["contest"]?:''?></div></td>
					</tr>
					<?php 
				} 
				?>
				<tr>
					<td width="70">
					<div></div>
					</td>
					<td><strong>ИТОГО</strong></td>
					<td style="text-align: center;"><strong><div><?=$summary["budget"]?></div></strong></td>
					<td style="text-align: center;"><strong><div><?=$summary["purpose"]?></div></strong></td>
					<td style="text-align: center;"><strong><div><?=$summary["commerce"]?></div></strong></td>
					<td style="text-align: center;"><strong><?=$summary["req_count"]?></strong></td>
					<td style="text-align: center;"><strong><div><?=$summary["contest"]?></div></strong></td>
					</tr>
			</tbody>
		</table>
		<?php 
	break; 
	case "quotas":
		?>
		<table border="1" cellspacing="0" cellpadding="0">
			<tbody>
			<tr>
			<td rowspan="3" width="83" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>Код</strong></p>
			</td>
			<td rowspan="3" width="485" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>Наименование</strong></p>
			</td>
			<td colspan="4" valign="top" width="411" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>Бакалавриат</strong></p>
			</td>
			</tr>
			<tr>
			<td colspan="2" width="195" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>НГАУ</strong></p>
			<p style="text-align: center;" align="center"><strong>&nbsp;контрольные цифры</strong></p>
			</td>
			<td rowspan="2" width="161" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>С оплатой стоимости обучения физическими и юридическими лицами</strong></p>
			</td>
			<td rowspan="2" width="55" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>Всего</strong></p>
			</td>
			</tr>
			<tr>
			<td width="57" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>всего</strong></p>
			</td>
			<td width="138" bgcolor="#f9dfc5">
			<p style="text-align: center;" align="center"><strong>в т.ч. целевой набор</strong></p>
			</td>
			</tr>
			<?php
			foreach($MODULE_OUTPUT["types"] as $type) {
				?>
				<tr>
				<td valign="top" width="83">
				<p align="center"><div><?=$type["code"]?></div></p>
				</td>
				<td valign="top" width="485">
				<p>
				<?php if($type["id"] == 0 ) { ?><strong><?php } ?>
				<?=$type["type"]?>
				<?php if($type["id"] == 0 ) { ?></strong><?php } ?>
				</p>
				</td>
				<td style="text-align: center;" width="57">
				<p align="center"><?php if($type["id"] == 0 ) { ?><strong><?php } ?><?=$type["budget"]?><?php if($type["id"] == 0 ) { ?></strong><?php } ?></p>
				</td>
				<td style="text-align: center;" width="138">
				<p align="center"><?php if($type["id"] == 0 ) { ?><strong><?php } ?><?=$type["purpose"]?><?php if($type["id"] == 0 ) { ?></strong><?php } ?></p>
				</td>
				<td style="text-align: center;" width="161">
				<p align="center"><?php if($type["id"] == 0 ) { ?><strong><?php } ?><?=$type["commerce"]?><?php if($type["id"] == 0 ) { ?></strong><?php } ?></p>
				</td>
				<td style="text-align: center;" width="55">
				<p align="center"><?php if($type["id"] == 0 ) { ?><strong><?php } ?><?=$type["total"]?><?php if($type["id"] == 0 ) { ?></strong><?php } ?></p>
				</td>
				</tr>
				<?php 
				}
				?>
			</tbody>
			</table>
		<?php 
	break;
	case "list": 
		?>
		<form action="<?=$EE["engine_uri"] ?>">
		<select name="type" onchange="this.form.submit(); /*window.location.href=this.options[this.selectedIndex].value; */">
		<option value="">Выберите специальность</option>
		<?php 
		foreach($MODULE_OUTPUT["types"] as $type) {
			?>
			<option value="<?=$type["id"] ?>"<?php if($MODULE_OUTPUT["type_id"] == $type["id"]) { ?> selected="selected"<?php } ?>><?=$type["code"]?> - <?=$type["type"]?></option>
			<?php 
		} 
		?>
		</select>
		</form>
		<?php 
		if($MODULE_OUTPUT["type_id"]) {
			?>
			<h1><?=$MODULE_OUTPUT["type"]["code"]?> <?=$MODULE_OUTPUT["type"]["type"]?></h1>
			<h2>Данные на <?=$MODULE_OUTPUT["date"]?></h2>
      <?php $j = 0; ?>
			<?php foreach($MODULE_OUTPUT["people"] as $ent => $people) { ?>
      <?php if(count($MODULE_OUTPUT["people"]) > 1) { ?>
      
      <?php if($ent == 'Экзамены') { ?>
      <?php if($j > 0) { ?><br /><?php } ?>
      <h2>На базе среднего общего образования. 
    <?php if(!empty($MODULE_OUTPUT["exams"])) { ?>
    Экзамены: 
    <?php 
    $i = 1; 
    $count = count($MODULE_OUTPUT["exams"]);
    foreach($MODULE_OUTPUT["exams"] as $exam) {
    ?>
    <?php echo $exam["name"]; ?><?php if($i < $count) { ?>, <?php } ?>
    <?php 
    $i++;
    }?>
    <?php } ?></h2>
    <?php } ?>
      
      <?php if($ent == 'Собеседование') { ?>
	    <?php if($j > 0) { ?><br /><?php } ?>
      <h2>На базе профессионального образования (устный экзамен по направлению).</h2>
      <?php } ?>
      
      <?php } ?>
      <table>
			<?php 
			$i = 0;
			$category_prev = "";  
			foreach($MODULE_OUTPUT["people"][$ent] as $entrant) {
				if (!($category = $entrant["descr"])) {
					$category = "по общему конкурсу";
				}
				
				$notice = $entrant["notice"];
				
				if($entrant["notice"]) {
					if($entrant["notice"] == "Сироты и инвалиды") {
						$category = "вне конкурса (дети-сироты, инвалиды)";
						$notice = ""; 
					}
				}
				
				if($category_prev != $category) {
					$category_prev = $category; 
					?>
					<tr><td colspan="6"><strong><?=$category?></strong></td></tr>
					<?php 
				}
				?>
				<tr>
				<td><?=++$i ?>. <a href="/people/<?=$entrant["people_id"] ?>"><?=$entrant["last_name"]?> <?=$entrant["name"]?> <?=$entrant["patronymic"]?></a></td>
				<?php /* ?><td><?=$entrant["ege"]?></td><?php */ ?>
        <td><?php if($entrant["exam_rus"]) { ?><?=$entrant["exam_rus"]?><?php } else { ?>0<?php } ?></td>
        <td><?php if($entrant["exam_prof"]) { ?><?=$entrant["exam_prof"]?><?php } else { ?>0<?php } ?></td>
        <td><?php if($entrant["exam_prof"]) { ?><?=$entrant["exam_extra"]?><?php } else { ?>0<?php } ?></td>
        <td title="Общий балл"><strong><?=$entrant["ege"]?></strong></td>
				<td><?=$entrant["documents"]?> <?=$notice?>
				<?php if ($entrant["position"] == 1 && $entrant["client"]) { ?>
					<span>(заказчик - <?=$entrant["client"]?>)</span>
				<? } ?></td>
				</tr>
				<?php 
			} 
			?>
			</table>
      <?php $j++; ?>
      <?php } ?>
			<?php  
		}
	break; 
	default:  
	?>
	<h1><?php echo $MODULE_OUTPUT['code'] ?> - <?php echo $MODULE_OUTPUT['spec_name'] ?></h1>
	<?php
	/*if(count($MODULE_OUTPUT["profiles"])) {
		foreach($MODULE_OUTPUT["profiles"] as $profile) {
			?>
			<h4>Профиль: <?=$MODULE_OUTPUT['code']?> "<?=$profile["name"]?>"</h4>
			<?php 
		}
	}*/

			        
		        

		        if(isset($MODULE_OUTPUT['curriculum'])) {
		        	//header("Content-type: text/html; charset=windows-1251");
		        	 
		        	$approved = $MODULE_OUTPUT["approved"];
		        	$types = $MODULE_OUTPUT["types"];
		        	foreach ($MODULE_OUTPUT["curriculum"] as $profile => $semesters) {
						$profile = $MODULE_OUTPUT["profiles"][$profile];
						if(isset($MODULE_OUTPUT["profiles"][$profile['id']])) {
		        		?>
		        		<h2><a href="javascript: void(0)" onclick="jQuery('.profile').hide(); jQuery('#profile_<?=$profile["id"]?>').show();">Профиль: <?=$MODULE_OUTPUT['code']?> "<?=$profile["name"]?>"</a></h2>
		        		<?php 
		        		}
		        	}
		        	foreach ($MODULE_OUTPUT["curriculum"] as $profile => $form_semesters) {
		        		?>
		        <?php if(isset($MODULE_OUTPUT["profiles"][$profile])) { 
		        
		        	$profile = $MODULE_OUTPUT["profiles"][$profile];
		        	?>
		        			<div class="profile" id="profile_<?=$profile["id"]?>" style="display: none;">
		        <?php } 
		        else { $profile = array('id' => 0, 'name' => ''); }
		        if(count($MODULE_OUTPUT['curriculums'])){
		        	?>
		        		        	<h3><b>Учебный план:</b></h3>
		        		        	<ul>
		        		        	<?php
		        		        	foreach($MODULE_OUTPUT['curriculums'][$profile["id"]] as $file){
		        		        		?>
		        		        		<li><a class="file_name" href="/file/<?=$file["id"]?>/"><?php if($file["form"]) { ?><?=$file["form"]?> форма<?php } ?></a></li>
		        		        		<?php
		        		        	}
		        		        	?>
		        		        	</ul><br />
		        		        	<?php 
		        		        }
		        		        
		        if(count($MODULE_OUTPUT["forms"][$profile['id']]) > 1) {
?>
<h3><b>Методический материал:</b></h3>
<?php 		        foreach($MODULE_OUTPUT["forms"][$profile['id']] as $form) {
			        	?>
			        	<h3><a href="javascript: void(0)" onclick="jQuery('.form_subjects').hide(); jQuery('#form_<?=$profile['id']?>_<?=$form?>').show();"><?=$form?> форма</a></h3>
			        	<?php 
			        }
			        ?>
			        <br />
			        <?php 
		        } 
		        		        
		        foreach($form_semesters as $form => $semesters) { ?>
		        <div id="form_<?=$profile['id']?>_<?=$form?>" class="form_subjects"<?php if(count($MODULE_OUTPUT["forms"][$profile['id']]) > 1) { ?> style="display: none;"<?php } ?>>
<?php         	        foreach ($semesters as $semester => $subjects) {
		        	          ?>
		        	          <div style="margin-bottom: 1.5ex;">
		        <?php 		if($semester != 0){ ?>
		        	          <h3>Семестр <?=$semester ?></h3>
		        	          <ul>
		        <?php 		} ?>
		        	          <?php  
		        	          foreach($subjects as $id => $subject){
								?>
								<li class="subject_item">
								<div><?php if(!empty($subject["views"])) { ?><a href="javascript: void(0)" onclick="jQuery('#subj_<?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$profile["id"]?><?=$semester ?>_<?=$form; ?>').toggle();"><?=$subject["name"]?></a><?php } else { ?><?=$subject["name"]?><?php } ?>&nbsp;
								<?php if($MODULE_OUTPUT["allow_edit"]) { ?><span class="menu"><a href="<?=$MODULE_OUTPUT["admin_uri"]?>edit_curriculum/<?=$MODULE_OUTPUT['spec_id'] ?>/#cur-<?=$subject["id"] ?>"><img src="/themes/images/edit.png" border="0" title="Редактировать"></a></span><?php } ?> 
								<span class="department_name"><?=$subject["dname"]?></span></div>
								<?php 
								if(!empty($subject["views"])) {
									?>
									<ul id="subj_<?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$profile["id"]?><?=$semester ?>_<?=$form; ?>" style="display: none; ">
									<?php 
									foreach($subject["views"] as $view_id => $view) {
										?>
										<li>
										<div><a href="javascript: void(0)" onclick="jQuery('#view_<?=$view_id?><?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$profile["id"]?><?=$semester ?>_<?=$form; ?>').toggle();"><?=$view["name"]?></a></div>
										<ul id="view_<?=$view_id?><?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$profile["id"]?><?=$semester ?>_<?=$form; ?>" style="display: none; ">
										<?php 
										foreach($view["files"] as $file_id => $file) {
											?>
											<li><a class="file_name" href="/file/<?=$file["id"]?>/"><? if($file['descr']) { ?><?=$file["descr"]?><?php } else {?><?=$file['name']?><?php } ?></a></li>
											<?php 
										} 
										?>
										</ul>
										</li>
										<?php 
									}
									?>
									</ul>
									<?php 
								} 
								?>
								</li>
								<?php 
		        	          }
		        	          ?>
		        	          <?php 
		        	          if($semester != 0){ ?></ul>
		        	          <?php
		        	          } ?></div>
		        	          
		        	          <?php  
		        	        } 
		        	        ?>
		        	        </div>
		        	        <?php 
		        	        } // /Форма обучения 
		        	        ?>
		        	        <?php 
		        	        if(isset($MODULE_OUTPUT["profiles"][$profile['id']])) { ?>
		        	        </div>
		        	        <?php } ?>
		        	        <?php 
		        	        }
		        	        //}
		        	        ?>
		        	        
		        	        <?php 
		        	} 
		        	//echo 'ffff'; 
					elseif(isset($MODULE_OUTPUT['files'])) {
		        		//header("Content-type: text/html; charset=windows-1251");
		        	
		        		$approved = $MODULE_OUTPUT["approved"];
		        		$types = $MODULE_OUTPUT["types"];
		        		foreach ($MODULE_OUTPUT["files"] as $profile => $semesters) {
		        			?>
		        			        <?php if(isset($MODULE_OUTPUT["profiles"][$profile])) { 
		        			        
		        			        	$profile = $MODULE_OUTPUT["profiles"][$profile];
		        			        	?>
		        			        			<h2>Профиль: <?=$MODULE_OUTPUT['code']?> "<?=$profile["name"]?>"</h2>
		        			        <?php }
		        			        	        foreach ($semesters as $semester => $subjects) {
		        			        	          ?>
		        			        	          <div style="margin-bottom: 1.5ex;">
		        			        <?php 		if($semester != 0){ ?>
		        			        	          <h3>Семестр <?=$semester ?></h3>
		        			        	          <ul>
		        			        <?php 		} ?>
		        			        	          <?php  
		        			        	          foreach($subjects as $id => $subject){
		        									?>
		        									<li>
		        									<div><?php if(!empty($subject["views"])) { ?><a href="javascript: void(0)" onclick="jQuery('#subj_<?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$semester ?>').toggle();"><?=$subject["name"]?></a><?php } else { ?><?=$subject["name"]?><?php } ?></div>
		        									<?php 
		        									if(!empty($subject["views"])) {
		        										?>
		        										<ul id="subj_<?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$semester ?>" style="display: none; ">
		        										<?php 
		        										foreach($subject["views"] as $view_id => $view) {
		        											?>
		        											<li>
		        											<div><a href="javascript: void(0)" onclick="jQuery('#view_<?=$view_id?><?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$semester ?>').toggle();"><?=$view["name"]?></a></div>
		        											<ul id="view_<?=$view_id?><?=$id?><?=$MODULE_OUTPUT['spec_id'] ?><?=$MODULE_OUTPUT['spec_type'] ?><?=$semester ?>" style="display: none; ">
		        											<?php 
		        											foreach($view["files"] as $file_id => $file) {
		        												?>
		        												<li><a class="file_name" href="/file/<?=$file["id"]?>/"><? if($file['descr']) { ?><?=$file["descr"]?><?php } else {?><?=$file['name']?><?php } ?></a></li>
		        												<?php 
		        											} 
		        											?>
		        											</ul>
		        											</li>
		        											<?php 
		        										}
		        										?>
		        										</ul>
		        										<?php 
		        									} 
		        									?>
		        									</li>
		        									<?php 
		        			        	          }
		        			        	          ?>
		        			        	          <?php 
		        			        	          if($semester != 0){ ?></ul>
		        			        	          <?php
		        			        	          } ?></div>
		        			        	          <?php  
		        			        	        }
		        			        	        }
		        			        	        ?>
		        			        	        
		        			        	        <?php 
		        			        	}
		        	//else
 	
	
	break;
}


?>