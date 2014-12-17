<?php

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
    echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
    echo "<p class=\"message red\">$data</p>\n";
}

$MODULE_OUTPUT = $MODULE_DATA["output"]; 

    switch ($MODULE_OUTPUT["mode"])
    {
        case "graduaties":
            ?><h2>Выпускники</h2>
            <?php if ($MODULE_OUTPUT["show_manage"]==1)
                  {?>
            <a href="add/"><b>Добавить выпускника</b></a><br/>
            <?php }
            
            if (!empty($MODULE_OUTPUT["graduaties"]))
            {
                ?><table cellpadding="0" cellspacing="3" border="0" width="100%"><?php
                ?><tr bgcolor="#BBBBBB"><th>ФИО</th><th>Образование</th><th>Форма обучения</th><th>Диплом</th><th>Опыт работы</th></tr><?php 
            
                $i = 0;
                $manage = "";
                foreach ($MODULE_OUTPUT["graduaties"] as $grad) 
                {
                    if ($i%2)
                        $bgcolor = " bgcolor=\"#EEEEEE\"";
                    else
                        $bgcolor = "";
                    ?><tr align="center" <?=$bgcolor?> >
                    <td align="left"><?=$grad["last_name"]?>&nbsp;<?=$grad["name"]?>&nbsp;<?=$grad["patronymic"]?>
                    </br>
                    <?php if ($MODULE_OUTPUT["show_manage"]){
                        ?><br/><a href="edit/<?=$grad["id_people"]?>/"><font size="1pt">Редактировать</font></a>&nbsp;<a href="delete/<?=$grad["id_people"]?>/" onclick="if (!confirm('Удалить выпускника?')) return false;" ><font size="1pt">Удалить</font></a>
                    <?php } ?> 
                    </td>
                    <td ><font size="1pt">Факультет: <?=$grad["name_ft"]?><br>Специальность: <?=$grad["name_st"]?>, Год выпуска: <?=$grad["year_out"]?></font></td>
                    <?php if($grad["type_tuition"]==1) 
                    {
                        ?><td>очная</td><?php
                    }
                    else    
                    {
                        ?><td>заочная</td><?php 
                    }?>
                    <td>Средний балл по диплому:<?=$grad["average_grades"]?> <br><?=$grad["theme"]?></td>
                    <td><?=$grad["operational_experience"]?></td>
                    </tr><?php
                    $i++;
                }
                ?></table><?php
            }
            else
            {
                ?><p>Информация о выпускниках универсистета отсутствует</p><?php
            }
            
        $pager_output = $MODULE_OUTPUT["pager_output"];
        
        if (count($pager_output["pages_data"]) > 1) // если есть что выводить, и страниц больше одной
        {
            echo "<div class=\"pager\">\n";
            
            if($pager_output["prev_page"])
            {
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["prev_page"]]["link"]}\" title=\"Предыдущая страница\"";
                echo " id=\"prev_page_link\" class=\"prev-next-link\"><span class=\"arrow\">&larr;&nbsp;</span>";
                echo $pager_output["prev_page"] ? "</a>" : "</span>";
                echo " ";
            }

            foreach ($pager_output["pages_data"] as $page => $data)
            {
                if (is_int($page))
                {
                    echo ($data["is_current"] ? "<strong>" : "<a href=\"{$data["link"]}\">") . $page . ($data["is_current"] ? "</strong>" : "</a>") . " ";
                }

                else
                {
                    echo "&hellip; ";
                }
            }

            if ($pager_output["next_page"])
            {
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["next_page"]]["link"]}\" title=\"Следующая страница\"";
                echo " id=\"next_page_link\" class=\"prev-next-link\">". "<span class=\"arrow\">&nbsp;&rarr;</span>";
                echo "</a>";
            }
            echo "    </p>\n";
            echo "</div>\n";    
        }
        break;
        
        case "graduaties_edit":
        ?>
        <h2>Редактирование данных выпускника</h2> <br/>
        <form action="<?=$EE["unqueried_uri"]?>" method="post">
        <?php foreach($MODULE_OUTPUT["graduaty_edit_view"] as $edit_view)
        {  ?>
            ФИО: <?=$edit_view["last_name"]?> <?=$edit_view["name"]?> <?=$edit_view["patronymic"]?> <br>
            Пол: <?php if ($edit_view["male"]==1)
            {
               ?>Мужской<?php 
            }
            else{
                ?>Женский<?php
            
            }  ?> <br>
            Факультет: <?=$edit_view["faculty"]?> <br>
            Группа: <?=$edit_view["group"]?> <br>  
            Специальность: <?=$edit_view["spec"]?> <br> <br>  
        
        <?php }
        foreach($MODULE_OUTPUT["graduaties_edit"] as $edit)
        {
            
        ?>
        <input type="hidden" name="id" value="<?=$edit["id_people"]?>">
        <h6>Форма обучения:</h6>
        <select name="edit_type_tuition" style="width:42%">
        <?php if($edit["type_tuition"]==1)
        {?>
            <option value="1" selected="selected">очная</option>
            <?php 
        }else {?>         
            <option value="0" selected="selected">заочная</option>
        <?php } ?>
        <option disabled="disabled">-----------------</option>
        <option value="0">заочная</option>
        <option value="1">очная</option>
        </select><br/><br/> 
        
        <b>Средний балл по диплому:   <b> 
        <input type="text" name="edit_average_grades" value="<?=$edit["average_grades"]?>" style="text-align:right;" ></input><br/><br/> 
        
        <h6>Тема дипломной работы:</h6>
        <input type="text" name="edit_theme" value="<?=$edit["theme"]?>" style="width:42%"></input>
        <?php } ?>
        <br/><br/>
        <h6>Год выпуска:</h6> 
        <input type="text" name="edit_year_out" value="<?=$edit["year_out"]?>" style="text-align:left;" ></input><br/><br/>
        <h6>Семейное положение:</h6>  
        <select name="edit_marital_status">
        <?php if($edit["marital_status"]==1)
        {?>
            <option value="1" selected="selected">Женат/Замужем</option>
            <?php 
        }else {?>         
            <option value="0" selected="selected">Холост/Не замужем</option>
        <?php } ?>
        <option disabled="disabled">-----------------</option>  
        <option value="0">Холост/Не замужем</option>
        <option value="1">Женат/Замужем</option> 
        </select><br/><br/>
        <h6>Район проживания по прописке:</h6> 
        <input type="text" name="edit_residence" value="<?=$edit["residence"]?>" style="text-align:left;" ></input><br/><br/>
        <h6>Опыт работы:</h6>  
        <textarea name="edit_operational_experience" ><?=$edit["operational_experience"]?></textarea><br/><br/>
        <h6>Дополнительные сведения:</h6> 
        <textarea name="edit_additional_information" ><?=$edit["additional_information"]?></textarea><br/><br/>
        <h6>Желаемый график работы:</h6> 
        <select name="edit_operating_schedule">
        <?php if($edit["operating_schedule"]==1)
        {?>
            <option value="1" selected="selected">Полный рабочий день</option>
            <?php 
        }elseif ($edit["operating_schedule"]==0) {?>         
            <option value="0" selected="selected">Не важно</option>
        <?php 
        }elseif ($edit["operating_schedule"]==2) {?>         
            <option value="0" selected="selected">Неполный рабочий день</option>
        <?php  
        }elseif ($edit["operating_schedule"]==3) {?>         
            <option value="0" selected="selected">Свободный график</option>
        <?php }?>
        <option disabled="disabled">-----------------</option>  
        <option value="0">Не важно</option>
        <option value="1">Полный рабочий день</option> 
        <option value="2">Неполный рабочий день</option>
        <option value="3">Свободный график</option> 
        </select><br/><br/> 
        <h6>Желаемое место работы (город, район НСО):</h6> 
        <textarea name="edit_place_of_employment" ><?=$edit["place_of_employment"]?></textarea><br/><br/> 
           
        <input type="submit" value="Сохранить изменения" /> <input type="submit" name="<?=$_GET["node"]?>[save][cancel]" value="Отмена" /></p>
        </form>
        <?php
        break;
        
        case "graduaties_add": 
        ?> <h2>Добавление выпускника</h2>
        <?php if(!isset($MODULE_OUTPUT["people"]) && !isset($MODULE_OUTPUT["graduaty"]) && !isset($MODULE_OUTPUT["action"])){
        ?>
        <form action="$EE["unqueried_uri"]" method="get">
        <p>
        Человек:
        <input name="lastnamepatronymic" type="text" size="25" /> <input type="submit" value="Найти" class="button" />
        </p>
        </form>
        <a href="/graduaties/add/people/" >Добавить нового человека</a> 
        <?php
        }
          
        if(!empty($MODULE_OUTPUT["people"]))
        {   
            ?><ul> <?php
            foreach ($MODULE_OUTPUT["people"] as $people)
            {
            ?>
            <li><a href="/graduaties/add/<?=$people["id"]?>/"><?=$people["last_name"]?>&nbsp;<?=$people["name"]?>&nbsp;<?=$people["patronymic"]?>&nbsp;-&nbsp;группа <?=$people["group"]?>,&nbsp;год поступления <?=$people["year"]?>&nbsp;(<?=$people["code"]?>&nbsp;-&nbsp;<?=$people["spec"]?>)</a></li>
  
        <?php 
            }
            ?></ul>
            <a href="/graduaties/add/people/" >Добавить нового человека</a>
             <?php 
        }
        
        if (isset($MODULE_OUTPUT["action"]) && $MODULE_OUTPUT["action"]=="add_people")
        {?>
            <form action="/graduaties/add/" method="post">
                <br/>
                <h6>Фамилия:</h6>
                <input type="hidden" name="action" value="new_people"></input><br/> 
                <input type="text" name="last_name"></input><br/>
                <h6>Имя:</h6> 
                <input type="text" name="name"></input><br/>
                <h6>Отчество:</h6> 
                <input type="text" name="patronymic"></input><br/>
                <h6>Пол:</h6> 
                <select name="male">
                <option value="0"></option>
                <option value="0">Женский</option>
                <option value="1">Мужской</option>
                </select><br/><br/> 
                <h6>Год поступления:</h6> 
                <input type="text" name="year"></input><br/>
                <h6>Группа:</h6> 
                <select name="id_group" size="1"><option value="0"></option> 
                <?php foreach ($MODULE_OUTPUT["group"] as $group) 
                {   ?>
                    <option value="<?=$group["id"]?>"><?=$group["name"]?></option>
                <?php } ?>
                </select><br/><br/>
                <h6>Подгруппа:</h6> 
                <input type="text" name="subgroup"></input><br/>
                <h6>Специальность:</h6> 
                <input type="text" name="id_speciality"></input><br/>
                <input type="submit" value="Добавить">
            </form>
        <?php }   
        
        if(!empty($MODULE_OUTPUT["graduaty"]))
        {   
            foreach ($MODULE_OUTPUT["graduaty"] as $graduaty)
            {?> <br> 
            ФИО: <?=$graduaty["last_name"]?> <?=$graduaty["name"]?> <?=$graduaty["patronymic"]?> <br>
            Пол: <?php if ($graduaty["male"]==1)
            {
               ?>Мужской<?php 
            }
            else{
                ?>Женский<?php
            
            }  ?> <br>
            Статус: <?=$graduaty["status"]?> <br>
            Факультет: <?=$graduaty["faculty"]?> <br>
            Группа: <?=$graduaty["group"]?> <br>  
            Специальность: <?=$graduaty["spec"]?> <br> 
            
            <form action="<?=$EE["unqueried_uri"]?>" method="post">
                <br/>
                <input type="hidden" name="add_id" value="<?=$graduaty["id"]?>">
                <h6>Форма обучения:</h6>
                <select name="add_type_tuition" style="width:42%">
                <option >Не указано</option>
                <option value="0">заочная</option>
                <option value="1">очная</option>
                </select><br/><br/> 
                
                <b>Средний балл по диплому:   <b> 
                <input type="text" name="add_average_grades" style="text-align:right;" ></input><br/><br/> 
                
                <h6>Тема дипломной работы:</h6>
                <input type="text" name="add_theme" style="width:42%"></input>
                <br/><br/>
                <h6>Год выпуска:</h6> 
                <input type="text" name="add_year_out" style="text-align:left;width:42%"></input><br/><br/>
                <h6>Семейное положение:</h6>  
        <select name="add_marital_status" style="width:42%">
        <option >Не указано</option>
        <option value="0">Холост/Не замужем</option>
        <option value="1">Женат/Замужем</option> 
        </select><br/><br/>
        <h6>Район по прописке:</h6> 
        <input type="text" name="add_residence" style="text-align:left;width:42%"></input><br/><br/>
        <h6>Опыт работы:</h6>  
        <textarea name="add_operational_experience" style="width:42%"></textarea><br/><br/>
        <h6>Дополнительные сведения:</h6> 
        <textarea name="add_additional_information" style="width:42%"></textarea><br/><br/>
        <h6>Желаемый график работы:</h6> 
        <select name="add_operating_schedule" style="width:42%">
        <option value="0">Не важно</option>
        <option value="1">Полный рабочий день</option> 
        <option value="2">Неполный рабочий день</option>
        <option value="3">Свободный график</option> 
        </select><br/><br/> 
        <h6>Желаемое место работы (город, район НСО):</h6> 
        <textarea name="add_place_of_employment" style="width:42%"></textarea><br/><br/> 
                 
                <p><input type="submit" value="Готово"></p>
            </form>  
            <?php }
        }
        break;
    }
