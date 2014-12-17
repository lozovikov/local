<?php
// version: 1.0// date: 2013-02-18

$MODULE_MESSAGES = array(
  101 => "Не указано имя папки",
  306 => "Ошибка добавления в БД",
  307 => "Ошибка удаления из БД",
  308 => "Не задан или неверно задан пароль к папке с файлами",
  309 => "Запрошенный файл не найден на сервере",
  
  
  505 => "Папка успешно обновлена",
  506 => "Папка успешно удалена"
//	1001 => "Не&nbsp;указан файл конфигурации",
//	1002 => "Невозможно обработать файл конфигурации",
//	1100 => "Неизвестный режим модуля",
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
			echo "<p class=\"message\">". $elem ." </p>\n";
		}
	}
}


if ($MODULE_OUTPUT["messages"]["bad"]) {
					$array = array();

					foreach ($MODULE_OUTPUT["messages"]["bad"] as $elem) {
						if (isset($MODULE_MESSAGES[$elem])) {
							$array[] = $MODULE_MESSAGES[$elem];
						}
					}
					if ($array) {
						foreach ($array as $elem) { ?>
			<p class="message red"><?=$elem?></p>
													<?php	
									}
								}
						}
							
switch ($MODULE_OUTPUT["mode"]) {
               
    case "add_folder":
     break;

	case "list_folder": 
    
        if (isset($MODULE_OUTPUT["folder_to_add_id"]))
        {
				?>
                <fieldset>
                    <legend>Ваши файлы:</legend>
                        <form enctype="multipart/form-data" action="<?=$EE["unqueried_uri"]?>" method="POST">
                        <input type="hidden" name="<?=$NODE_ID?>[folder_id]" value="<?=$MODULE_OUTPUT["folder_to_add_id"]?>" />
                        <input type="hidden" name="<?=$NODE_ID?>[op]" value="files_upload" />
                        <div>1. <input name="<?=$NODE_ID?>[file_descript][]"><input name="<?=$NODE_ID?>[]" type="file" /></div>
                        <div>2. <input name="<?=$NODE_ID?>[file_descript][]"><input name="<?=$NODE_ID?>[]" type="file" /></div>
                        <div>3. <input name="<?=$NODE_ID?>[file_descript][]"><input name="<?=$NODE_ID?>[]" type="file" /></div>
                        <div>4. <input name="<?=$NODE_ID?>[file_descript][]"><input name="<?=$NODE_ID?>[]" type="file" /></div>
                        <div>5. <input name="<?=$NODE_ID?>[file_descript][]"><input name="<?=$NODE_ID?>[]" type="file" /></div>
                        <input type="submit" value="Send File" />
                        </form> 
                 </fieldset>
                    
                <?
        }   
    
    
    if ($MODULE_OUTPUT["manage_access"])
        {
        ?><fieldset><?
                    
           if( $MODULE_OUTPUT["form_data"]["id"]){?><legend>Изменение свойств папки</legend><? }
           else { ?><legend>Добавить новую папку</legend><? }
           ?>
           <table>
          <form method="post"  action="<?=$EE["unqueried_uri"]?>" >
          <tr><td>Название (кратко) <td><input value="<?=$MODULE_OUTPUT["form_data"]["f_name"]?>" name="<?=$NODE_ID?>[folder_name]" /><br/>
              <tr><td>Описание <td><input  value="<?=$MODULE_OUTPUT["form_data"]["f_description"]?>"  name="<?=$NODE_ID?>[folder_descr]" /><br/>
              <tr><td>Активна <td><input  <?=$MODULE_OUTPUT["form_data"]["f_isActive"]?>   type="checkbox" name="<?=$NODE_ID?>[folder_is_active]"/><br/>
              <tr><td>Пароль (необязательно) <td><input  value="<?=$MODULE_OUTPUT["form_data"]["f_pass"]?>"  name="<?=$NODE_ID?>[folder_pass]"/><br/>
              <tr><td>Доступна до <td><input class="my_datepicker"  value="<?=$MODULE_OUTPUT["form_data"]["f_deadLine"]?>"  name="<?=$NODE_ID?>[folder_deadline]"  /><br/>
              <tr><td><td><input type="submit" >
			  <input name="<?=$NODE_ID?>[op]" value="add_folder" type="hidden"/>
              <input value="<?=$MODULE_OUTPUT["form_data"]["id"]?>" 
                    name="<?=$NODE_ID?>[id]" value="add_folder" type="hidden"/>
          </form>
          </table>
         </fieldset> <?
         }
			if (isset($MODULE_OUTPUT["arr_List_Folder"]))
				{
					?><fieldset><legend><?
						$str_Legend = "Полный список папок";
						if (count($MODULE_OUTPUT["arr_List_Folder"])> 0 ){$str_Legend =  "Cписок папок";}
						else {$str_Legend= "Нет файлов для загрузки";}
						if ($MODULE_OUTPUT["manage_access"]) $str_Legend = "Полный список папок";
						echo $str_Legend;
					?></legend><table><? 
					
					foreach ($MODULE_OUTPUT["arr_List_Folder"] as $elem) {
                        
                    //проверка наличия вложенных файлов
                    if ((isset($MODULE_OUTPUT["arr_List_Files_folder_id"]) and
                                        $MODULE_OUTPUT["arr_List_Files_folder_id"] == $elem["id"]) and isset($MODULE_OUTPUT["arr_List_Files"]))
                    {
                        $folder_img_path ="/themes/images/folder_open.png";
                     }  
                     else 
                     {$folder_img_path ="/themes/images/folder_close.png";}
                    
                     //проверка наличия пароля для вывода формы
                     if (CF::IsNonEmptyStr($elem["pass"]) and 
                     $elem["pass"] != $_SESSION["module_".$MODULE_OUTPUT["current_module_id"]]["folder_".$elem["id"]]['pass'] )
                     {
                        $a_attrib = " class='del_folder_modal' href='#pass_folder_modal_".$elem["id"]."'";
                     }
                     else
                     {
                         $a_attrib = "href='".$EE["unqueried_uri"]."?node=$NODE_ID&amp;action=list_files&amp;folder_id=".$elem["id"]."'";
                     }
                     $today  = mktime(0, 0, 0, date("m")  , date("d"), date("Y"));
                    ?>
						<tr><td>
                        <a <?=$a_attrib?>>
                        <img class="pointer" src="<?=$folder_img_path?>" alt="Список файлов">
                        <?=$elem["name"]?><?=strtotime($elem["deadLine"])< $today ?" (время истекло)" : ""?></a>
                        <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?=$elem["descr"]?>
                        <td><? 
                        
                        //вывод элементов управления папкой
                        if ($MODULE_OUTPUT["manage_access"]) { ?>
                        	<a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=edit_folder&amp;id=<?=$elem["id"]?>">
                            <img class="pointer" title="Редактировать" src="/themes/images/edit.png" alt=""></a>
                            <a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=add_files&amp;id=<?=$elem["id"]?>">
                            <img class="pointer" title="Добавить файл" src="/themes/images/edit-add.png" alt=""></a>
                            <a class="del_folder_modal" href="#del_folder_modal_<?=$elem["id"]?>" title="Удалить">
                            <img  src="/themes/images/delete.png" alt=""></a>
                            <div style="display:none">
                               <div id="del_folder_modal_<?=$elem["id"]?>">
	                            <p>
		                            Вы уверены, что хотите удалить эту пупку и все вложенные файлы? Восстановление будет невозможно.
                                   <a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_folder&amp;id=<?=$elem["id"]?>">Да</a> / 
                                   <a href="javascript:;" onclick="jQuery.fancybox.close();">Нет</a>
	                                </p>
                                </div><?
                          }      
                            if (CF::IsNonEmptyStr($elem["pass"])) {
                               ?>
                                <div style="display:none">
                                    <div id="pass_folder_modal_<?=$elem["id"]?>">
	                                 Папка зищищена паролем. Введите пароль для просмотра файлов.
                                        <form  method="post"  action="<?=$EE["unqueried_uri"]?>" >
                                            <input name="<?=$NODE_ID?>[pass]" type="password">
                                            <input name="<?=$NODE_ID?>[folder_id]" type="hidden" value="<?=$elem["id"]?>">
                                            <input name="<?=$NODE_ID?>[action]" value="list_files" type="hidden">
                                            <input value="Ок!" type="submit">
                                        </form>
	                               </div>
                                </div>
                                <?
                                }
                                ?>
                               
                            </td>
	
                  </tr>  <?
                       
                                //Если в папке есть файлы
                                if ((isset($MODULE_OUTPUT["arr_List_Files_folder_id"]) and
                                    $MODULE_OUTPUT["arr_List_Files_folder_id"] == $elem["id"]) and isset($MODULE_OUTPUT["arr_List_Files"]))
                                    {
                                    
                                      foreach ($MODULE_OUTPUT["arr_List_Files"] as $arr_LF) {
                                 ?>                                        
                                         <tr><td  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a  href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=list_files&amp;folder_id=<?=$elem["id"]?>&amp;file_id=<?=$arr_LF["id"]?>">
                                                <?=$arr_LF["descr"]?> (<?=$arr_LF["size"]?>)
                                            </a><?
                                        
                                                ?>  
                                         
                                        </td><td><?
                                                if ($MODULE_OUTPUT["manage_access"]) {?>
                                                    <a class="del_folder_modal" href="#del_file_modal_<?=$arr_LF["id"]?>" title="Удалить">
                                                    <img  src="/themes/images/delete.png" alt=""></a><?
                                                    }
                                                ?>
                                                <div style="display:none">
                                                   <div id="del_file_modal_<?=$arr_LF["id"]?>">
	                                                <p>
		                                                Вы уверены, что хотите удалить этот файл? 
                                                       <a href="<?=$EE["unqueried_uri"]?>?node=<?=$NODE_ID?>&amp;action=delete_file&amp;id=<?=$arr_LF["id"]?>">Да</a> / 
                                                       <a href="javascript:;" onclick="jQuery.fancybox.close();">Нет</a>
	                                                    </p>
                                                    </div>
                                                </div>
                                                </tr>
                                       <?
                                       }
                                    }

                         }
					            ?>
                                </table>
                                <div id="mask"></div>
                                </fieldset>
                                <?
				            }
                
         
		              php?><pre><?
             //print_r ($_SESSION/*$MODULE_OUTPUT*/);
             //print_r ($MODULE_OUTPUT);
            ?>	</pre> <?
			
		 break;
     }
     
     
   ?>
