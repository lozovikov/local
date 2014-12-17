<?php

$MODULE_OUTPUT = $MODULE_DATA["output"];

$MODULE_MESSAGES = array(
    101 => "Студент успешно добавлен.",
    102 => "Подраздел специальности успешно добавлен.",
    103 => "Специальность успешно добавлена.",
    104 => "Подраздел специальности успешно удален.",
    105 => "Специальность с ее подразделами успешно удалена.",
    106 => "Редактирование прошло успешно.",
    301 => "Студент не добавлен.",
    302 => "Студент не добавлен. Были введены 2 различных пароля.",
    303 => "Студент не добавлен. Необходимо ввести пароль.",
    304 => "Группа с таким номером уже существует.",
    305 => "Невозможно удалить данную группу. Она не пуста.",
    306 => "Ошибка. Были заполнены не все поля.",
    307 => "Подраздел специальности не добавлен.",
    308 => "Специальность не добавлена.",
    309 => "Подраздел специальности не удален.",
    310 => "Специальность с ее подразделами не удалена.",
    311 => "Ошибка при добавлении подраздела специальности.",
    312 => "Ошибка при редактировании специальности."   
    
);



if ($MODULE_OUTPUT["messages"]["good"])
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
}




switch ($EE["language"])
{
    case "en":
        $LANGUAGE["news"] = array(
            "read_all_news" => "Read all news",
            "all_news" => "All news",
            "latest_news" => "News",
            "date_format" => "d/m/Y",
            "datetime_format" => "d/m/Y g:i:s A",
            "read_more" => "Read more",
            "more" => "more",
            "prev" => "prev",
            "previous_page" => "Previous page",
            "next" => "next",
            "next_page" => "Next page",
            "pages" => "Pages",
            "add_comment" => "Add comment",
            "comments" => "Comments",
            "no_comments" => "There are no comments for this item currently. Your comment could be the first one!",
            "name" => "Name",
            "location" => "Location",
            "email" => "E-mail",
            "your_comment" => "Your comment",
            "confirmation_code" => "Confirmation code",
            "confirmation_code_hint" => "Please write in a code displayed on the picture.",
            "obligatory_field" => "Obligatory field",
            "all_publications" => "all publications",
            "read_all_publications" => "Read all publications",
            );
        break;

    default:
        $LANGUAGE["news"] = array(
            "read_all_news" => "Читать все новости",
            "all_news" => "Все материалы",
            "latest_news" => "Последние материалы",
            "date_format" => "d.m.Y",
            "datetime_format" => "d.m.Y, H:i:s",
            "read_more" => "Читать подробнее",
            "more" => "подробнее",
            "prev" => "предыдущая",
            "previous_page" => "Предыдущая страница",
            "next" => "следующая",
            "next_page" => "Следующая страница",
            "pages" => "Страницы",
            "add_comment" => "Добавить комментарий",
            "comments" => "Комментарии",
            "no_comments" => "На данный момент к&nbsp;этому материалу нет ни&nbsp;одного комментария. Вы можете оставить первый!",
            "name" => "Имя",
            "location" => "Город",
            "email" => "E-mail",
            "your_comment" => "Ваш комментарий",
            "confirmation_code" => "Код подтверждения",
            "confirmation_code_hint" => "Пожалуйста, введите цифровой код, изображённый на картинке.",
            "obligatory_field" => "Поле, обязательное для заполнения",
            "all_publications" => "Все новости",
            "read_all_publications" => "Читать все новости",
            );
        break;
}

