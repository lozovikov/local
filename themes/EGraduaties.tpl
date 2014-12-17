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
            ?><h2>����������</h2>
            <?php if ($MODULE_OUTPUT["show_manage"]==1)
                  {?>
            <a href="add/"><b>�������� ����������</b></a><br/>
            <?php }
            
            if (!empty($MODULE_OUTPUT["graduaties"]))
            {
                ?><table cellpadding="0" cellspacing="3" border="0" width="100%"><?php
                ?><tr bgcolor="#BBBBBB"><th>���</th><th>�����������</th><th>����� ��������</th><th>������</th><th>���� ������</th></tr><?php 
            
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
                        ?><br/><a href="edit/<?=$grad["id_people"]?>/"><font size="1pt">�������������</font></a>&nbsp;<a href="delete/<?=$grad["id_people"]?>/" onclick="if (!confirm('������� ����������?')) return false;" ><font size="1pt">�������</font></a>
                    <?php } ?> 
                    </td>
                    <td ><font size="1pt">���������: <?=$grad["name_ft"]?><br>�������������: <?=$grad["name_st"]?>, ��� �������: <?=$grad["year_out"]?></font></td>
                    <?php if($grad["type_tuition"]==1) 
                    {
                        ?><td>�����</td><?php
                    }
                    else    
                    {
                        ?><td>�������</td><?php 
                    }?>
                    <td>������� ���� �� �������:<?=$grad["average_grades"]?> <br><?=$grad["theme"]?></td>
                    <td><?=$grad["operational_experience"]?></td>
                    </tr><?php
                    $i++;
                }
                ?></table><?php
            }
            else
            {
                ?><p>���������� � ����������� ������������� �����������</p><?php
            }
            
        $pager_output = $MODULE_OUTPUT["pager_output"];
        
        if (count($pager_output["pages_data"]) > 1) // ���� ���� ��� ��������, � ������� ������ �����
        {
            echo "<div class=\"pager\">\n";
            
            if($pager_output["prev_page"])
            {
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["prev_page"]]["link"]}\" title=\"���������� ��������\"";
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
                echo "<a href=\"{$pager_output["pages_data"][$pager_output["next_page"]]["link"]}\" title=\"��������� ��������\"";
                echo " id=\"next_page_link\" class=\"prev-next-link\">". "<span class=\"arrow\">&nbsp;&rarr;</span>";
                echo "</a>";
            }
            echo "    </p>\n";
            echo "</div>\n";    
        }
        break;
        
        case "graduaties_edit":
        ?>
        <h2>�������������� ������ ����������</h2> <br/>
        <form action="<?=$EE["unqueried_uri"]?>" method="post">
        <?php foreach($MODULE_OUTPUT["graduaty_edit_view"] as $edit_view)
        {  ?>
            ���: <?=$edit_view["last_name"]?> <?=$edit_view["name"]?> <?=$edit_view["patronymic"]?> <br>
            ���: <?php if ($edit_view["male"]==1)
            {
               ?>�������<?php 
            }
            else{
                ?>�������<?php
            
            }  ?> <br>
            ���������: <?=$edit_view["faculty"]?> <br>
            ������: <?=$edit_view["group"]?> <br>  
            �������������: <?=$edit_view["spec"]?> <br> <br>  
        
        <?php }
        foreach($MODULE_OUTPUT["graduaties_edit"] as $edit)
        {
            
        ?>
        <input type="hidden" name="id" value="<?=$edit["id_people"]?>">
        <h6>����� ��������:</h6>
        <select name="edit_type_tuition" style="width:42%">
        <?php if($edit["type_tuition"]==1)
        {?>
            <option value="1" selected="selected">�����</option>
            <?php 
        }else {?>         
            <option value="0" selected="selected">�������</option>
        <?php } ?>
        <option disabled="disabled">-----------------</option>
        <option value="0">�������</option>
        <option value="1">�����</option>
        </select><br/><br/> 
        
        <b>������� ���� �� �������:   <b> 
        <input type="text" name="edit_average_grades" value="<?=$edit["average_grades"]?>" style="text-align:right;" ></input><br/><br/> 
        
        <h6>���� ��������� ������:</h6>
        <input type="text" name="edit_theme" value="<?=$edit["theme"]?>" style="width:42%"></input>
        <?php } ?>
        <br/><br/>
        <h6>��� �������:</h6> 
        <input type="text" name="edit_year_out" value="<?=$edit["year_out"]?>" style="text-align:left;" ></input><br/><br/>
        <h6>�������� ���������:</h6>  
        <select name="edit_marital_status">
        <?php if($edit["marital_status"]==1)
        {?>
            <option value="1" selected="selected">�����/�������</option>
            <?php 
        }else {?>         
            <option value="0" selected="selected">������/�� �������</option>
        <?php } ?>
        <option disabled="disabled">-----------------</option>  
        <option value="0">������/�� �������</option>
        <option value="1">�����/�������</option> 
        </select><br/><br/>
        <h6>����� ���������� �� ��������:</h6> 
        <input type="text" name="edit_residence" value="<?=$edit["residence"]?>" style="text-align:left;" ></input><br/><br/>
        <h6>���� ������:</h6>  
        <textarea name="edit_operational_experience" ><?=$edit["operational_experience"]?></textarea><br/><br/>
        <h6>�������������� ��������:</h6> 
        <textarea name="edit_additional_information" ><?=$edit["additional_information"]?></textarea><br/><br/>
        <h6>�������� ������ ������:</h6> 
        <select name="edit_operating_schedule">
        <?php if($edit["operating_schedule"]==1)
        {?>
            <option value="1" selected="selected">������ ������� ����</option>
            <?php 
        }elseif ($edit["operating_schedule"]==0) {?>         
            <option value="0" selected="selected">�� �����</option>
        <?php 
        }elseif ($edit["operating_schedule"]==2) {?>         
            <option value="0" selected="selected">�������� ������� ����</option>
        <?php  
        }elseif ($edit["operating_schedule"]==3) {?>         
            <option value="0" selected="selected">��������� ������</option>
        <?php }?>
        <option disabled="disabled">-----------------</option>  
        <option value="0">�� �����</option>
        <option value="1">������ ������� ����</option> 
        <option value="2">�������� ������� ����</option>
        <option value="3">��������� ������</option> 
        </select><br/><br/> 
        <h6>�������� ����� ������ (�����, ����� ���):</h6> 
        <textarea name="edit_place_of_employment" ><?=$edit["place_of_employment"]?></textarea><br/><br/> 
           
        <input type="submit" value="��������� ���������" /> <input type="submit" name="<?=$_GET["node"]?>[save][cancel]" value="������" /></p>
        </form>
        <?php
        break;
        
        case "graduaties_add": 
        ?> <h2>���������� ����������</h2>
        <?php if(!isset($MODULE_OUTPUT["people"]) && !isset($MODULE_OUTPUT["graduaty"]) && !isset($MODULE_OUTPUT["action"])){
        ?>
        <form action="$EE["unqueried_uri"]" method="get">
        <p>
        �������:
        <input name="lastnamepatronymic" type="text" size="25" /> <input type="submit" value="�����" class="button" />
        </p>
        </form>
        <a href="/graduaties/add/people/" >�������� ������ ��������</a> 
        <?php
        }
          
        if(!empty($MODULE_OUTPUT["people"]))
        {   
            ?><ul> <?php
            foreach ($MODULE_OUTPUT["people"] as $people)
            {
            ?>
            <li><a href="/graduaties/add/<?=$people["id"]?>/"><?=$people["last_name"]?>&nbsp;<?=$people["name"]?>&nbsp;<?=$people["patronymic"]?>&nbsp;-&nbsp;������ <?=$people["group"]?>,&nbsp;��� ����������� <?=$people["year"]?>&nbsp;(<?=$people["code"]?>&nbsp;-&nbsp;<?=$people["spec"]?>)</a></li>
  
        <?php 
            }
            ?></ul>
            <a href="/graduaties/add/people/" >�������� ������ ��������</a>
             <?php 
        }
        
        if (isset($MODULE_OUTPUT["action"]) && $MODULE_OUTPUT["action"]=="add_people")
        {?>
            <form action="/graduaties/add/" method="post">
                <br/>
                <h6>�������:</h6>
                <input type="hidden" name="action" value="new_people"></input><br/> 
                <input type="text" name="last_name"></input><br/>
                <h6>���:</h6> 
                <input type="text" name="name"></input><br/>
                <h6>��������:</h6> 
                <input type="text" name="patronymic"></input><br/>
                <h6>���:</h6> 
                <select name="male">
                <option value="0"></option>
                <option value="0">�������</option>
                <option value="1">�������</option>
                </select><br/><br/> 
                <h6>��� �����������:</h6> 
                <input type="text" name="year"></input><br/>
                <h6>������:</h6> 
                <select name="id_group" size="1"><option value="0"></option> 
                <?php foreach ($MODULE_OUTPUT["group"] as $group) 
                {   ?>
                    <option value="<?=$group["id"]?>"><?=$group["name"]?></option>
                <?php } ?>
                </select><br/><br/>
                <h6>���������:</h6> 
                <input type="text" name="subgroup"></input><br/>
                <h6>�������������:</h6> 
                <input type="text" name="id_speciality"></input><br/>
                <input type="submit" value="��������">
            </form>
        <?php }   
        
        if(!empty($MODULE_OUTPUT["graduaty"]))
        {   
            foreach ($MODULE_OUTPUT["graduaty"] as $graduaty)
            {?> <br> 
            ���: <?=$graduaty["last_name"]?> <?=$graduaty["name"]?> <?=$graduaty["patronymic"]?> <br>
            ���: <?php if ($graduaty["male"]==1)
            {
               ?>�������<?php 
            }
            else{
                ?>�������<?php
            
            }  ?> <br>
            ������: <?=$graduaty["status"]?> <br>
            ���������: <?=$graduaty["faculty"]?> <br>
            ������: <?=$graduaty["group"]?> <br>  
            �������������: <?=$graduaty["spec"]?> <br> 
            
            <form action="<?=$EE["unqueried_uri"]?>" method="post">
                <br/>
                <input type="hidden" name="add_id" value="<?=$graduaty["id"]?>">
                <h6>����� ��������:</h6>
                <select name="add_type_tuition" style="width:42%">
                <option >�� �������</option>
                <option value="0">�������</option>
                <option value="1">�����</option>
                </select><br/><br/> 
                
                <b>������� ���� �� �������:   <b> 
                <input type="text" name="add_average_grades" style="text-align:right;" ></input><br/><br/> 
                
                <h6>���� ��������� ������:</h6>
                <input type="text" name="add_theme" style="width:42%"></input>
                <br/><br/>
                <h6>��� �������:</h6> 
                <input type="text" name="add_year_out" style="text-align:left;width:42%"></input><br/><br/>
                <h6>�������� ���������:</h6>  
        <select name="add_marital_status" style="width:42%">
        <option >�� �������</option>
        <option value="0">������/�� �������</option>
        <option value="1">�����/�������</option> 
        </select><br/><br/>
        <h6>����� �� ��������:</h6> 
        <input type="text" name="add_residence" style="text-align:left;width:42%"></input><br/><br/>
        <h6>���� ������:</h6>  
        <textarea name="add_operational_experience" style="width:42%"></textarea><br/><br/>
        <h6>�������������� ��������:</h6> 
        <textarea name="add_additional_information" style="width:42%"></textarea><br/><br/>
        <h6>�������� ������ ������:</h6> 
        <select name="add_operating_schedule" style="width:42%">
        <option value="0">�� �����</option>
        <option value="1">������ ������� ����</option> 
        <option value="2">�������� ������� ����</option>
        <option value="3">��������� ������</option> 
        </select><br/><br/> 
        <h6>�������� ����� ������ (�����, ����� ���):</h6> 
        <textarea name="add_place_of_employment" style="width:42%"></textarea><br/><br/> 
                 
                <p><input type="submit" value="������"></p>
            </form>  
            <?php }
        }
        break;
    }