switch($MODULE_OUTPUT["mode"])
{  
      
    case "faculties":
        ?>
        <h2>Подразделения НГАУ</h2>
        <ul>
        <?php        
        foreach($MODULE_OUTPUT["faculties"] as $faculty)
        {        
        ?>
            <li class="faculty"><?php
            if($faculty["link"])
            {                
        ?>
            <a href="<?=$faculty["link"]?>">
            <? } ?>
            <?=$faculty["name"]?>
            <?
                        if($faculty["link"])
            {
        ?>
            </a>
            <? } ?>

            </li>
            
        <?php
        }
        ?>
        </ul>
        <?php
        break;
    
    case "speciality":
    
         if(isset($_GET["node"]) && isset($_GET["action"]) && $_GET["action"]=="add_subsection")
              {
              ?> 
              <h3>Добавить подраздел в специальность <?=$_GET["code"]?> - <?=$_GET["name"]?> :</h3> 
                <form method="post" action="/speciality/">
                <input type="hidden" name="action_sub" value="add_subsection"> 
                <input type="hidden" name="code" value="<?=$_GET["code"]?>" />
                <br/>
                <table border="1">
                    <th bgcolor="#BBBBBB">Год открытия</th><th bgcolor="#BBBBBB">Тип специльности</th><th bgcolor="#BBBBBB">Очная форма обучения</th><th bgcolor="#BBBBBB">Заочная форма обучения</th>  
                        
                        
                        <tr>
                                                <td>
                        <input type="text" name="year_open_sub" ></input>
                        </td>
                        <td>
                        <select name="type_sub" size="1">
                            <option selected="selected">Тип специальности</option>
                            <option value="secondary">Среднее професиональное образование</option>
                            <option value="higher">Высшее професиональное образование</option> 
                            <option value="bachelor">Бакалавриат</option> 
                            <option value="magistracy">Магистратура</option> 
                        </select>
                        </td>
                        <td align="center">
                        <input type="checkbox" name="internal_tuition_sub" checked />
                        </td>
                        <td align="center"> 
                        <input type="checkbox" name="correspondence_tuition_sub" />
                        </td>
                       
                        </tr>
                        
                    </table>
                
                <br/>
                <input type="submit" value="Добавить" class="button" />
                </form>
              <?php 
              }
               
         if(isset($_GET["node"]) && isset($_GET["action"]) && $_GET["action"]=="add")
              {?> 
              <h3>Добавить специальность:</h3> 
                <form method="post" action="/speciality/">
                <input type="hidden" name="action_op" value="add"> 
                Код специальности:<br />
                <input type="text" name="code_add" />
                <br />
                Название специальности:<br />
                <input type="text" name="name" />
                <br/>
                Выберите направление:
                <br />
                 <select name="direction" size="1">
                 <option value="0" selected="selected">Направление специальности</option>
                  <?php
                  foreach($MODULE_OUTPUT["directory"] as $dir)
                  {
                  ?>
                  <option value="<?=$dir["code"]?>"><?=$dir["name"]?></option>
                  <?php
                  }
                  ?>
                  </select>
                  <br />
                Год открытия:<br />
                <input type="text" name="year_open" />
                <br/>
                Тип специльности:<br />
                <select name="type" size="1">
                    <option selected="selected">Тип специальности</option>
                    <option value="secondary">Среднее професиональное образование</option>
                    <option value="higher">Высшее професиональное образование</option> 
                    <option value="bachelor">Бакалавриат</option> 
                    <option value="magistracy">Магистратура</option> 
                </select>
                <br/>
                Заочная форма обучения:
                <input type="checkbox" value="1" name="internal_tuition" checked />
                <br/>
                Очная форма обучения:&nbsp;&nbsp;&nbsp; 
                <input type="checkbox" value="1" name="correspondence_tuition"/>
                <br/>
                Описание:
                <textarea name="description"  style="width=300px; height=100px" ></textarea>
                <br/>
                <input type="submit" value="Добавить" class="button" />
                </form>
              <?php 
              }
              
        if (!empty($MODULE_OUTPUT["speciality"]))
        {
                  
              foreach($MODULE_OUTPUT["speciality"] as $special)
              { 
              
              if(isset($_GET["node"]) && isset($_GET["action"]))
              {

              if($_GET["action"]=="edit"){ 
              ?>
              <h2><?=$special["code"]?>&nbsp;-&nbsp;<?=$special["name"]?></h2>   
              <form action="/speciality/<?=$special["code"]?>" method="post">
                    
                    Код специальности:<br />
                    <input type="text" name="code" value="<?=$special["code"]?>"></input>
                    <br />
                    Название специальности:<br />
                    <input type="text" name="name" style="width:484px" value="<?=$special["name"]?>"></input> 
                    <br/>
                    Выберите направление:
                    <br />
                    <select name="direction" size="1">
                    <!--<option value="0" selected="selected"><?=$special["direction"]?></option>-->
                    <option disabled>--------------------------------------------</option>
                    <?php
                    foreach($MODULE_OUTPUT["direction"] as $dir)
                    {
                        if ($dir["code"]==$special["direction"])
                        {?> <option value="<?=$dir["code"]?>" selected="selected"><?=$dir["name"]?></option> 
                        <?php } else {?>
                        <option value="<?=$dir["code"]?>"><?=$dir["name"]?></option>
                        <?php
                    }}
                    $i=0?>
                    </select>
                    <br>
                    <br>
                    <table border="1">
                    <th bgcolor="#BBBBBB">№ п.п</th><th bgcolor="#BBBBBB">Год открытия</th><th bgcolor="#BBBBBB">Тип специльности</th><th bgcolor="#BBBBBB">Очная форма обучения</th><th bgcolor="#BBBBBB">Заочная форма обучения</th>  
                        <?php foreach($MODULE_OUTPUT["speciality_edit"] as $edit)
                        { $i++ ?>
                        
                        <tr>
                        <td align="center"><?=$i?></td>
                        <td>
                         <input type="hidden" name="<?=$edit["type"]?>[st_type]" value="<?=$edit["type"]?>"></input>
                         <input type="hidden" name="<?=$edit["type"]?>[st_year]" value="<?=$edit["year_open"]?>"></input> 
                        <input type="text" name="<?=$edit["type"]?>[year_open]" value="<?=$edit["year_open"]?>"></input>
                        </td>
                        <td>
                        <select name="<?=$edit["type"]?>[type]" size="1">
                        <?php
                             switch ($edit["type"])
                             {
                                  case secondary: 
                                  ?><option value="secondary" selected="selected">Среднее професcиональное образование</option>
                                   <option disabled>---------------------------------------</option><?php 
                                  break;
                                  case higher:
                                  ?><option value="higher" selected="selected">Высшее професcиональное образование</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                                   case bachelor:
                                  ?><option value="bachelor" selected="selected">Бакалавриат</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                                   case magistracy:
                                  ?><option value="magistracy" selected="selected">Магистратура</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                             }
                        ?>
                            
                            <option value="secondary">Среднее профеcсиональное образование</option>
                            <option value="higher">Высшее професcиональное образование</option> 
                            <option value="bachelor">Бакалавриат</option> 
                            <option value="magistracy">Магистратура</option> 
                        </select>
                        </td>
                        <td align="center">
                        <input type="checkbox" name="<?=$edit["type"]?>[internal_tuition]" <?php if ($edit["internal_tuition"]==1){?>checked <?php }?> />
                        </td>
                        <td align="center"> 
                        <input type="checkbox" name="<?=$edit["type"]?>[correspondence_tuition]" <?php if ($edit["correspondence_tuition"]==1){?>checked <?php }?> />
                        </td>
                       
                        </tr>
                        <?php }?>
                    </table>
                    Описание:                 
                    <textarea name="description" cols="60" rows="15" class="wysiwyg"><?=$special["description"]?></textarea>
                    <p><input type="submit" value="Сохранить изменения" /> <input type="reset" value="Сброс" /> <input type="submit" name="<?=$_GET["node"]?>[save][cancel]" value="Отмена" /></p>
                 </form>
                 
                 <?php }
              }
              else
              {
              
              if (empty($special["description"]))
              {
                   ?><p>Информация о данной специальности отсутствует</p></br>
                  <?php if ($MODULE_OUTPUT["privileges"]["specialities.handle"]==true)
                  {?>
                  <a href="/speciality/<?=$special["code"]?>/?node=<?=$NODE_ID?>&amp;action=edit#form">[ Редактировать текст ]</a><?php 
                  }
                   
              }
              else
              { 
                  ?>
                  <h2><?=$special["code"]?>&nbsp;-&nbsp;<?=$special["name"]?></h2> 
                  <p>
                  <?php 
                  if(!empty($MODULE_OUTPUT["type_klass"]))
                  {
                  if($MODULE_OUTPUT["type_klass"]=="mag")
                  {?>Квалификация: Магистр <br> Срок обучения: 5 лет <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="bach")
                  {?>Квалификация: Бакалавр <br> Срок обучения: 4 года <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="spo")
                  {?>Квалификация: Специалист <br> Срок обучения: 5 лет <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="vpo")
                  {?>Квалификация: Специалист <br> Срок обучения: 5 лет <br> <?php } 
                  }?>
                  <?=$special["description"]?></p>
                  <p>
                  <?php if ($MODULE_OUTPUT["privileges"]["specialities.handle"]==true)
                  {?>
                  <a href="/speciality/<?=$special["code"]?>/?node=<?=$NODE_ID?>&amp;action=edit#form">[ Редактировать текст ]</a>
                  </p><?php 
                  }
              }}
              } 
        }
        else{
          
          if(isset($_GET["node"]) && isset($_GET["action"]) && $_GET["action"]=="add")
              { 1;}else{ ?> 
            <form action="/speciality/" method="get">
            <p>
            Специальность:
            <input name="name_search" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="Найти" class="button" />
            </p>        
            </form>
            <?   
        
        if(!empty($MODULE_OUTPUT["specialities"]))
            {
                ?>
                <ul>
                <?php
                foreach($MODULE_OUTPUT["specialities"] as $special)
                {
                    ?>
                    <li><a href="/speciality/<?=$special["code"]?>/"><?=$special["code"]?>&nbsp;-&nbsp;<?=$special["name"]?></a></li>
                    
                <?php }
                ?>
                </ul>
                <?php
            }
            else
            {
                if(isset($_GET["name"]))
                {
                ?>
                <p>Не найдено специальностей с такими параметрами поиска.</p>
                <?php
                }
                else
                {
                ?>
                <p>Введите в поле поиска данные о специальности.</p>
                <?php              
                }
            } 
            } 
        }
        
        
    break;
           
    case "specialities":                

        if($MODULE_OUTPUT["type"]=="higher")
        {?><h2 style="text-align: center;">Программы высшего профессионального образования</h2><?php
        }elseif($MODULE_OUTPUT["type"]=="secondary")
        {?><h2 style="text-align: center;">Программы среднего профессионального образования</h2> <?php
        }elseif($MODULE_OUTPUT["type"]=="bachelor")
        {?><h2 style="text-align: center;">Программы среднего профессионального образования<br>Направления подготовки бакалавров</h2> <?php
        }elseif($MODULE_OUTPUT["type"]=="magistracy")
        {?><h2 style="text-align: center;">Программы среднего профессионального образования<br>Направления подготовки магистров</h2> <?php
        }?>
        <table width="550" cellspacing="0" cellpadding="0" bordercolor="#00000" border="1" align="center" style="color:#002F2F;  font-weight:bolder; text-align: center;">
        <tr class="table_top">
            <th>Код</th>
            <th>Наименование специальности</th>
            <th>Год открытия</th>
            <th>Очная</th>
            <th>Заочная</th>
        </tr><?php
        $j=0;
        $dir=$MODULE_OUTPUT["specialities"];
        ?><tr style="text-align: center; font-weight:bolder; background-color: #f09695;"><td style="font-size:12pt; padding:5px;" colspan="5"><?=$dir[$j]["direction"]?>&nbsp;-&nbsp;<?=$dir[$j]["name_dir"]?> </td></tr> <?php
        foreach($MODULE_OUTPUT["specialities"] as $special)
                {
                    $j+=1;
                    ?><tr style="text-align:">
                    <td style="padding:4px;" bordercolor="#000000">
                    
                    <?php if($MODULE_OUTPUT["type"]=="higher")
                        {?><a href="/speciality/vpo/<?=$special["code"]?>/"><?=$special["code"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="secondary")
                        {?><a href="/speciality/spo/<?=$special["code"]?>/"><?=$special["code"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="bachelor")
                        {?><a href="/speciality/bach/<?=$special["code"]?>/"><?=$special["code"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="magistracy")
                        {?><a href="/speciality/mag/<?=$special["code"]?>/"><?=$special["code"]?></a> <?php
                        }?>
                    
                    </td>
                    <td align="left">
                    <?php if($MODULE_OUTPUT["type"]=="higher")
                        {?><a href="/speciality/vpo/<?=$special["code"]?>/"><?=$special["name"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="secondary")
                        {?><a href="/speciality/spo/<?=$special["code"]?>/"><?=$special["name"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="bachelor")
                        {?><a href="/speciality/bach/<?=$special["code"]?>/"><?=$special["name"]?></a><?php
                        }elseif($MODULE_OUTPUT["type"]=="magistracy")
                        {?><a href="/speciality/mag/<?=$special["code"]?>/"><?=$special["name"]?></a> <?php
                        }?>
                    
                    </td>
                    <td ><?=$special["year_open"]?></td>
                    <?php if($special["internal_tuition"]==1)
                    {?><td bgcolor="#FF9F71">+</td><?php
                    }
                    else{?><td bgcolor="#FF9F71">-</td><?php
                    }
                    if($special["correspondence_tuition"]==1)
                    {?><td>+</td><?php
                    }
                    else{?><td>-</td><?php
                    }?>                                                 
                    </tr><?php
                    if ((!empty($dir[$j+1]["direction"])) && ($dir[$j-1]["direction"]!=$dir[$j]["direction"]))
                    {
                        ?><tr style="text-align: center; font-weight:bolder; color:#000000; background-color: #f09695"><td style="font-size:12pt; padding:5px;" colspan="5"><?=$dir[$j]["direction"]?>&nbsp;-&nbsp;<?=$dir[$j]["name_dir"]?> </td></tr> <?php
                    }
                }
        ?></table><?php
        break;
        
    case "speciality_directory":
            
            if(!empty($MODULE_OUTPUT["speciality_directory"]))
            {
                
                ?>
                <br/>
                <a href="/speciality/?node=115&amp;action=add#form">[ Добавить специальность ]</a> 
                <ul>
                <?php
                foreach($MODULE_OUTPUT["speciality_directory"] as $special)
                {
                    ?>
                    <li><?=$special["code"]?>&nbsp;-&nbsp;<?=$special["name"]?></a>&nbsp;[&nbsp;<a href="/office/speciality_directory/?node=<?=$NODE_ID?>&amp;code=<?=$special["code"]?>&amp;section=1&amp;action=delete#form">Удалить описание и все подразделы</a>&nbsp;]&nbsp;[&nbsp;<a href="/speciality/<?=$special["code"]?>/?node=115&action=edit#form">Редактировать</a>&nbsp;]&nbsp;[&nbsp;<a href="/speciality/<?=$special["code"]?>/?node=115&amp;code=<?=$special["code"]?>&amp;name=<?=$special["name"]?>&amp;direction=<?=$special["direction"]?>&action=add_subsection#form">Добавить подраздел</a>&nbsp;]&nbsp;</li>
                    <ul>
                    <?php
                    foreach($MODULE_OUTPUT["speciality"] as $speciality)
                    {
                        if($speciality["code"]==$special["code"])
                        {
                            switch ($speciality["type"])
                            {
                                case "secondary":
                                $type_sp="Среднее професcиональное образование";
                                break;
                                case "higher":
                                $type_sp="Высшее професcиональное образование";
                                break;
                                case "magistracy":
                                $type_sp="Магистратура";
                                break;
                                case "bachelor":
                                $type_sp="Бакалавриат";
                                break;
                            }
                        ?>
                            
                            <li><?=$speciality["year_open"]?>&nbsp;-&nbsp;<?=$type_sp?>&nbsp;[&nbsp;<a href="/office/speciality_directory/?node=<?=$NODE_ID?>&amp;code=<?=$speciality["code"]?>&amp;year_open=<?=$speciality["year_open"]?>&amp;type=<?=$speciality["type"]?>&amp;subsection=1&amp;action=delete#form">Удалить</a>&nbsp;]</li>
                        <?php
                        }
                    }
                    ?></ul><?php
                    
                }
                ?>
                </ul>
                 
                
                 
                <?php
            }
            else
            {
            ?>
                <p>Специальностей не существует</p><?php
             
            }

    break;
    
    case "search_spec":
        ?>
        <h2>Люди</h2>
        <form action="/speciality/" method="get">
        <p>
        Специальность:
        <input name="name_search" type="text" size="35"/> <input type="submit" value="Найти" class="button" />
        </p>        
        </form>
        <?php
        break;
                  
    case "search_people":
        ?>
        <h2>Люди</h2>
        <form action="/people/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        Человек:
        <input name="name" type="text" size="25" /> <input type="submit" value="Найти" class="button" />
        </p>
        </div>
        </form>
        <?php
        break;
    
    
        
    case "people":                
        if(!empty($MODULE_OUTPUT["man"]))
        {            
            $man = $MODULE_OUTPUT["man"];
            ?>
            <h1><?=$man["last_name"]?> <?=$man["name"]?> <?=$man["patronymic"]?></h1>
            <?php echo $man["status"] ? "<strong>" . $man["status"] . "</strong><br />": ""?>
            <?php echo $man["id_speciality"] ? "Специальность: ".$man["id_speciality"].", ".$man["speciality"]["name"] ."<br />": ""?>
            <?php echo $man["year"] ? "Год поступления: ".$man["year"] ."<br />" : ""?>
			<?php echo $man["group_name"] ? "Группа: <a href=\"/groups/".$man["id_group"] ."/\">".$man["group_name"]."</a>" : ""?>
			
            <?php
			if (!empty($MODULE_DATA["output"]["files_list"])) {
			?>
			<br /><h2>Файлы пользователя</h2>
			<?php
				foreach ($MODULE_DATA["output"]["files_list"] as $file)
				{
					echo "<li><a href='/file/".$file["id"]."/' title='".$file["descr"]."'>".$file["name"]."</a>";
					if (isset($file["subjlist"])) {
						echo " (";
						$i = 0;
						foreach ($file["subjlist"] as $subj) {
							if ($i == sizeof($file["subjlist"])-1)
								echo $subj["name"];
							else
								echo $subj["name"].", ";
							$i++;
						}
						echo ")";
					}
					?>
					<?php
				}
			}
        }
        else
        {
            ?>
            <form action="/people/" method="get">
            <p>
            Человек:
            <input name="name" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="Найти" class="button"/>
            </p>        
            </form>
            <?
            if(!empty($MODULE_OUTPUT["people"]))
            {
                ?>
                <ul>
                <?php
                foreach($MODULE_OUTPUT["people"] as $man)
                {
                    ?>
                    <li><a href="/people/<?=$man["id"]?>/"><?=$man["last_name"]?> <?=$man["name"]?> <?=$man["patronymic"]?></a></li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            else
            {
                if(isset($_GET["name"]))
                {
                ?>
                <p>Не найдено людей с такими параметрами поиска.</p>
                <?php
                }
                else
                {
                ?>
                <p>Введите в поле поиска данные о человеке.</p>
                <?php              
                }
            };
        };
        break;

    case "search_subjects":
        ?>
        <h2>Предметы</h2>
        <form action="/subjects/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        Предмет:
        <input name="name" type="text" size="25" /> <input type="submit" value="Найти" class="button"/>
        </p>
        </div>
        </form>
        <?php
        break;
		
    case "subjects":
        if(!empty($MODULE_OUTPUT["subject"]))
        {            
            $man = $MODULE_OUTPUT["subject"];
			?>
			<h2><?php echo $MODULE_OUTPUT["subject"]["name"] ?></h2><br>
			<?php
			if (isset($MODULE_OUTPUT["subject"]["files"]))
			{
				?><ul><?php
				foreach ($MODULE_OUTPUT["subject"]["files"] as $file)
				{
				?>
				<li><a href="/file/<?php echo $file["id"]; ?>/" title="<?php echo $file["descr"]; ?>"><?php echo $file["name"]; ?></a> (<?php if($file["user_id"]) { ?><a href="/people/<?php echo $file["user_id"]; ?>/"><?php } ?><?php echo $file["user_name"]; ?><?php if($file["user_id"]) { ?></a><?php } ?>)
				<?php
				}
			?>
			</ul>
			<?php
			}
        }
        else
        {
            ?>
            <form action="/subjects/" method="get">        
            <p>
            Предмет:
            <input name="name" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="Найти" class="button"/>
            </p>        
            </form>
            <?
            if(!empty($MODULE_OUTPUT["subjects"]))
            {
                ?>
                <ul>
                <?php
                foreach($MODULE_OUTPUT["subjects"] as $subj)
                {
                    ?>
                    <li><a href="/subjects/<?=$subj["id"]?>/"><?=$subj["name"]?> </a></li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            else
            {
                if(isset($_GET["name"]))
                {
                ?>
                <p>Не найдено предметов с такими параметрами поиска.</p>
                <?php
                }
                else
                {
                ?>
                <p>Введите в поле поиска данные о предмете.</p>
                <?php              
                }
            };
        };
        break;
    case "search_group":
        ?>
        <h2>Группы</h2>
        <form action="/groups/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        Группа:
        <input name="group" type="text" size="25" /> <input type="submit" value="Найти" class="button" />
        </p>
        </div>
        </form>
        <?php
        break;
    case "groups":        
        if(!empty($MODULE_OUTPUT["group"]))
        {
            $group = $MODULE_OUTPUT["group"];
            $days = array("понедельник", "вторник", "среда", "четверг", "пятница", "суббота");
            $timepars = array("09:00 - 10:20","10:30 - 11:50","12:30 - 13:50","14:00 - 15:20","15:30 - 16:50","17:00 - 18:20","18:30 - 19:50");
            $months = array("явнаря", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября","декабря");
            $now = $MODULE_OUTPUT["now"];
            
            ?>
            <h1>Группа <?=$group["name"]?></h1>            
            <?=$group["faculty"]["name"]?><br />            
            <?php
            if(!empty($MODULE_OUTPUT["timetable"]))
            {
                ?>
                                          
                <h2>Расписание учебных занятий</h2>
                <?php
                echo "Сегодня ".$now["mday"]." ".$months[$now["mon"]-1]." ".$now["year"]."&nbsp;г., ".$days[$now["wday"]-1].".<br><br>";
                ?>
            
            
                
                <div id="timetable_div">
                
                    <div class="right_table">
                    <table class="right_timetable">
                    <tr class="table_top"><th>№</th><th>Время проведения</th></tr>
                    <?php
                    for($i=0; $i<7; $i++)
                    {
                        ?>
                        <tr><td><?=($i+1)?></td><td><?=$timepars[$i]?></td></th>    
                        <?php
                    }
                    ?>
                    </table>
                    <div class="pusher"></div>
                    <table class="right_timetable">
                    <tr class="table_top"><th colspan="2">Обозначение корпусов</th></tr>
                    <?php
                    foreach($MODULE_OUTPUT["buildings"] as $buildings)
                    {
                        ?>
                        <tr><td><small><?=$buildings["name"]?></small></td><td><?=$buildings["label"]?></td></th>    
                        <?php
                    }
                    ?>
                    </table>
                    <div class="pusher"></div>
                    </div>
                
                    <div>
                    <table class="timetable">
                    <tr class="table_top"><th>№</th><th>Неделя</th><th>Подгруппа</th><th>Дисциплина</th><th>Аудитория</th></tr>
                    <?php
                $j=0;
                $timetable = $MODULE_OUTPUT["timetable"];
                for($i = 0; $i < 6; $i++)
                {
                    ?>
                    <tr class="week_day"><td colspan="6"><?=$days[$i]?></td></tr>
                    <?php
                    $k=0;

                    do
                    {
                        if(isset($timetable[$j]["num"]))
                        {
                            if($timetable[$j]["dow"] == $i+1 && $timetable[$j]["num"]== $k+1)
                            {
                                if($timetable[$j]["dow"] == $now["wday"])
                                {?>    
                                    <tr class="current_day"><td><?=$timetable[$j]["num"]?></td>
                                    <?php
                                }
                                else
                                {?>
                                    <tr><td><?=$timetable[$j]["num"]?></td>
                                    <?php
                                }
                                switch($timetable[$j]["parity"])
                                {
                                    case "odd":
                                    {
                                        ?>
                                        <td title="Четная неделя">Ч</td><td>
                                        <?php
                                        if(isset($timetable[$j+1]) && $timetable[$j]["num"] == $timetable[$j+1]["num"] 
                                                                    && $timetable[$j+1]["dow"] == $i+1)
                                            $k--;
                                        break;
                                    }
                                    case "even":
                                    {
                                        ?>
                                        <td title="Нечетная неделя">Н</td><td>
                                        <?php
                                        if(isset($timetable[$j+1]) && $timetable[$j]["num"] == $timetable[$j+1]["num"] 
                                                                    && $timetable[$j+1]["dow"] == $i+1)
                                            $k--;
                                        break;
                                    }
                                    default:
                                    {
                                        ?>
                                        <td>&nbsp;</td><td>
                                        <?php
                                        if(isset($timetable[$j+1]) && $timetable[$j]["num"] == $timetable[$j+1]["num"]
                                                                    && $timetable[$j+1]["dow"] == $i+1)
                                            $k--;
                                        break;
                                    }
                                }
                                ?>
                                <?=$timetable[$j]["subgroup"]?></td><td><?=$timetable[$j]["subject"]?></td>
                                <td><span title="<?=$timetable[$j]["building"]?>"><?=$timetable[$j]["label"]?></span> - <?=$timetable[$j]["auditorium"]?></td></tr>
                                <?php
                                $k++;
                                $j++;
                                
                            }
                            else
                            {
                                if($i+1 == $now["wday"])
                                {?>
                                    <tr class="current_day"><td><?=($k+1)?></td>
                                    <?php
                                }
                                else
                                {?>
                                    <tr><td><?=($k+1)?></td>
                                    <?php
                                }
                                ?>
                                <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                                <?php
                                $k++;   
                            }
                        }
                        else
                        {
                            if($i+1 == $now["wday"])
                            {?>
                                <tr class="current_day"><td><?=($k+1)?></td>
                                <?php
                            }
                            else
                            {?>
                                <tr><td><?=($k+1)?></td>
                                <?php
                            }
                            ?>
                            <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                            <?php
                            $k++;   
                        }
                    }
                    while($k<7);
                }
                
                ?>
                </table>
                </div>
                </div>
            
                
                <?php
            }
        }
        else
        {
            ?>
            <form action="/groups/" method="get">        
            <p>
            Группа:
            <input name="group" type="text" size="35" value="<?php echo isset($_GET["group"]) ? $_GET["group"] : "" ?>"/> <input type="submit" value="Найти" class="button" />
            </p>        
            </form>
            <?
            if(!empty($MODULE_OUTPUT["groups"]))
            {
                ?>
                <ul>
                <?php
                foreach($MODULE_OUTPUT["groups"] as $group)
                {
                    ?>
                    <li><a href="/groups/<?=$group["id"]?>/">Группа <?=$group["name"]?>, <?=$group["faculty"]?></a></li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            else
            {
                if(isset($_GET["group"]))
                {
                ?>
                <p>Не найдено групп с такими параметрами поиска.</p>
                <?php
                }
                else
                {
                ?>
                <p>Введите в поле поиска название группы.</p>
                <?php              
                }
            };
        };
        break;
		
	case "students":
	{
		if (isset($MODULE_OUTPUT["students"]) && sizeof($MODULE_OUTPUT["students"])) {
			?>
			<h2>Состав группы</h2><ul>
			<?php
			foreach($MODULE_OUTPUT["students"] as $student)
			{
				?><li><a href="/people/<?php echo $student["id"]; ?>/"><?php echo $student["last_name"]." ".$student["name"]." ".$student["patronymic"]; ?></a><?php
			}
			?></ul><?php
		}
		break;
	}
    
    case "timetable_groups":
    {
        if(!isset($MODULE_OUTPUT["groups_mode"]))
        {
        $id = 0;
        foreach($MODULE_OUTPUT["timetable_groups"] as $group)
        {
            if($group["id_faculty"] != $id)
            {
                if($group["institute_name"])
                    {?>
                        <h2><?=$group["institute_name"]?>: <?=$group["faculty_name"]?></h2>
                        <?php
                    }
                else
                {?>
                    <h2><?=$group["faculty_name"]?></h2>
                    <?php
                }
                $id = $group["id_faculty"];
            }
            ?>
            <a href="edit/<?=$group["id"]?>/"><?=$group["name"]?></a> [<a href="delete/<?=$group["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]<br />
            <?php
        }
        
        ?>
        <h3>Добавить группу:</h3>
        <form method="post" name="add_group">
        Имя группы:<br />
        <input type="text" name="group_name" />
        <br />
        Выберите факультет:
        <br />
        <select name="faculties" size="1">
        <option value="0" selected="selected">Выберите факультет</option>
        <?php
        foreach($MODULE_OUTPUT["faculties"] as $faculty)
        {
            ?>
            <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
            <?php
        }
        ?>
        </select>
        <br />
        <input type="submit" value="Добавить" class="button" />
        </form>
        <?php
        }
        else
        {
            switch($MODULE_OUTPUT["groups_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_group"] as $group)
                    {
                        echo "<h2>Редактирование информации о группе ".$group["name"]." (".$group["faculty_name"]."):</h2>";
                        ?>
                        <form name="edit_group" method="post">
                        <h3>Название группы:</h3>
                        <input type="text" name="group_name" value="<?=$group["name"]?>" />
                        <h3>Факультет, к которому относится группа:</h3>
                        <select name="faculty">
                        <?php
                        foreach($MODULE_OUTPUT["faculties"] as $faculty)
                        {
                            if($faculty["id"] == $group["id_faculty"])
                            {?>
                                <option value="<?=$faculty["id"]?>" selected="selected"><?=$faculty["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select><br />
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$group["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }
            }
        }
        break;
    }
    case "timetable_faculties":
    {
        if(!isset($MODULE_OUTPUT["faculty_mode"]))
        {
            ?>
            <h2>Список факультетов:</h2>
            <ul>
            <?php
        foreach($MODULE_OUTPUT["timetable_faculties"] as $faculty)
        {
            ?>
            <li><a href="edit/<?=$faculty["id"]?>/"><?=$faculty["name"]?></a> [<a href="delete/<?=$faculty["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]</li>
            <?php
            if(isset($faculty["subfaculties"]))
            {
                ?>
                <ul>
                <?php
                foreach($faculty["subfaculties"] as $subfaculty)
                {
                    ?>
                    <li><a href="edit/<?=$subfaculty["id"]?>/"><?=$subfaculty["name"]?></a> [<a href="delete/<?=$subfaculty["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]</li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }    
        }
        ?>
        </ul>
        <br />
        <h2>Добавить факультет или институт:</h3>
        <form method="post" name="add_faculty">
        <h3>Название факультета или института:</h3>
        <input type="text" name="faculty_name" class="input_long" />
		<h3>Короткое название:</h3>
        <input type="text" name="faculty_shortname" />
        <h3>Выберите институт (если есть), к которому будет относиться данный факультет:</h3>
        <select name="pid" size="1">
        <option value="0" selected="selected">Выберите институт:</option>
        <?php
        foreach($MODULE_OUTPUT["timetable_faculties"] as $faculty)
        {
            ?>
            <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
            <?php
        }
        ?>
        </select>
		<h3>Сайт:</h3>
        <input type="text" name="faculty_link" />
        <br />
        <input type="submit" value="Добавить" class="button" />
        </form>
        <?php
        }
        else
        {
            switch($MODULE_OUTPUT["faculty_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_faculty"] as $faculty)
                    {
                        ?>
                        <h2>Редактирование информации о факультете <?=$faculty["name"]?>:</h2>                        
                        <form name="edit_faculty" method="post">
                        <h3>Название факультета:</h3>
                        <input type="text" name="faculty_name" value="<?=$faculty["name"]?>" />
                        <h3>Факультет или институт, к которому относится данный факультет:</h3>
                        <select name="pid" size="1">
                        <?php
                        if(!$faculty["pid"])
                        {
                            ?>
                            <option value="0" selected="selected">Выберите факультет</option>
                            <?php    
                        }
                        foreach($MODULE_OUTPUT["faculties"] as $faculties)
                        {
                        
                            if($faculty["pid"] == $faculties["id"])
                            {?>
                                <option value="<?=$faculties["id"]?>" selected="selected"><?=$faculties["name"]?></option>
                                <?php
                            }
                            else
                            {   ?>
                                <option value="<?=$faculties["id"]?>"><?=$faculties["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select><br />
						<h3>Сайт факультета:</h3>
                        <input type="text" name="faculty_link" value="<?=$faculty["link"]?>" />
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$faculty["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }
            }
        }
        break;
    }
    
    case "timetable_make":
    {
        ?>
        <h2>Управление расписанием</h2>
        <p>Вы находитесь в разделе "Управление расписанием".
        В данном разделе вы можете добавлять и редактировать информацию о факультетах, кафедрах, преподавателях, предметах, аудиториях и группах.
        Так же вы можете составлять и редактировать графики учебного процесса и распределение предметов по кафедрам.
        Для этого выберите соответствующий раздел меню, находящегося справа.</p>
        <?php
        break;
    }
    
    case "timetable_departmens":
    {
        if(!isset($MODULE_OUTPUT["departments_mode"]))
        { 
        if(isset($MODULE_OUTPUT["timetable_departments"]))
        {
            $id = 0;
            ?>
            <h2>Список кафедр по факультетам:</h2>            
            <ul>
            <?php
            foreach($MODULE_OUTPUT["timetable_departments"] as $department)
            {
                if($department["faculty_id"] != $id)
                {
                    ?>
                    </ul><li><?=$department["faculty_name"]?><ul>
                    <?php
                    $id = $department["faculty_id"];
                }
                ?>
                <li> <a href="edit/<?=$department["id"]?>/"><?=$department["name"]?></a> [<a href="delete/<?=$department["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]</li>
                <?php
            }
            ?>
            </ul>
            <?php   
        }
        ?>
        <br />
        <h2>Добавить кафедру:</h2>
        <form method="post" name="add_department">
        <h3>Название кафедры:</h3>
        <input type="text" name="department_name" size="60" />
        <h3>Выберите институт или факультет, к которому относится кафедра:</h3>
        <select name="faculty_id" size="1">
        <option value="0" selected="selected">Выберите факультет:</option>
        <?php
        foreach($MODULE_OUTPUT["faculties"] as $faculty)
        {
            ?>
            <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option
            <?php
        }
        ?>
        </select>
        <br />
        <input type="submit" value="Добавить" class="button" />
        </form>
        <?php
        }
        else
        {
            switch($MODULE_OUTPUT["departments_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_department"] as $department)
                    {
                        ?>
                        <h2>Редактирование информации о кафедре <?=$department["name"]?> (<?=$department["faculty_name"]?>):</h2>
                        <form name="edit_department" method="post">
                        <h3>Название кафедры:</h3>
                        <input type="text" name="department_name" value="<?=$department["name"]?>" size="60" />
                        <h3>Факультет, к которому относится кафедра:</h3>
                        <select name="faculty">
                        <?php
                        foreach($MODULE_OUTPUT["faculties"] as $faculty)
                        {
                            if($faculty["id"] == $department["faculty_id"])
                            {?>
                                <option value="<?=$faculty["id"]?>" selected="selected"><?=$faculty["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select><br />
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$department["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }
            }
        }
        break;
    }
    
    case "timetable_teachers":
    {
        $rate = array(0.25, 0.5, 0.75, 1, 1.25, 1.5);
        if(!isset($MODULE_OUTPUT["teachers_mode"]))
        {
        if(isset($MODULE_OUTPUT["timetable_teachers"]))
        {
            $id = 0;
            ?>
            <h2>Список преподавателей по кафедрам:</h2>            
            <ul>
            <?php
            foreach($MODULE_OUTPUT["timetable_teachers"] as $teachers)
            {
                if(isset($teachers["department_id"]) && $teachers["department_id"] != $id)
                {
                    ?>
                    </ul><li><?=$teachers["department_name"]?><ul>
                    <?php
                    $id = $teachers["department_id"];
                }
                ?>
                <li><a href="edit/<?=$teachers["id"]?>/"><?=$teachers["last_name"]?> <?=$teachers["name"]?> <?=$teachers["patronymic"]?></a> [<a href="delete/<?=$teachers["id"]?>/<?=$teachers["department_id"]?>/" onclick="return confirmSubmit()">Удалить</a>]</li>
                <?php
            }
        ?></ul><?php
        }
        ?>
        <br />
        <?php
        if(isset($MODULE_OUTPUT["is_exist"]))
        {
            foreach($MODULE_OUTPUT["is_exist"] as $exist)
            {
                echo "Преподаватель ".$exist["last_name"];
                if(isset($exist["name"]))
                    echo " ".$exist["name"];
                if(isset($exist["patronymic"]))
                    echo " ".$exist["patronymic"];
                echo ", приписаный к кафедрам: ";
                if(isset($exist["department1_name"]))
                    echo $exist["department1_name"];
                if(isset($exist["department2_name"]))
                    echo " и ".$exist["department2_name"];
                echo " уже существует. Вы уверены, что нужно добавить еще раз?";
                ?>
                <form method="post" name="is_exist">
                <input type="hidden" value="<?=$exist["last_name"]?>" name="last_name" />
                <input type="hidden" value="<?=$exist["name"]?>" name="name" />
                <input type="hidden" value="<?=$exist["patronymic"]?>" name="patronymic" />
                <input type="hidden" value="<?=$exist["male"]?>" name="male" />
                <?php
                if(isset($exist["department1_id"]))
                {
                ?>
                <input type="hidden" value="<?=$exist["department1_id"]?>" name="department1" />
                <?php
                }
                if(isset($exist["department2_id"]))
                {
                ?>
                <input type="hidden" value="<?=$exist["department2_id"]?>" name="department2" />
                <?php
                }
                ?>
                <input type="submit" value="Да" name="check" class="button" /><br />
                <input type="submit" value="Нет" name="check" class="button" />
                </form>
                <?php
            }
        }
        ?>
        <br />
        <form method="post" name="add_teacher" onsubmit="return sendform();">
        <h2>Добавить преподавателя:</h2>
        <h3>Фамилия:</h3>
        <input type="text" name="last_name" />
        <h3>Имя:</h3>
        <input type="text" name="name" />
        <h3>Отчество:</h3>
        <input type="text" name="patronymic" />
        <h3>Пол</h3>
        <input type="radio" name="male" value="1" checked="checked" />М / Ж
        <input type="radio" name="male" value="0" />
        <h3>Выберите кафедру:</h3>
        <select name="department1_id" size="1">
        <option value="0" selected="selected">Выберите кафедру:</option>
        <?php
        $id=0;
        foreach($MODULE_OUTPUT["department"] as $department)
        {
            if($department["faculty_id"]!=$id)
            {
                if($id)
                {
                    ?></OPTGROUP>
                    <?php
                }
                ?>
                <OPTGROUP label="<?=$department["faculty_name"]?>">
                <?php
                $id=$department["faculty_id"];
            }
            ?>
            <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
            <?php
        }
        ?>
        </select>
        <h3>Выберите вторую кафедру(если есть. В этом случае выбранные кафедры должны быть различными):</h3>
        <select name="department2_id" size="1">
        <option value="0" selected="selected">Выберите кафедру:</option>
        <?php
        $id=0;
        foreach($MODULE_OUTPUT["department"] as $department)
        {
            if($department["faculty_id"]!=$id)
            {
                if($id)
                {
                    ?>
                    </OPTGROUP>
                    <?php
                }
                ?>
                <OPTGROUP label="<?=$department["faculty_name"]?>">
                <?php
                $id=$department["faculty_id"];
            }
            ?>
            <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
            <?php
        }
        ?>
        </select>
        <h3>Имя пользователя для доступа в систему:</h3>
            <input type="text" name="username" />
            <h3>Электронная почта (E-mail):</h3>
            <input type="text" name="email" />
            <h3>Пароль:</h3>
            <input type="password" name="password1" />
            <h3>Повторите пароль:</h3>
            <input type="password" name="password2" />
        <br />
        
        
        <input type="submit" value="Добавить" class="button" />
        </form>
        <?php
        }
        else
        {
            switch($MODULE_OUTPUT["teachers_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_teacher"] as $teacher)
                    {
                        echo "<h2>Редактирование информации о преподавателе ".$teacher["last_name"];
                        if(isset($teacher["name"]))
                            echo " ".$teacher["name"];
                        if(isset($teacher["patronymic"]))
                            echo " ".$teacher["patronymic"];
                        echo "</h2>";
                        ?>
                        <form name="edit_teacher" method="post" onsubmit="return sendform();">
                        <h3>Фамилия преподавателя:</h3>
                        <input type="text" name="last_name" value="<?=$teacher["last_name"]?>" />
                        <h3>Имя преподавателя:</h3>
                        <input type="text" name="name" value="<?=$teacher["name"]?>" />
                        <h3>Отчество преподавателя:</h3>
                        <input type="text" name="patronymic" value="<?=$teacher["patronymic"]?>" />
                        <h3>Пол:</h3>
                        <?php
                        if($teacher["male"])
                        {
                        ?>
                        <input type="radio" name="male" value="1" checked="checked" />М / Ж
                        <input type="radio" name="male" value="0" />
                        <?php
                        }
                        else
                        {
                        ?>
                        <input type="radio" name="male" value="1" />М / Ж
                        <input type="radio" name="male" value="0" checked="checked" />
                        <?php
                        }
                        ?>
                        <h3>Выберите кафедру:</h3>
                        <select name="department1_id" size="1">
                        <?php
                        if(!$teacher["department1_id"])
                        {
                        ?>
                        <option value="0" selected="selected">Выберите кафедру:</option>
                        <?php
                        }
                        else
                        {
                        ?>
                        <option value="0">Кафедра не выбрана</option>
                        <?php    
                        }
                        $id=0;
                        foreach($MODULE_OUTPUT["department"] as $department)
                        {
                            if($department["faculty_id"]!=$id)
                            {
                                if($id)
                                    {
                                        ?>
                                        </OPTGROUP>
                                        <?php
                                    }
                                    ?>
                                <OPTGROUP label="<?=$department["faculty_name"]?>">
                                <?php
                                $id=$department["faculty_id"];
                            }
                            if($teacher["department1_id"] == $department["id"])
                            {?>
                                <option value="<?=$department["id"]?>" selected="selected"><?=$department["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                                <?php
                            }
                        }
                            ?>
                        </select>
                        
                        <h3>Выберите вторую кафедру(если есть. В этом случае выбранные кафедры должны быть различными):</h3>
                        <select name="department2_id" size="1">
                        <?php
                        if(!$teacher["department2_id"])
                        {
                        ?>
                        <option value="0" selected="selected">Выберите кафедру:</option>
                        <?php
                        }
                        else
                        {
                        ?>
                        <option value="0">Кафедра не выбрана</option>
                        <?php    
                        }
                        $id=0;
                        foreach($MODULE_OUTPUT["department"] as $department)
                        {
                            if($department["faculty_id"]!=$id)
                            {
                                if($id)
                                {?>
                                    </OPTGROUP>
                                    <?php
                                }
                                ?><OPTGROUP label="<?=$department["faculty_name"]?>">
                                <?php
                                $id=$department["faculty_id"];
                            }
                            if($teacher["department2_id"]==$department["id"])
                            {?>
                                <option value="<?=$department["id"]?>" selected="selected"><?=$department["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                                <?php
                            }
                        }
                            ?>
                        </select>
                        <h3>Имя пользователя для доступа в систему:</h3>
                        <?php
                        if(isset($teacher["username"]))
                        {
                            ?>
                            <input type="text" name="username" value="<?=$teacher["username"]?>"/>
                            <?php
                        }
                        else
                        {
                            ?>
                            <input type="text" name="username"/>
                            <?php    
                        }
                        ?>
                        <h3>Электронная почта (E-mail):</h3>
                        <?php
                        if(isset($teacher["email"]))
                        {
                            ?>
                            <input type="text" name="email" value="<?=$teacher["email"]?>"/>
                            <?php
                        }
                        else
                        {
                            ?>
                            <input type="text" name="email"/>
                            <?php    
                        }
                        ?>
                        <?php
                        if(empty($teacher["password"]))
                        {
                            ?>
                        <h3>Пароль:</h3>
                        <input type="password" name="password1" />
                        <h3>Повторите пароль:</h3>
                        <input type="password" name="password2" />
                        <?php
                        }
                        ?>
                        <br />
                        
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$teacher["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }    
        }
        }
        break;
    }
    
    case "timetable_subjects":
    {
        if(!isset($MODULE_OUTPUT["subjects_mode"]))
        {
            if(isset($MODULE_OUTPUT["subjects"]))
            {
                $id = 0;
                ?>
                <h2>Список предметов по кафедрам:</h2>                
                <ul>
                <?php
                foreach($MODULE_OUTPUT["subjects"] as $subject)
                {
                    if($subject["department_id"] != $id)
                    {
                        ?>
                        </ul><li><?=$subject["department_name"]?><ul>
                        <?php
                        $id = $subject["department_id"];
                    }
                    ?>
                    <li> <a href="edit/<?=$subject["id"]?>/"><?=$subject["name"]?></a> [<a href="delete/<?=$subject["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]</li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            ?>
            <h2>Добавить предмет:</h2>
            <form method="post" name="add_subject">
            <h3>Название предмета:</h3>
            <input type="text" name="subject_name" />
            <h3>Выберите кафедру, к которой относится предмет:</h3>
            <select name="department_id" size="1">
            <option value="0" selected="selected">Выберите кафедру:</option>
            <?php
            /*foreach($MODULE_OUTPUT["departments"] as $department)
            {
                ?>
                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                <?php
            }*/
            $id=0;
        foreach($MODULE_OUTPUT["departments"] as $department)
        {
            if($department["faculty_id"]!=$id)
            {
                if($id)
                {
                    ?></OPTGROUP>
                    <?php
                }
                ?>
                <OPTGROUP label="<?=$department["faculty_name"]?>">
                <?php
                $id=$department["faculty_id"];
            }
            ?>
            <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
            <?php
        }
            ?>
            </select>
            <br />
            <input type="submit" value="Добавить" class="button" />
            </form>
            <?php
        }
        else
        {
            switch($MODULE_OUTPUT["subjects_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_subject"] as $subject)
                    {
                        ?>
                        <h2>Редактирование информации о предмете <?=$subject["name"]?>:</h2>
                        <form name="edit_subject" method="post">
                        <h3>Название предмета:</h3>
                        <input type="text" name="subject_name" value="<?=$subject["name"]?>" />
                        <h3>Кафедра, к которому относится предмет:</h3>
                        <select name="department">
                        <?php
                        foreach($MODULE_OUTPUT["departments"] as $department)
                        {
                            if($department["id"] == $subject["department_id"])
                            {
                            ?>
                                <option value="<?=$department["id"]?>" selected="selected"><?=$department["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select><br />
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$subject["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }
            }
        }
        break;
    }
    
    
     case "timetable_auditorium":
    {
        $type = array("Открытый", "Закрытый", "Закрытый специальный");
        $using = array("Используется", "Ремонт", "ЧП");
        if(!isset($MODULE_OUTPUT["auditorium_mode"]))
        {
            if(isset($MODULE_OUTPUT["auditorium"]))
            {
                $id = 0;
                ?>
                <h2>Список аудиторий по корпусам:</h2>
                <ul>
                <?php
                foreach($MODULE_OUTPUT["auditorium"] as $auditorium)
                {
                    if($auditorium["building_id"] != $id)
                    {
                        ?>
                        </ul><li><?=$auditorium["building_name"]?><ul>
                        <?php
                        $id = $auditorium["building_id"];
                    }
                    ?>
                    <li> <a href="edit/<?=$auditorium["id"]?>/"><?=$auditorium["label"]?> - <?=$auditorium["name"]?></a> Вместительноть: <?=$auditorium["roominess"]?>;&nbsp;
                    <?php
                    for($i=0; $i<3; $i++)
                    {
                        if($i == $auditorium["type"])
                        {
                            ?>
                            Тип аудитории: <?=$type[$i]?>;
                            <?php
                        }
                    }
                    ?>
                    Состояние: <?=$using[$auditorium["is_using"]]?>;&nbsp;
                    [<a href="delete/<?=$auditorium["id"]?>/" onclick="return confirmSubmit()"}>Удалить</a>]</li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            ?>
            <br />
            <h2>Добавить аудиторию:</h2>
            <form method="post" name="add_auditorium">
            <h3>Номер аудитории:</h3>
            <input type="text" name="auditorium_name" />
            <h3>Выберите корпус, в котором расположена данная аудитория:</h3>
            <select name="building_id" size="1">
            <option value="0" selected="selected">Выберите корпус:</option>
            <?php
            foreach($MODULE_OUTPUT["buildings"] as $building)
            {
                ?>
                <option value="<?=$building["id"]?>"><?=$building["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>Введите вместительность аудитории:</h3>
            <input type="text" name="roominess" />
            <h3>Кафедра, к которой приписана аудитория (если есть):</h3>
            <select name="department_id" size="1">
            <option value="0" selected="selected">Выберите кафедру:</option>
            <?php
            foreach($MODULE_OUTPUT["departments"] as $department)
            {
                ?>
                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>Выберите тип аудитории:</h3>
            <select name="type" size="1">
            <?php
            for($i=0; $i<3; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$type[$i]?></option>
                <?php
            }
            ?>
            </select>
            <h3>Выберите состояние аудитории:</h3>
            <select name="is_using" size="1">
            <?php
            for($i=0; $i<3; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$using[$i]?></option>
                <?php
            }
            ?>
            </select>
            <br />
            <input type="submit" value="Добавить" class="button" />
            </form>
            <?php
        }
        else
        {
            switch($MODULE_OUTPUT["auditorium_mode"])
            {
                case "edit":
                {
                    foreach($MODULE_OUTPUT["edit_auditorium"] as $auditorium)
                    {
                        ?>
                        <h2>Редактирование информации об аудитории <?=$auditorium["name"]?>:</h2>
                        <form name="edit_auditorium" method="post">
                        <h3>Номер аудитории:</h3>
                        <input type="text" name="auditorium_name" value="<?=$auditorium["name"]?>" />
                        <h3>Корпус, в котором расположена аудитория:</h3>
                        <select name="building">
                        <?php
                        foreach($MODULE_OUTPUT["buildings"] as $building)
                        {
                            if($building["id"] == $auditorium["building_id"])
                            {
                                ?>
                                <option value="<?=$building["id"]?>" selected="selected"><?=$building["name"]?></option>
                                <?php
                            }
                            else
                            {
                                ?>
                                <option value="<?=$building["id"]?>"><?=$building["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select>
                        <h3>Введите вместительность аудитории:</h3>
                        <input type="text" name="roominess" value="<?=$auditorium["roominess"]?>" />
                        <h3>Кафедра, к которой приписана аудитория (если есть):</h3>
                        <select name="department_id">
                        <?php
                        if(!$auditorium["department_id"])
                        {
                            ?>
                            <option selected="selected" value="0">Выберите кафедру</option>
                            <?php
                        }
                        else
                        {
                            ?>
                            <option value="0">Нет кафедры</option>
                            <?php    
                        }
                        foreach($MODULE_OUTPUT["departments"] as $department)
                        {
                            if($department["id"] == $auditorium["department_id"])
                            {
                                ?>
                                <option selected="selected" value="<?=$department["id"]?>"><?=$department["name"]?></option>
                                <?php
                            }
                            else
                            {
                                ?>
                                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select>
                        <h3>Тип аудитории:</h3>
                        <select name="type" size="1">
                        <?php
                        for($i=0; $i<3; $i++)
                        {
                            if($i == $auditorium["type"])
                            {
                                ?>
                                <option value="<?=$i?>" selected="selected"><?=$type[$i]?></option>
                                <?php
                            }
                            else
                            {
                                ?>
                                <option value="<?=$i?>"><?=$type[$i]?></option>
                                <?php    
                            }
                        }
                        ?>
                        </select>
                        <h3>Состояние аудитории:</h3>
                        <select name="is_using" size="1">
                        <?php
                        for($i=0; $i<3; $i++)
                        {
                            if($i == $auditorium["is_using"])
                            {
                                ?>
                                <option value="<?=$i?>" selected="selected"><?=$using[$i]?></option>
                                <?php
                            }
                            else
                            {
                                ?>
                                <option value="<?=$i?>"><?=$using[$i]?></option>
                                <?php    
                            }
                        }
                        ?>
                        </select>
                        <br />
                        
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$auditorium["id"]?>" name="id" />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
                    break;
                }
            }
        }
        break;
    }
    
    
    case "timetable_show":
    {
        ?>
        <h1>Расписание</h1>
        <?php
        foreach($MODULE_OUTPUT["faculties"] as $faculty)
        {
            ?>
            <div class="div1">
            <h2><?=$faculty["name"]?></h2>
            <?php
            for($i=1; $i<7; $i++)
            {
                
                ?>
                <div class="div2">
                <h3>Курс <?=$i?></h3>
                <?php
                if(isset($faculty["groups"]) && isset($faculty["groups"][$i]))
                {
                    foreach($faculty["groups"][$i] as $group)
                    {
                        ?>
                        <a href="/groups/<?=$group["id"]?>/"><?=$group["name"]?></a>
                        <br />
                        <?php
                    }
                }
                ?>
                </div>    
            <?php
            }
            ?>
            <div class="pusher"></div></div>
            <?php    
        }
        break;
    }
    
    case "groups_list":
    {
        if(isset($MODULE_OUTPUT["faculty_list"]))
        {
            ?>
            <h2>Добавление группы:</h2>
            <form name="new_group" method="post">
            <h3>Введите номер группы:</h3>
            <input type="text" name="group_name" />
            <h3>Выберите факультет</h3>
            <select name="faculty">
            <?php
            foreach($MODULE_OUTPUT["faculty_list"] as $faculty)
            {
                ?>
                <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                <?php
            }
            ?>
            </select><br />
            <h3>Курс</h3>
            <select name="year">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            </select>
            <br />
            <input type="submit" value="Добавить группу" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["faculties"]))
        {
            ?>
            <div id="div3">
            <a href="add_group/">Добавить группу.</a>
            <?php
            foreach($MODULE_OUTPUT["faculties"] as $faculty)
            {
                ?>
                
                <div class="div1">
                <h2><?=$faculty["name"]?></h2>
                <?php
                for($i=1; $i<7; $i++)
                {
                
                    ?>
                    <div class="div2">
                    <h3>Курс <?=$i?></h3>
                    <?php
                    if(isset($faculty["groups"]) && isset($faculty["groups"][$i]))
                    {
                        foreach($faculty["groups"][$i] as $group)
                        {
                            ?>
                            <a href="<?=$group["id"]?>/"><?=$group["name"]?></a>
                            <br />
                            <?php
                        }
                    }
                    ?>
                    </div>    
                    <?php
                }
                ?>
                <div class="pusher"></div>
                </div>
                 
                <?php    
            }
            ?>
            </div>
            <div class="pusher"></div>
            <?php
        }
        if(isset($MODULE_OUTPUT["students_list"]) || isset($MODULE_OUTPUT["students_list_mode"]))
        {
            ?>
            <a href="edit_group/">Редактировать группу.</a><br />
            <a href="delete_group/" onclick="return confirmSubmit();">Удалить группу(это возможно сделать только после отчисления всех студентов или перевода их в другую групу).</a>
            <h2>Список студентов
            <?php
            if(isset($MODULE_OUTPUT["group_name"]))
            {
                echo ", числящихся в группе ";
                echo $MODULE_OUTPUT["group_name"];
            }
            if(isset($MODULE_OUTPUT["faculty_name"]))
            {
                echo "(".$MODULE_OUTPUT["faculty_name"].")";
            }
            ?>
            :</h2>
            <?php
            if(isset($MODULE_OUTPUT["students_list"]))
            {
            foreach($MODULE_OUTPUT["students_list"] as $student)
            {
                ?>
                <a href="<?=$student["id"]?>/"><?=$student["last_name"]?> <?=$student["name"]?> <?=$student["patronymic"]?></a>
                <br />
                <?php
                $id_speciality = $student["id_speciality"];
            }
            }
            ?>
            <h2>Добавление студента в группу:</h2>
            <form name="add_student" method="post" onsubmit="return sendform();">
            <h3>Фамилия:</h3>
            <input type="text" name="last_name" />
            <h3>Имя:</h3>
            <input type="text" name="name" />
            <h3>Отчество:</h3>
            <input type="text" name="patronymic" />
            <input type="hidden" name="group_id" value="<?=$MODULE_OUTPUT["group_id"]?>" />
            <h3>Пол:</h3>
            <input type="radio" value="1" name="male" />М / Ж<input type="radio" value="0" name="male" />
            <h3>Специальность:</h3>
            <select name="id_speciality">
            <?php
            if(isset($MODULE_OUTPUT["specialities"]))
            {
                if(!isset($id_speciality))
                {
                    ?>
                    <option value="0" selected="selected" disabled="disabled">Выберите специальность</option>
                    <?php
                }
                foreach($MODULE_OUTPUT["specialities"] as $speciality)
                {
                    if(isset($id_speciality))
                    {
                        if($id_speciality == $speciality["code"])
                        {
                        ?>
                        <option value="<?=$id_speciality?>" selected="selected"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>
                        <?php
                        }
                        else
                        {
                        ?>
                        <option value="<?=$speciality["code"]?>"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>
                        <?php
                        }
                    }
                    else
                    {
                    ?>
                    <option value="<?=$speciality["code"]?>"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>
                    <?php
                    }
                }
            }
            ?>
            </select>
            <h3>Год поступления:</h3>
            <input type="text" name="year" />
            <h3>Подгруппа (если есть):</h3>
            <input type="radio" value="а" name="subgroup" />а / б<input type="radio" value="б" name="subgroup" />
            <h3>Имя пользователя для доступа в систему:</h3>
            <input type="text" name="username" />
            <h3>Электронная почта (E-mail):</h3>
            <input type="text" name="email" />
            <h3>Пароль:</h3>
            <input type="password" name="password1" />
            <h3>Повторите пароль:</h3>
            <input type="password" name="password2" /><br />
            <input type="submit" value="Добавить студента в группу" class="button" /> 
            </fomr>
            <?php    
        }
        if(isset($MODULE_OUTPUT["edit_group"]))
        {
            foreach($MODULE_OUTPUT["edit_group"] as $group)
                    {
                        echo "<h2>Редактирование информации о группе ".$group["name"]." (".$group["faculty_name"]."):</h2>";
                        ?>
                        <form name="edit_group" method="post">
                        <h3>Название группы:</h3>
                        <input type="text" name="group_name" value="<?=$group["name"]?>" />
                        <h3>Факультет, к которому относится группа:</h3>
                        <select name="faculty">
                        <?php
                        foreach($MODULE_OUTPUT["faculties_edit_group"] as $faculty)
                        {
                            if($faculty["id"] == $group["id_faculty"])
                            {?>
                                <option value="<?=$faculty["id"]?>" selected="selected"><?=$faculty["name"]?></option>
                                <?php
                            }
                            else
                            {?>
                                <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                                <?php
                            }
                        }
                        ?>
                        </select>
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$group["id"]?>" name="id" />
                        <h3>Курс</h3>
                        <input type="text" name="year" value="<?=$group["year"]?>" />
                        <br />
                        <input type="submit" value="Сохранить" class="button" />
                        </form>
                        <?php
                    }
        }
        if(isset($MODULE_OUTPUT["edit_student"]))
        {
            $student = $MODULE_OUTPUT["edit_student"];                                                
            {
                ?>
                <h2>Редактирование информации о студенте:</h2>
                <a href="expulsion/" onclick="return expulsion();">Отчислить студента.</a><br />
                <a href="marks/">Просмотр оценок</a>
                <input type="hidden" name="id_student" value="<?=$student["id"]?>" />
                <form name="edit_student" method="post" onsubmit="return sendform();">
                <h3>Фамилия:</h3>
                <input type="text" name="last_name" value="<?=$student["last_name"]?>" />
                <h3>Имя:</h3>
                <input type="text" name="name" value="<?=$student["name"]?>" />
                <h3>Отчество:</h3>
                <input type="text" name="patronymic" value="<?=$student["patronymic"]?>" />
                <h3>Пол:</h3>
                <?php
                if(isset($student["male"]))
                {
                if($student["male"])
                {
                ?>
                <input type="radio" value="1" name="male" checked="checked" />М / Ж<input type="radio" value="0" name="male" />
                <?php
                }
                else
                {
                ?>
                <input type="radio" value="1" name="male" />М / Ж<input type="radio" value="0" name="male" checked="checked" />
                <?php
                }
                }
                else
                {
                ?>
                <input type="radio" value="1" name="male" />М / Ж<input type="radio" value="0" name="male" />
                <?php
                }
                ?>
                <h3>Специальность:</h3>
                <select name="id_speciality">
                <?php
                if(isset($MODULE_OUTPUT["specialities"]))
                {           
                    foreach($MODULE_OUTPUT["specialities"] as $speciality)
                    {
                        //if(isset($student["id_speciality"]))
                        {
                            //if($student["id_speciality"] == $speciality["id_speciality"])
                            if($student["id_speciality"] == $speciality["code"])
                            {
                            ?>
                            <option value="<?=$speciality["code"]?>" selected="selected"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>          
                            <?php
                            }
                            else
                            {
                            ?>
                            
                            <option value="<?=$speciality["code"]?>"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>
                            <?php
                            }
                        }
                        /*else
                        {
                        ?>
                        <option value="<?=$student["id_speciality"]?>"><?=$speciality["name"]?> (<?=$speciality["code"]?>)</option>
                        <?php
                        }*/
                    }
                }
                ?>
                </select>
                <h3>Год поступления:</h3>
                <input type="text" name="year" value="<?=$student["year"]?>" />
                <h3>Группа:</h3>
                <?php
                ?>
                <select name="group">
                <?php
                foreach($MODULE_OUTPUT["faculties_list"] as $faculty)
                {
                    ?>
                    <optgroup label="<?=$faculty["name"]?>">
                    <?php
                    foreach($faculty["groups"] as $group)
                    {
                        if($student["id_group"] == $group["id"])
                            {
                            ?>
                            <option value="<?=$group["id"]?>" selected="selected"><?=$group["name"]?></option>          
                            <?php
                            }
                            else
                            {
                            ?>
                            
                            <option value="<?=$group["id"]?>"><?=$group["name"]?></option>
                            <?php
                            }    
                    }
                    ?>
                    </optgroup>
                    <?php
                }
                ?>
                </select>
                <h3>Подгруппа (если есть):</h3>
                <?php
                if(isset($student["male"]))
                {
                if($student["subgroup"] == "а")
                {
                ?>
                <input type="radio" value="а" name="subgroup" checked="checked" />а / б<input type="radio" value="б" name="subgroup" />
                <?php
                }
                else
                {
                ?>
                <input type="radio" value="а" name="subgroup" />а / б<input type="radio" value="б" name="subgroup" checked="checked" />
                <?php
                }
                }
                else
                {
                ?>
                <input type="radio" value="а" name="subgroup" />а / б<input type="radio" value="б" name="subgroup" />
                <?php
                }
                ?>
                <h3>Имя пользователя для доступа в систему:</h3>
                <?php
                if(isset($student["username"]))
                {
                ?>
                <input type="text" name="username" value="<?=$student["username"]?>" />
                <?php
                }
                else
                {
                    ?>
                    <input type="text" name="username" value="" />
                    <?php    
                }
                ?>
                <br />
                <h3>Электронная почта (E-mail):</h3>
                <?php
                if(isset($student["email"]))
                {
                ?>
                <input type="text" name="email" value="<?=$student["email"]?>" />
                <?php
                }
                else
                {
                    ?>
                    <input type="text" name="email" value="" />
                    <?php
                }
                ?>
                <br />
                <?php
                if(empty($student["password"]))
                {
                    ?>
                    <h3>Для данного студента еще не установлен пароль. Задать:</h3>
                    <h3>Пароль:</h3>
                    <input type="password" name="password1" />
                    <h3>Повторите пароль:</h3>
                    <input type="password" name="password2" />
                    <?php
                }
                ?>
                <br />
                <input type="submit" value="Сохранить изменения" class="button" /> 
                </fomr>
                <?php
            }
        }
        if(isset($MODULE_OUTPUT["marks"]))
        {
            $marks = $MODULE_OUTPUT["marks"];
            $months = array("января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря");
            $year = date("Y");
            $month = date("n");
            $day = date("j");
            ?>
            <h2>
            <?=$MODULE_OUTPUT["student_last_name"]?> <?=$MODULE_OUTPUT["student_name"]?> <?=$MODULE_OUTPUT["student_patronymic"]?>
            </h2>
            <?php
            if(!empty($MODULE_OUTPUT["marks"]))
            {
            ?>
            <h2>Просмотр оценок студента</h2>
            <table class="timetable">
            <tr class="table_top"><th>Название предмета</th><th>Оценка</th><th>Дата</th><th>Действие</th></tr>
            <?php
            $i=1;
            foreach($MODULE_OUTPUT["marks"] as $mark)
            {
                if($mark["term"] == $i)
                {
                    ?>
                    <tr class="week_day"><th colspan="4">Семестр <?=$i?></th></tr>
                    <?php
                    $i++;
                }
                ?>
                <tr><td><?=$mark["subject"]?></td><td><?=$mark["mark"]?></td><td><?=$mark["date"]?></td><td><a href="edit/<?=$mark["id"]?>/">Редактировать</a> / <a href="delete/<?=$mark["id"]?>/" onclick="return confirmSubmit();">Удалить</a></td></tr>
                <?php
            }
            ?>
            </table>
            <?php
            }
            ?>
            <h2>Добавить оценку</h2>
            <form method="post">
            <input type="hidden" name="student_id" value="<?=$MODULE_OUTPUT["student_id"]?>" />
            <h3>Название предмета:</h3>
            <select name="subject">
            <option value="0">Выберите предмет</option>
            <?php
            foreach($MODULE_OUTPUT["subjects"] as $subject)
            {
                ?>
                <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>Оценка (или отметка о зачете)</h3>
            <select name="mark">
            <option selected="selected" disabled="disabled" value="0">Выберите оценку</option>
            <?php
            for($k=2; $k<6; $k++)
            {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
            }
            ?>
            <option value="Зачтено">Зачтено</option>
            <option value="Не зачтено">Не зачтено</option>
            </select>
            <br />
            <h3>Дата</h3>
            <select name="day">
            <?php
            for($i=1; $i<=31; $i++)
            {
                if($i != $day)
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></option>
                    <?php
                }
                else
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></option>
                    <?php
                }
            }
            ?>
            </select>
            <select name="month">
            <?php
            for($i=0; $i<12; $i++)
            {
                if($i+1 != $month)
                {
                    ?>
                    <option value="<?=$i+1?>"><?=$months[$i]?></option>
                    <?php
                }
                else
                {
                    ?>
                    <option value="<?=$i+1?>" selected="selected"><?=$months[$i]?></option>
                    <?php    
                }
            }
            ?>
            </select>
            <select name="year">
            <?php
            for($i=$year-5; $i<$year; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$i?></option>
                <?php
            }
            ?>
            <option selected="selected"><?=$year?></option>
            </select><br />
            <h3>Семестр</h3>
            <select name="term">
            <option selected="selected" disabled="disabled">Выберите семестр</option>
            <?php
            for($k=1; $k<13; $k++)
            {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
            }
            ?>
            </select><br />
            <input type="submit" value="Добавить запись" class="button" />
            </form>
            <?php
            
        }
        if(isset($MODULE_OUTPUT["edit_mark"]))
        {
            $mark = $MODULE_OUTPUT["edit_mark"];
            $months = array("января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря");
            $year = date("Y");
            ?>
            <h2>Редактирование записи:</h2>
            <form method="post" name="edit_mark">
            <input type="hidden" name="mark_id" value="<?=$mark["id"]?>" />
            <h3>Названеи предмета:</h3>
            <select name="subject">
            <?php
            foreach($MODULE_OUTPUT["subjects"] as $subject)
            {
                if($subject["id"] == $mark["subject_id"])
                {
                    ?>
                    <option value="<?=$subject["id"]?>" selected="selected"><?=$subject["name"]?></option>
                    <?php
                }
                else
                {
                ?>
                <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                <?php
                }
            }
            ?>
            </select>
            <h3>Оценка (или отметка о зачете)</h3>
            <select name="mark">
            <?php
            for($k=2; $k<6; $k++)
            {
                if($mark["mark"]==$k)
                {
                    ?>
                    <option value="<?=$k?>" selected="selected"><?=$k?></option>
                    <?php
                }
                else
                {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
                }
            }
            if($mark["mark"]=="Зачтено")
            {
                ?>
                <option value="Зачтено" selected="selected">Зачтено</option>
                <option value="Не зачтено">Не зачтено</option>
                <?php
            }
            else
            {
              if($mark["mark"]=="Не зачтено")
              {
                    ?>
                    <option value="Зачтено">Зачтено</option>
                    <option value="Не зачтено" selected="selected">Не зачтено</option>
                    <?php
                }  
                else
                {
                    
                ?>
                <option value="Зачтено">Зачтено</option>
                <option value="Не зачтено">Не зачтено</option>
                <?php
                }
            }
            ?>
            </select>
            <h3>Дата:</h3>
            <select name="day">
            <?php
            for($i=1; $i<=31; $i++)
            {
                if($i != $mark["day"])
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></option>
                    <?php
                }
                else
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></option>
                    <?php
                }
            }
            ?>
            </select>
            <select name="month">
            <?php
            for($i=0; $i<12; $i++)
            {
                if($i+1 != $mark["month"])
                {
                    ?>
                    <option value="<?=$i+1?>"><?=$months[$i]?></option>
                    <?php
                }
                else
                {
                    ?>
                    <option value="<?=$i+1?>" selected="selected"><?=$months[$i]?></option>
                    <?php    
                }
            }
            ?>
            </select>
            <select name="year">
            <?php
            for($i=$year-10; $i<=$year; $i++)
            {
                if($i != $mark["year"])
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></option>
                    <?php
                }
                else
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></option>
                    <?php    
                }
            }
            ?>
            </select><br />
            <h3>Семестр</h3>
            <select name="term">
            <?php
            for($k=1; $k<13; $k++)
            {
                if($mark["term"]==$k)
                {
                    ?>
                    <option value="<?=$k?>" selected="selected"><?=$k?></option>    
                    <?php
                }
                else
                {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
                }
            }
            ?>
            </select>
            <br />
            <input type="submit" value="Сохранить данные" class="button" />
            </form>
            <?php
        }
        break;
    }
    
    case "timetable_subjects_by_departments":
    {
        if(isset($MODULE_OUTPUT["departments_list"]))
        {
            $id = 0;
            ?>
            <h2>Список кафедр по факультетам:</h2>            
            <ul>
            <?php
            foreach($MODULE_OUTPUT["departments_list"] as $department)
            {
                if($department["faculty_id"] != $id)
                {
                    ?>
                    </ul><li><?=$department["faculty_name"]?><ul>
                    <?php
                    $id = $department["faculty_id"];
                }
                ?>
                <li> <a href="show/<?=$department["id"]?>/"><?=$department["name"]?></a></li>
                <?php
            }
            ?>
            </ul>
            <?php   
        }
        $rate = array('0.25', '0.5', '0.75', '1.0', '1.25', '1.5');
        if(isset($MODULE_OUTPUT["show_mode"]) && $MODULE_OUTPUT["show_mode"]=="show")
        {
            if(isset($MODULE_OUTPUT["subjects_by_departments_list"]))
            {
                $department = str_replace("Кафедра", "Кафедры", $MODULE_OUTPUT["department_name"]);
                ?>
                <h1>Распределение дисциплин между ППС <?=$department?></h1>
                <table class="timetable">
                <tr class="table_top"><th rowspan="4"><img src="/themes/styles/delete.png"></th><th rowspan="4">Дисциплина</th><th rowspan="4">Ф-т</th><th rowspan="4">К<br />у<br/>р<br/>с</th>
                <th colspan="2">Ф.И.О. преподавателя</th><th colspan="2">В каких</th><th rowspan="4">№ ауд.</th>
                <th colspan="5">Дополнительные сведения о преподавателе</th><th rowspan="4">Примечания</th><th rowspan="4">С<br />т<br />а<br />в<br />к<br />а</th></tr>
                <tr class="table_top"><th rowspan="3">лекции</th><th rowspan="3">практики</th><th rowspan="3">группах</th>
                <th rowspan="3">подгруппах</th><th colspan="4">Участие в работе(день, пара)</th>
                <th rowspan="3">Ш<br />т<br />а<br />т<br />н<br />ы<br />й</th></tr>  
                <tr class="table_top">
                <th colspan="3">планерок</th>
                <th rowspan="2">ученого совета НГАУ</th>
                </tr>
                <tr class="table_top"><th><span title="ректорской">р</span></th><th><span title="проректорской">п</span></th><th><span title="деканатской">д</span></th></tr>
                <?php
                $i=0;
                foreach($MODULE_OUTPUT["subjects_by_departments_list"] as $data)
                {
                    $i++;
                    ?>
                    <tr>
                    <td><a href="delete/<?=$data["id"]?>/" onclick="return confirmSubmit()"><img src="/themes/styles/delete.png"></a></td><td><a href="edit/<?=$data["id"]?>/"><?=$data["subject"]?></a></td><td><span title="<?=$data["faculty"]?>"><?=$data["faculty_short"]?></span></td><td><?=$data["year"]?></td>
                    <?php
                    if(!$data["type"])
                    {
                        ?>
                        <td><?=$data["last_name"]?> <?=$data["name"]?> <?=$data["patronymic"]?></td><td>&nbsp;</td>
                        <?php
                    }
                    else
                    {
                        if($data["type"]==1)
                        {
                        ?>
                        <td>&nbsp;</td><td><?=$data["last_name"]?> <?=$data["name"]?> <?=$data["patronymic"]?></td>
                        <?php
                        }
                        else
                        {
                            ?>
                        <td><?=$data["last_name"]?> <?=$data["name"]?> <?=$data["patronymic"]?></td><td><?=$data["last_name"]?> <?=$data["name"]?> <?=$data["patronymic"]?></td>
                        <?php    
                        }
                    }
                    ?>
                    <td><?=$data["groups"]?></td><td><?=$data["subgroups"]?></td><td><?=$data["auditorium"]?></td>
                    <td>
                    <?php
                    if($data["rectors"])
                        echo "+";
                    else
                        echo "&nbsp;";
                    ?>
                    </td>
                    <td>
                    <?php
                    if($data["prorectors"])
                        echo "+";
                    else
                        echo "&nbsp;";
                    ?>
                    </td>
                    <td>
                    <?php
                    if($data["decanats"])
                        echo "+";
                    else
                        echo "&nbsp;";
                    ?>
                    </td>
                    <td>
                    <?php
                    if($data["academic_senate"])
                        echo "+";
                    else
                        echo "&nbsp;";
                    ?>
                    </td>
                    <td>
                    <?php
                    if($data["state"])
                        echo "+";
                    else
                        echo "&nbsp;";
                    ?>
                    </td>
                    <td><?=$data["comments"]?></td>
                    <td><?=$data["rate"]?></td>
                    </tr>
                    <?php
                }
                ?>
                </table>
                <?php
            }
            if(!isset($MODULE_OUTPUT["subjects_list"]))
            {
                ?>
                <h3>К выбранной кафедре не приписано предметов. Сначала добавьте предмет</h3>
                <?
            }
            if(isset($MODULE_OUTPUT["subjects_list"]))
            {
            ?>
            <h2>Добавить запись в распределение</h2>
            <form method="post" onsubmit="return sendform_sbd();">
            <h3>Выберите предмет:</h3>
            <select name="subject">
            <option value="0" selected="selected" disabled="disabled">Выберите предмет</option>
            <?php
                foreach($MODULE_OUTPUT["subjects_list"] as $subject)
                {
                    ?>
                    <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                    <?php
                }
            ?>
            </select>
            <h3>Выберите факультет</h3>
            <select name="faculty">
            <option value="0" selected="selected" disabled="disabled">Выберите факультет</option>
            <?php
                foreach($MODULE_OUTPUT["faculty_list"] as $faculty)
                {
                    ?>
                    <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                    <?php
                }
            ?>
            </select>
            <h3>Выберите курс:</h3>
            <select name="year">
            <?php
            for($i=1; $i<=6; $i++)
            {
                ?>
                <option value="<?=$i?>">Курс <?=$i?></option>
                <?php
            }
            ?>
            </select>
            <h3>Выберите преподавателя:</h3>
            <select name="teacher_id">
            <option value="0" selected="selected" disabled="disabled">Выберите преподавателя</option>
            <?php
            foreach($MODULE_OUTPUT["teachers_list"] as $teacher)
            {
                ?>
                <option value="<?=$teacher["id"]?>"><?=$teacher["last_name"]?> <?=$teacher["name"]?> <?=$teacher["patronymic"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>Лекции и (или) практики:</h3>
            <input type="radio" name="type" value="2" checked="checked"/>Лекции и практики<br />
            <input type="radio" name="type" value="0" />Лекции / Практики <input type="radio" name="type" value="1"/>
            <h3>В группах (группы вводятся через точку с запятой):</h3>
            <input type="text" name="groups" />
            <h3>В подгруппах (группы вводятся через точку с запятой):</h3>
            <input type="text" name="subgroups" />
            <h3>Номера аудиторий (вводятся через точку с запятой):</h3>
            <input type="text" name="auditorium" />
            <h3>Участие в работе планерок:</h3>
            <input type="checkbox" name="rectors" /> ректорской<br />
            <input type="checkbox" name="prorectors" /> проректорской<br />
            <input type="checkbox" name="decanats" /> деканатской<br />
            <input type="checkbox" name="academic_senate" />Участие в работе ученого совета НГАУ<br />
            <h3>Является ли штатным преподавателем:</h3>
            <input type="radio" name="state" value="0" />Нет / Да <input type="radio" name="state" value="1" checked="checked"/>
            <h3>Размер занимаемой ставки</h3>
            <select name="rate">
            <option selected="selected" value="0" disabled="disabled">Выберите размер занимаемой ставки</option>
            <?php
            foreach($rate as $r)
            {
                ?>
                <option value="<?=$r?>"><?=$r?></option>
                <?php
            }
            ?>
            </select>
            <h3>Добавить примечания:</h3>
            <input type="text" name="comments" />
            <br />
            <input type="submit" value="Добавить" class="button" />
            </form>
            <?php
            }
        }
        if(isset($MODULE_OUTPUT["show_mode"]) && $MODULE_OUTPUT["show_mode"]=="edit")
        {
            $data = $MODULE_OUTPUT["edit_row"];
            ?>
            <h2>Редактирование записи</h2>
            <form method="post" onsubmit="return sendform_sbd();">
            <input type="hidden" name="id" value="<?=$data["id"]?>">
            <h3>Выберите предмет:</h3>
            <select name="subject">
            <option value="0" selected="selected" disabled="disabled">Выберите предмет</option>
            <?php
                foreach($MODULE_OUTPUT["subjects_list"] as $subject)
                {
                    if($subject["id"] == $data["subject_id"])
                    {
                        ?>
                        <option selected="selected" value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                        <?php
                    }
                    else
                    {
                    ?>
                    <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                    <?php
                    }
                }
            ?>
            </select>
            <h3>Выберите факультет</h3>
            <select name="faculty">
            <option value="0" selected="selected" disabled="disabled">Выберите факультет</option>
            <?php
                foreach($MODULE_OUTPUT["faculty_list"] as $faculty)
                {
                    if($faculty["id"] == $data["faculty_id"])
                    {
                        ?>
                        <option selected="selected" value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                        <?php
                    }
                    else
                    {
                    ?>
                    <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                    <?php
                    }
                }
            ?>
            </select>
            <h3>Выберите курс:</h3>
            <select name="year">
            <?php
            for($i=1; $i<=6; $i++)
            {
                if($i == $data["year"])
                    {
                        ?>
                        <option selected="selected" value="<?=$i?>">Курс <?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i?>">Курс <?=$i?></option>
                        <?php
                    }
            }
            ?>
            </select>
            <h3>Выберите преподавателя:</h3>
            <select name="teacher_id">
            <option value="0" selected="selected">Выберите преподавателя</option>
            <?php
            foreach($MODULE_OUTPUT["teachers_list"] as $teacher)
            {
                if($teacher["id"] == $data["teacher_id"])
                    {
                        ?>
                        <option selected="selected" value="<?=$teacher["id"]?>"><?=$teacher["last_name"]?> <?=$teacher["name"]?> <?=$teacher["patronymic"]?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$teacher["id"]?>"><?=$teacher["last_name"]?> <?=$teacher["name"]?> <?=$teacher["patronymic"]?></option>
                        <?php
                    }
            }
            ?>
            </select>
            <h3>Лекции и (или) практики:</h3>
            <?php
            if(!$data["type"])
            {
                ?>
                <input type="radio" name="type" value="2"/>Лекции и практики<br />
                <input type="radio" name="type" value="0" checked="checked"/>Лекции / Практики <input type="radio" name="type" value="1"/>
                <?php
            }
            else
            {
                if($data["type"] == 1)
                {
                    ?>
                    <input type="radio" name="type" value="2"/>Лекции и практики<br />
                    <input type="radio" name="type" value="0" />Лекции / Практики <input type="radio" name="type" value="1" checked="checked"/>
                    <?php
                }
                else
                {
                    ?>
                    <input type="radio" name="type" value="2" checked="checked"/>Лекции и практики<br />
                    <input type="radio" name="type" value="0" />Лекции / Практики <input type="radio" name="type" value="1"/>
                    <?php
                }
            }
            ?>
            <h3>В группах (группы вводятся через точку с запятой):</h3>
            <input type="text" name="groups" value="<?=$data["groups"]?>"/>
            <h3>В подгруппах (группы вводятся через точку с запятой):</h3>
            <input type="text" name="subgroups" value="<?=$data["subgroups"]?>" />
            <h3>Номера аудиторий (вводятся через точку с запятой):</h3>
            <input type="text" name="auditorium" value="<?=$data["auditorium"]?>" />
            <h3>Участие в работе планерок:</h3>
            <input type="checkbox" name="rectors" <?php if($data["participation_rectors"]) {?> checked="checked" <?php } ?> /> ректорской<br />
            <input type="checkbox" name="prorectors" <?php if($data["participation_prorectors"]) {?> checked="checked" <?php } ?>/> проректорской<br />
            <input type="checkbox" name="decanats" <?php if($data["participation_decanats"]) {?> checked="checked" <?php } ?>/> деканатской<br />
            <input type="checkbox" name="academic_senate" <?php if($data["participation_academic_senate"]) {?> checked="checked" <?php } ?>/>Участие в работе ученого совета НГАУ<br />
            <h3>Является ли штатным преподавателем:</h3>
            <?php
            if($data["state"])
            {
                ?>
                <input type="radio" name="state" value="0" />Нет / Да <input type="radio" name="state" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="state" value="0" checked="checked"/>Нет / Да <input type="radio" name="state" value="1"/>
                <?php    
            }
            ?>
            <h3>Размер занимаемой ставки</h3>
            <select name="rate">
            
            <?php
            foreach($rate as $r)
            {
                if($r == $data["rate"])
                {
                    ?>
                    <option selected="selected" value="<?=$r?>"><?=$r?></option>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$r?>"><?=$r?></option>
                    <?php
                }
            }
            ?>
            </select>
            <h3>Примечания:</h3>
            <input type="text" name="comments" value="<?=$data["comments"]?>"/><br />
            <input type="submit" value="Сохранить" class="button" />
            </form>
            <?php    
        }
        break;
    }

    case "timetable_graphics":
    {
        $month = array("Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь");
        $months = array("Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря");
        if(isset($MODULE_OUTPUT["calendar"]))
        {
            ?>
            <a href="<?=$MODULE_OUTPUT["calendar"]["back_link"]?>">Вернуться к просмотру графика</a>
            <h2>Редактирование календаря</h2>
            <form method="post">
            <table class="graphics_table">
            <tr class="table_top"><th rowspan="2">№ недели</th><th colspan="3">Дата начала недели</th><th colspan="3">Дата конца недели</th></tr>
            <tr class="table_top"><th>День</th><th>Месяц</th><th>Год</th><th>День</th><th>Месяц</th><th>Год</th></tr>
            <?php
            $year = date("Y");
            foreach($MODULE_OUTPUT["calendar_data"] as $data)
            {
                $date = explode("-",$data["begin_date"]);
                ?>
                <tr><td><?=$data["num_week"]?></td>
                <td>
                <input type="hidden" name="begin_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="begin_date[<?=$data["num_week"]?>][day]">
                <?php
                for($i=1; $i<=31; $i++)
                {
                    if($i != $date[2])
                    {
                        ?>
                        <option value="<?=$i?>"><?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i?>" selected="selected"><?=$i?></option>
                        <?php
                    }
                }
                ?>
                </select>
                </td>
                <td>
                <input type="hidden" name="begin_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="begin_date[<?=$data["num_week"]?>][month]">
                <?php
                for($i=0; $i<12; $i++)
                {
                    if($i+1 != $date[1])
                    {
                        ?>
                        <option value="<?=$i+1?>"><?=$month[$i]?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i+1?>" selected="selected"><?=$month[$i]?></option>
                        <?php    
                    }
                }
                ?>
                </select>
                </td>
                <td>
                <input type="hidden" name="begin_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="begin_date[<?=$data["num_week"]?>][year]">
                <?php
                for($i=$year-2; $i<$year+3; $i++)
                {
                    if($i != $date[0])
                    {
                        ?>
                        <option value="<?=$i?>"><?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option selected="selected" value="<?=$i?>"><?=$i?></option>
                        <?php    
                    }
                }
                ?>
                </select>
                </td>
                <?php
                $date_end = explode("-",$data["end_date"]);
                ?>
                <td>
                <input type="hidden" name="end_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="end_date[<?=$data["num_week"]?>][day]">
                <?php
                for($i=1; $i<=31; $i++)
                {
                    if($i != $date_end[2])
                    {
                        ?>
                        <option value="<?=$i?>"><?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i?>" selected="selected"><?=$i?></option>
                        <?php
                    }
                }
                ?>
                </select>
                </td>
                <td>
                <input type="hidden" name="end_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="end_date[<?=$data["num_week"]?>][month]">
                <?php
                for($i=0; $i<12; $i++)
                {
                    if($i+1 != $date_end[1])
                    {
                        ?>
                        <option value="<?=$i+1?>"><?=$month[$i]?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i+1?>" selected="selected"><?=$month[$i]?></option>
                        <?php    
                    }
                }
                ?>
                </select>
                </td>
                <td>
                <input type="hidden" name="end_date[<?=$data["num_week"]?>][num_week]" value="<?=$data["num_week"]?>"/>
                <select name="end_date[<?=$data["num_week"]?>][year]">
                <?php
                for($i=$year-2; $i<$year+3; $i++)
                {
                    if($i != $date_end[0])
                    {
                        ?>
                        <option value="<?=$i?>"><?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option selected="selected" value="<?=$i?>"><?=$i?></option>
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
            <input type="submit" value="Сохранить" class="button" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_list"]))
        {
            ?>
            <h1>Список графиков:</h1>
            <?php
            $i=-1;
            foreach($MODULE_OUTPUT["graphics_list"] as $graphic)
            {
                if($i==0 && $graphic["type"])
                {
                    ?>
                    <h3>Графики для заочников</h3>
                    <?php
                    $i++;
                }
                if($i<0)
                {
                    ?>
                    <h3>Графики для очников</h3>
                    <?php
                    $i++;
                }
                ?>
                <p><a href="<?=$graphic["id"]?>/"><?=$graphic["name"]?></a> [<a href="edit/<?=$graphic["id"]?>/">Редактировать</a>][<a href="delete/<?=$graphic["id"]?>/" onclick="return confirmSubmit()">Удалить</a>]</p>
                <?php
            }
            ?>
            <h2>Добавить график</h2>
            <form method="post">
            <h3>Название графика:</h3>
            <input name="name" size="50" type="text"/><br />
            <h3>Очники или заочники:</h3>
            <input type="radio" name="type" value="0" checked="checked"/> Очники / Заочники <input type="radio" name="type" value="1"/>
            <h3>Дата начала сессии:</h3>
            <select name="begin_day">
            <option value="0" selected="selected">День</option>
            <?php
            for($i=1; $i<=31; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$i?></optino>
                <?php
            }
            ?>
            </select>
            <select name="begin_month">
            <option value="0" selected="selected">Месяц</option>
            <?php
            for($i=0; $i<=11; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$months[$i]?></optino>
                <?php
            }
            ?>
            </select>
            <select name="begin_year">
            <option value="0" selected="selected">Год</option>
            <?php
            $year=date("Y");
            for($i=$year-5; $i<=$year+5; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$i?></optino>
                <?php
            }
            ?>
            </select>
            <br />
            <h3>Дата окончания сессии:</h3>
            <select name="end_day">
            <option value="0" selected="selected">День</option>
            <?php
            for($i=1; $i<=31; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$i?></optino>
                <?php
            }
            ?>
            </select>
            <select name="end_month">
            <option value="0" selected="selected">Месяц</option>
            <?php
            for($i=0; $i<=11; $i++)
            {
                ?>
                <option value="<?=$i+1?>"><?=$months[$i]?></optino>
                <?php
            }
            ?>
            </select>
            <select name="end_year">
            <option value="0" selected="selected">Год</option>
            <?php
            $year=date("Y");
            for($i=$year-5; $i<=$year+5; $i++)
            {
                ?>
                <option value="<?=$i?>"><?=$i?></optino>
                <?php
            }
            ?>
            </select>
            <br />
            <input value="Добавить" type="submit" class="button"/>
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_list_data"]))
        {
            $data = $MODULE_OUTPUT["graphics_list_data"];
            ?>
            <h2>Редактирование иинформации о графике:</h2>
            <form method="post">
            <h3>Назваение графика:</h3>
            <input name="name" type="text" size="50" value="<?=$data["name"]?>"/> <br />
            <h3>Очники или заочники:</h3>
            <?php
            if($data["type"])
            {
                ?>
                <input type="radio" name="type" value="0"/> Очники / Заочники <input type="radio" name="type" value="1" checked="checked"/>    
                <?php
            }
            else
            {
            ?>
            <input type="radio" name="type" value="0" checked="checked"/> Очники / Заочники <input type="radio" name="type" value="1"/>
            <?php
            }
            $begin_date = explode("-",$data["begin_session"]);
            $end_date = explode("-",$data["end_session"]);
            ?>
            <h3>Дата начала сессии:</h3>
            <select name="begin_day">
            <option value="0" selected="selected">День</option>
            <?php
            for($i=1; $i<=31; $i++)
            {
                if($begin_date[2]==$i)
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <select name="begin_month">
            <option value="0" selected="selected">Месяц</option>
            <?php
            for($i=0; $i<=11; $i++)
            {
                if($begin_date[1] == $i+1)
                {
                    ?>
                    <option value="<?=$i+1?>" selected="selected"><?=$months[$i]?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i+1?>"><?=$months[$i]?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <select name="begin_year">
            <option value="0" selected="selected">Год</option>
            <?php
            $year=date("Y");
            for($i=$year-5; $i<=$year+5; $i++)
            {
                if($begin_date[0] == $i)
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <br />
            <h3>Дата окончания сессии:</h3>
            <select name="end_day">
            <option value="0" selected="selected">День</option>
            <?php
            for($i=1; $i<=31; $i++)
            {
                if($end_date[2] == $i)
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <select name="end_month">
            <option value="0" selected="selected">Месяц</option>
            <?php
            for($i=0; $i<=11; $i++)
            {
                if($end_date[1] == $i+1)
                {
                    ?>
                    <option value="<?=$i+1?>" selected="selected"><?=$months[$i]?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i+1?>"><?=$months[$i]?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <select name="end_year">
            <option value="0" selected="selected">Год</option>
            <?php
            $year=date("Y");
            for($i=$year-5; $i<=$year+5; $i++)
            {
                if($end_date[0] == $i)
                {
                    ?>
                    <option value="<?=$i?>" selected="selected"><?=$i?></optino>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$i?>"><?=$i?></optino>
                    <?php
                }
            }
            ?>
            </select>
            <br />
            <input type="submit" value="Сохранить изменения" class="button">
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_data"]))
        {
            ?>
            <h2>Просмотр графика <?=$MODULE_OUTPUT["g_name"]?></h2>
            <a href="calendar/">Календарь</a>
            <?php                                       
            if(!empty($MODULE_OUTPUT["begin_session"]) && !empty($MODULE_OUTPUT["end_session"]))
            {
                $begin_date = explode("-",$MODULE_OUTPUT["begin_session"]);
                $end_date = explode("-",$MODULE_OUTPUT["end_session"]);
                ?>
                <h4><a href="<?=$MODULE_OUTPUT["uri"]?>edit/<?=$MODULE_OUTPUT["g_id"]?>/">Сессия: с <?=$begin_date[2]?>/<?=$begin_date[1]?><?=$begin_date[0]?> по <?=$end_date[2]?>/<?=$end_date[1]?>/<?=$end_date[0]?></a></h4>
                <?php
            }
            if(!$MODULE_OUTPUT["g_type"])
            {
            ?>
            <form name="graphics" method="post">
            <table class="graphics_table">
            <tr class="table_top"><th>Кафедра</th><th>Ф-тет</th><th>Предмет</th><th><img src="/gen_ru_img.php?text=№№ групп&width=100"></th><th><img src="/gen_ru_img.php?text=Кол-во студентов&width=200"></th>
            <th>Вид занятия</th><th class="groups"><img src="/gen_ru_img.php?text=Кол-во гр.,подгр.&width=200"></th><th>В<br />с<br />е<br />г<br />о<br /><br />ч<br />а<br />с<br />о<br />в</th>
            <?php

            foreach($MODULE_OUTPUT["dates"] as $week)
            {
                if($week["num_week"]>17)
                {
                    break;
                }
                $date1 = explode("-",$week["begin_date"]);
                $date2 = explode("-",$week["end_date"]);
                $m1 = $date1[1] + 0;
                $m2 = $date2[1] +0;
                $text = $date1[2]." - ".$date2[2];
                ?>
                <th><span title="<?=$month[$m2-1]?>"><img src="/gen_img.php?text=<?=$text?>"></span><br /><?=$week["num_week"]?><br /><br /><?=($week["num_week"]+1)%2+1?></th>
                <?php
            }
            ?>
            <th>З<br />а<br />ч<br />е<br />т<br />о<br />в</th><th>Э<br />к<br />з<br />а<br />м<br />е<br />н<br />о<br />в</th>
            </tr>
            <?php
            foreach($MODULE_OUTPUT["graphics_data"] as $data)
            {
                $department = str_replace("Кафедра ", "", $data["department_name"]);
                ?>
                <tr>
                <td rowspan="2"><a href="edit/<?=$data["id_graphic"]?>/"><?=$department?></a></td><td rowspan="2"><span title="<?=$data["faculty_name"]?>"><?=$data["faculty_short_name"]?></span></td>
                <td rowspan="2"><?=$data["subject_name"]?><br /><span title="Удалить"><a href="delete/<?=$data["id_graphic"]?>/" onclick="return confirmSubmit()"><img src="/themes/styles/delete.png"></a></span></td>
                <td rowspan="2">
                <?php
                foreach($data["groups"] as $group)
                {
                    echo $group["group_name"]."; ";
                }
                ?>
                </td>
                <td rowspan="2"><?=$data["sum_students"]?></td>
                <td colspan="2">Лек</td><td><?=$data["lecture_hours"]?></td>
                <input type="hidden" name="<?=$data["id_graphic"]?>[name]" value="<?=$data["id_graphic"]?>">
                <?php
                $i=1;
                if(!empty($data["lect"]))
                {
                foreach($data["lect"] as $lect)
                {
                    while($lect["week_num"]!=$i && $i<18)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" /></td>
                        <?php
                        $i++; 
                    }
                    if($lect["week_num"]==$i)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" value="<?=$lect["hours_per_week"]?>" /></td>
                        <?php
                    }
                    $i++;        
                }
                }
                while($i<18)
                {
                    ?>
                    <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" /></td>
                    <?php
                    $i++;    
                }
                if($data["attestation_type"])
                {
                ?>
                <td rowspan="2">+</td><td rowspan="2">&nbsp;</td>
                <?php
                }
                else
                {
                ?>
                <td rowspan="2">&nbsp;</td><td rowspan="2">+</td>
                <?php
                }
                ?>
                </tr>
                <tr>
                <td>
                <?php
                if(!$data["type"])
                {
                    echo "Групп";
                }
                else
                {
                    echo "Подгр";
                }
                ?> </td>
                <td><?=$data["kol_groups"]?></td>
                <td><?=$data["practice_hours"]?></td>
                <?php
                $i=1;
                foreach($data["pr"] as $lect)
                {
                    while($lect["week_num"]!=$i && $i<18)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" /></td>
                        <?php
                        $i++; 
                    }
                    if($lect["week_num"]==$i)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" value="<?=$lect["hours_per_week"]?>" /></td>
                        <?php
                    }
                    $i++;        
                }
                while($i<18)
                {
                    ?>
                    <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" /></td>
                    <?php
                    $i++;    
                }
                ?>
                </tr>
                <?php
            }
            ?>
            </table>
            <input type="submit" value="Сохранить изменения" class="button" />
            </form>
            <?php
            }
            else
            {
                ?>
                <form name="graphics" method="post">
                <table class="graphics_table">
                <tr class="table_top"><th>Кафедра</th><th>Предмет</th><th><img src="/gen_ru_img.php?text=№№ групп&width=100"></th><th><img src="/gen_ru_img.php?text=Кол-во студентов&width=200"></th>
                <th>Вид занятия</th><th class="groups"><img src="/gen_ru_img.php?text=Кол-во гр.,подгр.&width=200"></th><th>В<br />с<br />е<br />г<br />о<br /><br />ч<br />а<br />с<br />о<br />в</th>
                <th>УЛ</th><th>УП</th>    
                <?php

                foreach($MODULE_OUTPUT["dates"] as $week)
                {
                    if($week["num_week"]>17)
                    {
                        break;
                    }
                    $date1 = explode("-",$week["begin_date"]);
                    $date2 = explode("-",$week["end_date"]);
                    $m1 = $date1[1] + 0;
                    $m2 = $date2[1] + 0;
                    $text = $date1[2]." - ".$date2[2];
                    ?>
                    <th><span title="<?=$month[$m2-1]?>"><img src="/gen_img.php?text=<?=$text?>"></span><br /><?=$week["num_week"]?><br /><br /><?=($week["num_week"]+1)%2+1?></th>
                    <?php
                }
                ?>
                <th>К<br />о<br />н<br />т<br />р.</th><th>К<br />у<br />р<br />с.</th>
                <th>З<br />а<br />ч<br />е<br />т<br />о<br />в</th><th>Э<br />к<br />з<br />а<br />м<br />е<br />н<br />о<br />в</th>
                </tr>
                <?php
            foreach($MODULE_OUTPUT["graphics_data"] as $data)
            {
                $department = str_replace("Кафедра ", "", $data["department_name"]);
                ?>
                <tr>
                <td rowspan="2"><a href="edit/<?=$data["id_graphic"]?>/"><?=$department?></a></td>
                <td rowspan="2"><?=$data["subject_name"]?><br /><span title="Удалить"><a href="delete/<?=$data["id_graphic"]?>/" onclick="return confirmSubmit()"><img src="/themes/styles/delete.png"></a></span></td>
                <td rowspan="2">
                <?php
                foreach($data["groups"] as $group)
                {
                    echo $group["group_name"]."; ";
                }
                ?>
                </td>
                <td rowspan="2"><?=$data["sum_students"]?></td>
                <td colspan="2">Лек</td><td><?=$data["lecture_hours"]?></td>
                <td rowspan="2"><?=$data["ust_lecture"]?></td>
                <td rowspan="2"><?=$data["ust_practice"]?></td>
                <input type="hidden" name="<?=$data["id_graphic"]?>[name]" value="<?=$data["id_graphic"]?>">
                <?php
                $i=1;
                if(!empty($data["lect"]))
                {
                foreach($data["lect"] as $lect)
                {
                    while($lect["week_num"]!=$i && $i<18)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" /></td>
                        <?php
                        $i++; 
                    }
                    if($lect["week_num"]==$i)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" value="<?=$lect["hours_per_week"]?>" /></td>
                        <?php
                    }
                    $i++;        
                }
                }
                while($i<18)
                {
                    ?>
                    <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[l][<?=$i?>]" /></td>
                    <?php
                    $i++;    
                }
                if($data["Contr"])
                {
                    ?>
                    <td rowspan="2">+</td>
                    <?php
                }
                else
                {
                    ?>
                    <td rowspan="2">&nbsp;</td>
                    <?php    
                }
                if($data["Curse"])
                {
                    ?>
                    <td rowspan="2">+</td>
                    <?php
                }
                else
                {
                    ?>
                    <td rowspan="2">&nbsp;</td>
                    <?php    
                }
                if($data["attestation_type"])
                {
                ?>
                <td rowspan="2">+</td><td rowspan="2">&nbsp;</td>
                <?php
                }
                else
                {
                ?>
                <td rowspan="2">&nbsp;</td><td rowspan="2">+</td>
                <?php
                }
                ?>
                </tr>
                <tr>
                <td>
                <?php
                if(!$data["type"])
                {
                    echo "Групп";
                }
                else
                {
                    echo "Подгр";
                }
                ?> </td>
                <td><?=$data["kol_groups"]?></td>
                <td><?=$data["practice_hours"]?></td>
                <?php
                $i=1;
                foreach($data["pr"] as $lect)
                {
                    while($lect["week_num"]!=$i && $i<18)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" /></td>
                        <?php
                        $i++; 
                    }
                    if($lect["week_num"]==$i)
                    {
                        ?>
                        <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" value="<?=$lect["hours_per_week"]?>" /></td>
                        <?php
                    }
                    $i++;        
                }
                while($i<18)
                {
                    ?>
                    <td><input type="text" size="1" style="width: 1em;" name="<?=$data["id_graphic"]?>[p][<?=$i?>]" /></td>
                    <?php
                    $i++;    
                }
                ?>
                </tr>
                <?php
            }
            ?>
                </table>
                <input type="submit" value="Сохранить изменения" class="button"/>
                </form>
            <?php
            }
            ?>
            <h2>Добавить новую запись в график</h2>
            <form method="post" name="new_graphic" onsubmit=" return sendform_graphics();">
            <h3>Выберите предмет</h3>
            <select name="subject_id">
            <option value="0" selected="selected" disabled="disabled">Выберите предмет</option>
            <?php
            $j=0;
            foreach($MODULE_OUTPUT["subjects"] as $subject)
            {
                if(!$j)
                {
                    ?>
                    <optgroup label="<?=$subject["department_name"]?> (<?=$subject["faculty_short_name"]?>)">
                    <?php
                    $j = $subject["department_id"];
                }
                else
                {
                    if($j != $subject["department_id"])
                    {
                        $j = $subject["department_id"];
                        ?>
                        </optgroup>
                        <optgroup label="<?=$subject["department_name"]?> (<?=$subject["faculty_short_name"]?>)">
                        <?php
                    }
                }
                ?>
                <option value="<?=$subject["subject_id"]?>"><?=$subject["subject_name"]?></option>
                <?php
            }
            ?>
            </optgroup>
            </select>
            <h3>Введите номера групп (после каждой группы ставится точку с запятой):</h3>
            <input name="groups" />
            <h3>Тип занятия:</h3>
            <input type="radio" value="0" checked="checked" name="type" /> Групповое / Подгрупповое
            <input type="radio" value="1" name="type" />
            <h3>Количество групп (или подгрупп, если занятия подгрупповые)</h3>
            <input type="text" name="kol_groups" / value="1">
            <h3>Количество часов за семестр:</h3>
            <input type="text" name="lecture_hours" value="0"/> лекционных<br />
            <input type="text" name="practice_hours" value="0"/> практических занятий
            <?php
            if($MODULE_OUTPUT["g_type"])
            {
            ?>
            <h3>Количество установочных занятий:</h3>
            <input type="text" name="ust_lecture" value="0"/> Установочные лекции (УЛ)<br />
            <input type="text" name="ust_practice" value="0"/> Установочные практики (УП)
            <h3>Отметить, если есть:</h3>
            <input type="checkbox" name="Contr"> Контрольные <br />
            <input type="checkbox" name="Curse"> Курсовые <br />
            <?php
            }
            ?>
            <h3>Выберите тип аттестации:</h3>
            <input type="radio" value="0" checked="checked" name="attestation_type" /> Экзамен / Зачет
            <input type="radio" value="1" name="attestation_type" /> <br />
            <input type="submit" value="Добавить запись" class="button" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["edit_graphic"]))
        {
            $data = $MODULE_OUTPUT["edit_graphic"];
            ?>
            <h2>Редактирование графика <?=$data["g_name"]?></h2>
            <form method="post" onsubmit=" return sendform_graphics();">
            <h3>Предмет:</h3>
            <select name="subject_id">
            <?php
            $j=0;
            foreach($MODULE_OUTPUT["subjects"] as $subject)
            {
                if(!$j)
                {
                    ?>
                    <optgroup label="<?=$subject["department_name"]?> (<?=$subject["faculty_short_name"]?>)">
                    <?php
                    $j = $subject["department_id"];
                }
                else
                {
                    if($j != $subject["department_id"])
                    {
                        $j = $subject["department_id"];
                        ?>
                        </optgroup>
                        <optgroup label="<?=$subject["department_name"]?> (<?=$subject["faculty_short_name"]?>)">
                        <?php
                    }
                }
                if($data["subject_id"] == $subject["subject_id"])
                {
                    ?>
                    <option selected="selected" value="<?=$subject["subject_id"]?>"><?=$subject["subject_name"]?></option>
                    <?php    
                }
                else
                {
                    ?>
                    <option value="<?=$subject["subject_id"]?>"><?=$subject["subject_name"]?></option>
                    <?php
                }
            }
            ?>
            </optgroup>
            </select>
            <h3>Номера групп:</h3>
            <?php
            $groups_list=null;
            foreach($data["groups"] as $group)
            {
                $groups_list = $groups_list.$group["group_name"].";";
            }
            ?>
            <input type="text" name="groups" value="<?=$groups_list?>" />
            <h3>Тип занятия:</h3>
            <?php
            if($data["type"])
            {
                ?>
                <input type="radio" name="type" value="0" /> Групповое / Подгрупповое <input type="radio" name="type" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="type" value="0" checked="checked"/> Групповое / Подгрупповое <input type="radio" name="type" value="1"/>
                <?php
            }
            ?>
            <h3>Количество групп (или подгрупп, если занятия подгрупповые):</h3>
            <input type="text" name="kol_groups" value="<?=$data["kol_groups"]?>" />
            <h3>Количество часов за семестр:</h3>
            <input type="text" name="lecture_hours" value="<?=$data["lecture_hours"]?>" /> лекционных<br />
            <input type="text" name="practice_hours" value="<?=$data["practice_hours"]?>" />практических
            <?php
            if($data["g_type"])
            {
            ?>
            <h3>Количество установочных занятий:</h3>
            <input type="text" name="ust_lecture" value="<?=$data["ust_lecture"]?>"/> Установочные лекции (УЛ)<br />
            <input type="text" name="ust_practice" value="<?=$data["ust_practice"]?>"/> Установочные практики (УП)
            <h3>Отметить, если есть:</h3>
            <?php
            if($data["Contr"])
            {
                ?>
                <input type="checkbox" name="Contr" checked="checked"> Контрольные <br />
                <?php
            }
            else
            {
                ?>
                <input type="checkbox" name="Contr"> Контрольные <br />
                <?php
            }
            if($data["Curse"])
            {
                ?>
                <input type="checkbox" name="Curse" checked="checked"> Курсовые <br />
                <?php
            }
            else
            {
                ?>
                <input type="checkbox" name="Curse"> Курсовые <br />
                <input type="checkbox" name="Curse"> Курсовые <br />
                <?php
            }
            ?>
            <?php
            }
            ?>
            <h3>Выберите тип аттестации:</h3>
            <?php
            if($data["attestation_type"])
            {
                ?>
                <input type="radio" name="attestation_type" value="0" /> Экзамен / Зачет <input type="radio" name="attestation_type" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="attestation_type" value="0" checked="checked"/> Экзамен / Зачет <input type="radio" name="attestation_type" value="1"/>
                <?php
            }
            ?>
            <br />
            <input type="submit" value="Сохранить изменения" class="button" />
            </form>
            <?php
        }
        break;
    }
}

?>