<?php

$MODULE_OUTPUT = $MODULE_DATA["output"];

$MODULE_MESSAGES = array(
    101 => "������� ������� ��������.",
    102 => "��������� ������������� ������� ��������.",
    103 => "������������� ������� ���������.",
    104 => "��������� ������������� ������� ������.",
    105 => "������������� � �� ������������ ������� �������.",
    106 => "�������������� ������ �������.",
    301 => "������� �� ��������.",
    302 => "������� �� ��������. ���� ������� 2 ��������� ������.",
    303 => "������� �� ��������. ���������� ������ ������.",
    304 => "������ � ����� ������� ��� ����������.",
    305 => "���������� ������� ������ ������. ��� �� �����.",
    306 => "������. ���� ��������� �� ��� ����.",
    307 => "��������� ������������� �� ��������.",
    308 => "������������� �� ���������.",
    309 => "��������� ������������� �� ������.",
    310 => "������������� � �� ������������ �� �������.",
    311 => "������ ��� ���������� ���������� �������������.",
    312 => "������ ��� �������������� �������������."   
    
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
            "read_all_news" => "������ ��� �������",
            "all_news" => "��� ���������",
            "latest_news" => "��������� ���������",
            "date_format" => "d.m.Y",
            "datetime_format" => "d.m.Y, H:i:s",
            "read_more" => "������ ���������",
            "more" => "���������",
            "prev" => "����������",
            "previous_page" => "���������� ��������",
            "next" => "���������",
            "next_page" => "��������� ��������",
            "pages" => "��������",
            "add_comment" => "�������� �����������",
            "comments" => "�����������",
            "no_comments" => "�� ������ ������ �&nbsp;����� ��������� ��� ��&nbsp;������ �����������. �� ������ �������� ������!",
            "name" => "���",
            "location" => "�����",
            "email" => "E-mail",
            "your_comment" => "��� �����������",
            "confirmation_code" => "��� �������������",
            "confirmation_code_hint" => "����������, ������� �������� ���, ����������� �� ��������.",
            "obligatory_field" => "����, ������������ ��� ����������",
            "all_publications" => "��� �������",
            "read_all_publications" => "������ ��� �������",
            );
        break;
}

switch($MODULE_OUTPUT["mode"])
{  
      
    case "faculties":
        ?>
        <h2>������������� ����</h2>
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
              <h3>�������� ��������� � ������������� <?=$_GET["code"]?> - <?=$_GET["name"]?> :</h3> 
                <form method="post" action="/speciality/">
                <input type="hidden" name="action_sub" value="add_subsection"> 
                <input type="hidden" name="code" value="<?=$_GET["code"]?>" />
                <br/>
                <table border="1">
                    <th bgcolor="#BBBBBB">��� ��������</th><th bgcolor="#BBBBBB">��� ������������</th><th bgcolor="#BBBBBB">����� ����� ��������</th><th bgcolor="#BBBBBB">������� ����� ��������</th>  
                        
                        
                        <tr>
                                                <td>
                        <input type="text" name="year_open_sub" ></input>
                        </td>
                        <td>
                        <select name="type_sub" size="1">
                            <option selected="selected">��� �������������</option>
                            <option value="secondary">������� ��������������� �����������</option>
                            <option value="higher">������ ��������������� �����������</option> 
                            <option value="bachelor">�����������</option> 
                            <option value="magistracy">������������</option> 
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
                <input type="submit" value="��������" class="button" />
                </form>
              <?php 
              }
               
         if(isset($_GET["node"]) && isset($_GET["action"]) && $_GET["action"]=="add")
              {?> 
              <h3>�������� �������������:</h3> 
                <form method="post" action="/speciality/">
                <input type="hidden" name="action_op" value="add"> 
                ��� �������������:<br />
                <input type="text" name="code_add" />
                <br />
                �������� �������������:<br />
                <input type="text" name="name" />
                <br/>
                �������� �����������:
                <br />
                 <select name="direction" size="1">
                 <option value="0" selected="selected">����������� �������������</option>
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
                ��� ��������:<br />
                <input type="text" name="year_open" />
                <br/>
                ��� ������������:<br />
                <select name="type" size="1">
                    <option selected="selected">��� �������������</option>
                    <option value="secondary">������� ��������������� �����������</option>
                    <option value="higher">������ ��������������� �����������</option> 
                    <option value="bachelor">�����������</option> 
                    <option value="magistracy">������������</option> 
                </select>
                <br/>
                ������� ����� ��������:
                <input type="checkbox" value="1" name="internal_tuition" checked />
                <br/>
                ����� ����� ��������:&nbsp;&nbsp;&nbsp; 
                <input type="checkbox" value="1" name="correspondence_tuition"/>
                <br/>
                ��������:
                <textarea name="description"  style="width=300px; height=100px" ></textarea>
                <br/>
                <input type="submit" value="��������" class="button" />
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
                    
                    ��� �������������:<br />
                    <input type="text" name="code" value="<?=$special["code"]?>"></input>
                    <br />
                    �������� �������������:<br />
                    <input type="text" name="name" style="width:484px" value="<?=$special["name"]?>"></input> 
                    <br/>
                    �������� �����������:
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
                    <th bgcolor="#BBBBBB">� �.�</th><th bgcolor="#BBBBBB">��� ��������</th><th bgcolor="#BBBBBB">��� ������������</th><th bgcolor="#BBBBBB">����� ����� ��������</th><th bgcolor="#BBBBBB">������� ����� ��������</th>  
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
                                  ?><option value="secondary" selected="selected">������� ������c��������� �����������</option>
                                   <option disabled>---------------------------------------</option><?php 
                                  break;
                                  case higher:
                                  ?><option value="higher" selected="selected">������ ������c��������� �����������</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                                   case bachelor:
                                  ?><option value="bachelor" selected="selected">�����������</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                                   case magistracy:
                                  ?><option value="magistracy" selected="selected">������������</option>
                                   <option disabled>---------------------------------------</option><?php
                                  break;
                             }
                        ?>
                            
                            <option value="secondary">������� �����c���������� �����������</option>
                            <option value="higher">������ ������c��������� �����������</option> 
                            <option value="bachelor">�����������</option> 
                            <option value="magistracy">������������</option> 
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
                    ��������:                 
                    <textarea name="description" cols="60" rows="15" class="wysiwyg"><?=$special["description"]?></textarea>
                    <p><input type="submit" value="��������� ���������" /> <input type="reset" value="�����" /> <input type="submit" name="<?=$_GET["node"]?>[save][cancel]" value="������" /></p>
                 </form>
                 
                 <?php }
              }
              else
              {
              
              if (empty($special["description"]))
              {
                   ?><p>���������� � ������ ������������� �����������</p></br>
                  <?php if ($MODULE_OUTPUT["privileges"]["specialities.handle"]==true)
                  {?>
                  <a href="/speciality/<?=$special["code"]?>/?node=<?=$NODE_ID?>&amp;action=edit#form">[ ������������� ����� ]</a><?php 
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
                  {?>������������: ������� <br> ���� ��������: 5 ��� <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="bach")
                  {?>������������: �������� <br> ���� ��������: 4 ���� <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="spo")
                  {?>������������: ���������� <br> ���� ��������: 5 ��� <br> <?php }
                  elseif($MODULE_OUTPUT["type_klass"]=="vpo")
                  {?>������������: ���������� <br> ���� ��������: 5 ��� <br> <?php } 
                  }?>
                  <?=$special["description"]?></p>
                  <p>
                  <?php if ($MODULE_OUTPUT["privileges"]["specialities.handle"]==true)
                  {?>
                  <a href="/speciality/<?=$special["code"]?>/?node=<?=$NODE_ID?>&amp;action=edit#form">[ ������������� ����� ]</a>
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
            �������������:
            <input name="name_search" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="�����" class="button" />
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
                <p>�� ������� �������������� � ������ ����������� ������.</p>
                <?php
                }
                else
                {
                ?>
                <p>������� � ���� ������ ������ � �������������.</p>
                <?php              
                }
            } 
            } 
        }
        
        
    break;
           
    case "specialities":                

        if($MODULE_OUTPUT["type"]=="higher")
        {?><h2 style="text-align: center;">��������� ������� ����������������� �����������</h2><?php
        }elseif($MODULE_OUTPUT["type"]=="secondary")
        {?><h2 style="text-align: center;">��������� �������� ����������������� �����������</h2> <?php
        }elseif($MODULE_OUTPUT["type"]=="bachelor")
        {?><h2 style="text-align: center;">��������� �������� ����������������� �����������<br>����������� ���������� ����������</h2> <?php
        }elseif($MODULE_OUTPUT["type"]=="magistracy")
        {?><h2 style="text-align: center;">��������� �������� ����������������� �����������<br>����������� ���������� ���������</h2> <?php
        }?>
        <table width="550" cellspacing="0" cellpadding="0" bordercolor="#00000" border="1" align="center" style="color:#002F2F;  font-weight:bolder; text-align: center;">
        <tr class="table_top">
            <th>���</th>
            <th>������������ �������������</th>
            <th>��� ��������</th>
            <th>�����</th>
            <th>�������</th>
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
                <a href="/speciality/?node=115&amp;action=add#form">[ �������� ������������� ]</a> 
                <ul>
                <?php
                foreach($MODULE_OUTPUT["speciality_directory"] as $special)
                {
                    ?>
                    <li><?=$special["code"]?>&nbsp;-&nbsp;<?=$special["name"]?></a>&nbsp;[&nbsp;<a href="/office/speciality_directory/?node=<?=$NODE_ID?>&amp;code=<?=$special["code"]?>&amp;section=1&amp;action=delete#form">������� �������� � ��� ����������</a>&nbsp;]&nbsp;[&nbsp;<a href="/speciality/<?=$special["code"]?>/?node=115&action=edit#form">�������������</a>&nbsp;]&nbsp;[&nbsp;<a href="/speciality/<?=$special["code"]?>/?node=115&amp;code=<?=$special["code"]?>&amp;name=<?=$special["name"]?>&amp;direction=<?=$special["direction"]?>&action=add_subsection#form">�������� ���������</a>&nbsp;]&nbsp;</li>
                    <ul>
                    <?php
                    foreach($MODULE_OUTPUT["speciality"] as $speciality)
                    {
                        if($speciality["code"]==$special["code"])
                        {
                            switch ($speciality["type"])
                            {
                                case "secondary":
                                $type_sp="������� ������c��������� �����������";
                                break;
                                case "higher":
                                $type_sp="������ ������c��������� �����������";
                                break;
                                case "magistracy":
                                $type_sp="������������";
                                break;
                                case "bachelor":
                                $type_sp="�����������";
                                break;
                            }
                        ?>
                            
                            <li><?=$speciality["year_open"]?>&nbsp;-&nbsp;<?=$type_sp?>&nbsp;[&nbsp;<a href="/office/speciality_directory/?node=<?=$NODE_ID?>&amp;code=<?=$speciality["code"]?>&amp;year_open=<?=$speciality["year_open"]?>&amp;type=<?=$speciality["type"]?>&amp;subsection=1&amp;action=delete#form">�������</a>&nbsp;]</li>
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
                <p>�������������� �� ����������</p><?php
             
            }

    break;
    
    case "search_spec":
        ?>
        <h2>����</h2>
        <form action="/speciality/" method="get">
        <p>
        �������������:
        <input name="name_search" type="text" size="35"/> <input type="submit" value="�����" class="button" />
        </p>        
        </form>
        <?php
        break;
                  
    case "search_people":
        ?>
        <h2>����</h2>
        <form action="/people/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        �������:
        <input name="name" type="text" size="25" /> <input type="submit" value="�����" class="button" />
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
            <?php echo $man["id_speciality"] ? "�������������: ".$man["id_speciality"].", ".$man["speciality"]["name"] ."<br />": ""?>
            <?php echo $man["year"] ? "��� �����������: ".$man["year"] ."<br />" : ""?>
			<?php echo $man["group_name"] ? "������: <a href=\"/groups/".$man["id_group"] ."/\">".$man["group_name"]."</a>" : ""?>
			
            <?php
			if (!empty($MODULE_DATA["output"]["files_list"])) {
			?>
			<br /><h2>����� ������������</h2>
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
            �������:
            <input name="name" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="�����" class="button"/>
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
                <p>�� ������� ����� � ������ ����������� ������.</p>
                <?php
                }
                else
                {
                ?>
                <p>������� � ���� ������ ������ � ��������.</p>
                <?php              
                }
            };
        };
        break;

    case "search_subjects":
        ?>
        <h2>��������</h2>
        <form action="/subjects/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        �������:
        <input name="name" type="text" size="25" /> <input type="submit" value="�����" class="button"/>
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
            �������:
            <input name="name" type="text" size="35" value="<?php echo isset($_GET["name"]) ? $_GET["name"] : "" ?>"/> <input type="submit" value="�����" class="button"/>
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
                <p>�� ������� ��������� � ������ ����������� ������.</p>
                <?php
                }
                else
                {
                ?>
                <p>������� � ���� ������ ������ � ��������.</p>
                <?php              
                }
            };
        };
        break;
    case "search_group":
        ?>
        <h2>������</h2>
        <form action="/groups/" method="get">
        <div style="text-align: right; width: 350px;">
        <p>
        ������:
        <input name="group" type="text" size="25" /> <input type="submit" value="�����" class="button" />
        </p>
        </div>
        </form>
        <?php
        break;
    case "groups":        
        if(!empty($MODULE_OUTPUT["group"]))
        {
            $group = $MODULE_OUTPUT["group"];
            $days = array("�����������", "�������", "�����", "�������", "�������", "�������");
            $timepars = array("09:00 - 10:20","10:30 - 11:50","12:30 - 13:50","14:00 - 15:20","15:30 - 16:50","17:00 - 18:20","18:30 - 19:50");
            $months = array("������", "�������", "�����", "������", "���", "����", "����", "�������", "��������", "�������", "������","�������");
            $now = $MODULE_OUTPUT["now"];
            
            ?>
            <h1>������ <?=$group["name"]?></h1>            
            <?=$group["faculty"]["name"]?><br />            
            <?php
            if(!empty($MODULE_OUTPUT["timetable"]))
            {
                ?>
                                          
                <h2>���������� ������� �������</h2>
                <?php
                echo "������� ".$now["mday"]." ".$months[$now["mon"]-1]." ".$now["year"]."&nbsp;�., ".$days[$now["wday"]-1].".<br><br>";
                ?>
            
            
                
                <div id="timetable_div">
                
                    <div class="right_table">
                    <table class="right_timetable">
                    <tr class="table_top"><th>�</th><th>����� ����������</th></tr>
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
                    <tr class="table_top"><th colspan="2">����������� ��������</th></tr>
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
                    <tr class="table_top"><th>�</th><th>������</th><th>���������</th><th>����������</th><th>���������</th></tr>
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
                                        <td title="������ ������">�</td><td>
                                        <?php
                                        if(isset($timetable[$j+1]) && $timetable[$j]["num"] == $timetable[$j+1]["num"] 
                                                                    && $timetable[$j+1]["dow"] == $i+1)
                                            $k--;
                                        break;
                                    }
                                    case "even":
                                    {
                                        ?>
                                        <td title="�������� ������">�</td><td>
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
            ������:
            <input name="group" type="text" size="35" value="<?php echo isset($_GET["group"]) ? $_GET["group"] : "" ?>"/> <input type="submit" value="�����" class="button" />
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
                    <li><a href="/groups/<?=$group["id"]?>/">������ <?=$group["name"]?>, <?=$group["faculty"]?></a></li>
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
                <p>�� ������� ����� � ������ ����������� ������.</p>
                <?php
                }
                else
                {
                ?>
                <p>������� � ���� ������ �������� ������.</p>
                <?php              
                }
            };
        };
        break;
		
	case "students":
	{
		if (isset($MODULE_OUTPUT["students"]) && sizeof($MODULE_OUTPUT["students"])) {
			?>
			<h2>������ ������</h2><ul>
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
            <a href="edit/<?=$group["id"]?>/"><?=$group["name"]?></a> [<a href="delete/<?=$group["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]<br />
            <?php
        }
        
        ?>
        <h3>�������� ������:</h3>
        <form method="post" name="add_group">
        ��� ������:<br />
        <input type="text" name="group_name" />
        <br />
        �������� ���������:
        <br />
        <select name="faculties" size="1">
        <option value="0" selected="selected">�������� ���������</option>
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
        <input type="submit" value="��������" class="button" />
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
                        echo "<h2>�������������� ���������� � ������ ".$group["name"]." (".$group["faculty_name"]."):</h2>";
                        ?>
                        <form name="edit_group" method="post">
                        <h3>�������� ������:</h3>
                        <input type="text" name="group_name" value="<?=$group["name"]?>" />
                        <h3>���������, � �������� ��������� ������:</h3>
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
                        <input type="submit" value="���������" class="button" />
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
            <h2>������ �����������:</h2>
            <ul>
            <?php
        foreach($MODULE_OUTPUT["timetable_faculties"] as $faculty)
        {
            ?>
            <li><a href="edit/<?=$faculty["id"]?>/"><?=$faculty["name"]?></a> [<a href="delete/<?=$faculty["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]</li>
            <?php
            if(isset($faculty["subfaculties"]))
            {
                ?>
                <ul>
                <?php
                foreach($faculty["subfaculties"] as $subfaculty)
                {
                    ?>
                    <li><a href="edit/<?=$subfaculty["id"]?>/"><?=$subfaculty["name"]?></a> [<a href="delete/<?=$subfaculty["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]</li>
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
        <h2>�������� ��������� ��� ��������:</h3>
        <form method="post" name="add_faculty">
        <h3>�������� ���������� ��� ���������:</h3>
        <input type="text" name="faculty_name" class="input_long" />
		<h3>�������� ��������:</h3>
        <input type="text" name="faculty_shortname" />
        <h3>�������� �������� (���� ����), � �������� ����� ���������� ������ ���������:</h3>
        <select name="pid" size="1">
        <option value="0" selected="selected">�������� ��������:</option>
        <?php
        foreach($MODULE_OUTPUT["timetable_faculties"] as $faculty)
        {
            ?>
            <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
            <?php
        }
        ?>
        </select>
		<h3>����:</h3>
        <input type="text" name="faculty_link" />
        <br />
        <input type="submit" value="��������" class="button" />
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
                        <h2>�������������� ���������� � ���������� <?=$faculty["name"]?>:</h2>                        
                        <form name="edit_faculty" method="post">
                        <h3>�������� ����������:</h3>
                        <input type="text" name="faculty_name" value="<?=$faculty["name"]?>" />
                        <h3>��������� ��� ��������, � �������� ��������� ������ ���������:</h3>
                        <select name="pid" size="1">
                        <?php
                        if(!$faculty["pid"])
                        {
                            ?>
                            <option value="0" selected="selected">�������� ���������</option>
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
						<h3>���� ����������:</h3>
                        <input type="text" name="faculty_link" value="<?=$faculty["link"]?>" />
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$faculty["id"]?>" name="id" />
                        <input type="submit" value="���������" class="button" />
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
        <h2>���������� �����������</h2>
        <p>�� ���������� � ������� "���������� �����������".
        � ������ ������� �� ������ ��������� � ������������� ���������� � �����������, ��������, ��������������, ���������, ���������� � �������.
        ��� �� �� ������ ���������� � ������������� ������� �������� �������� � ������������� ��������� �� ��������.
        ��� ����� �������� ��������������� ������ ����, ������������ ������.</p>
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
            <h2>������ ������ �� �����������:</h2>            
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
                <li> <a href="edit/<?=$department["id"]?>/"><?=$department["name"]?></a> [<a href="delete/<?=$department["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]</li>
                <?php
            }
            ?>
            </ul>
            <?php   
        }
        ?>
        <br />
        <h2>�������� �������:</h2>
        <form method="post" name="add_department">
        <h3>�������� �������:</h3>
        <input type="text" name="department_name" size="60" />
        <h3>�������� �������� ��� ���������, � �������� ��������� �������:</h3>
        <select name="faculty_id" size="1">
        <option value="0" selected="selected">�������� ���������:</option>
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
        <input type="submit" value="��������" class="button" />
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
                        <h2>�������������� ���������� � ������� <?=$department["name"]?> (<?=$department["faculty_name"]?>):</h2>
                        <form name="edit_department" method="post">
                        <h3>�������� �������:</h3>
                        <input type="text" name="department_name" value="<?=$department["name"]?>" size="60" />
                        <h3>���������, � �������� ��������� �������:</h3>
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
                        <input type="submit" value="���������" class="button" />
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
            <h2>������ �������������� �� ��������:</h2>            
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
                <li><a href="edit/<?=$teachers["id"]?>/"><?=$teachers["last_name"]?> <?=$teachers["name"]?> <?=$teachers["patronymic"]?></a> [<a href="delete/<?=$teachers["id"]?>/<?=$teachers["department_id"]?>/" onclick="return confirmSubmit()">�������</a>]</li>
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
                echo "������������� ".$exist["last_name"];
                if(isset($exist["name"]))
                    echo " ".$exist["name"];
                if(isset($exist["patronymic"]))
                    echo " ".$exist["patronymic"];
                echo ", ���������� � ��������: ";
                if(isset($exist["department1_name"]))
                    echo $exist["department1_name"];
                if(isset($exist["department2_name"]))
                    echo " � ".$exist["department2_name"];
                echo " ��� ����������. �� �������, ��� ����� �������� ��� ���?";
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
                <input type="submit" value="��" name="check" class="button" /><br />
                <input type="submit" value="���" name="check" class="button" />
                </form>
                <?php
            }
        }
        ?>
        <br />
        <form method="post" name="add_teacher" onsubmit="return sendform();">
        <h2>�������� �������������:</h2>
        <h3>�������:</h3>
        <input type="text" name="last_name" />
        <h3>���:</h3>
        <input type="text" name="name" />
        <h3>��������:</h3>
        <input type="text" name="patronymic" />
        <h3>���</h3>
        <input type="radio" name="male" value="1" checked="checked" />� / �
        <input type="radio" name="male" value="0" />
        <h3>�������� �������:</h3>
        <select name="department1_id" size="1">
        <option value="0" selected="selected">�������� �������:</option>
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
        <h3>�������� ������ �������(���� ����. � ���� ������ ��������� ������� ������ ���� ����������):</h3>
        <select name="department2_id" size="1">
        <option value="0" selected="selected">�������� �������:</option>
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
        <h3>��� ������������ ��� ������� � �������:</h3>
            <input type="text" name="username" />
            <h3>����������� ����� (E-mail):</h3>
            <input type="text" name="email" />
            <h3>������:</h3>
            <input type="password" name="password1" />
            <h3>��������� ������:</h3>
            <input type="password" name="password2" />
        <br />
        
        
        <input type="submit" value="��������" class="button" />
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
                        echo "<h2>�������������� ���������� � ������������� ".$teacher["last_name"];
                        if(isset($teacher["name"]))
                            echo " ".$teacher["name"];
                        if(isset($teacher["patronymic"]))
                            echo " ".$teacher["patronymic"];
                        echo "</h2>";
                        ?>
                        <form name="edit_teacher" method="post" onsubmit="return sendform();">
                        <h3>������� �������������:</h3>
                        <input type="text" name="last_name" value="<?=$teacher["last_name"]?>" />
                        <h3>��� �������������:</h3>
                        <input type="text" name="name" value="<?=$teacher["name"]?>" />
                        <h3>�������� �������������:</h3>
                        <input type="text" name="patronymic" value="<?=$teacher["patronymic"]?>" />
                        <h3>���:</h3>
                        <?php
                        if($teacher["male"])
                        {
                        ?>
                        <input type="radio" name="male" value="1" checked="checked" />� / �
                        <input type="radio" name="male" value="0" />
                        <?php
                        }
                        else
                        {
                        ?>
                        <input type="radio" name="male" value="1" />� / �
                        <input type="radio" name="male" value="0" checked="checked" />
                        <?php
                        }
                        ?>
                        <h3>�������� �������:</h3>
                        <select name="department1_id" size="1">
                        <?php
                        if(!$teacher["department1_id"])
                        {
                        ?>
                        <option value="0" selected="selected">�������� �������:</option>
                        <?php
                        }
                        else
                        {
                        ?>
                        <option value="0">������� �� �������</option>
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
                        
                        <h3>�������� ������ �������(���� ����. � ���� ������ ��������� ������� ������ ���� ����������):</h3>
                        <select name="department2_id" size="1">
                        <?php
                        if(!$teacher["department2_id"])
                        {
                        ?>
                        <option value="0" selected="selected">�������� �������:</option>
                        <?php
                        }
                        else
                        {
                        ?>
                        <option value="0">������� �� �������</option>
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
                        <h3>��� ������������ ��� ������� � �������:</h3>
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
                        <h3>����������� ����� (E-mail):</h3>
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
                        <h3>������:</h3>
                        <input type="password" name="password1" />
                        <h3>��������� ������:</h3>
                        <input type="password" name="password2" />
                        <?php
                        }
                        ?>
                        <br />
                        
                        <input type="hidden" value="edit" name="mode" />
                        <input type="hidden" value="<?=$teacher["id"]?>" name="id" />
                        <input type="submit" value="���������" class="button" />
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
                <h2>������ ��������� �� ��������:</h2>                
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
                    <li> <a href="edit/<?=$subject["id"]?>/"><?=$subject["name"]?></a> [<a href="delete/<?=$subject["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]</li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            ?>
            <h2>�������� �������:</h2>
            <form method="post" name="add_subject">
            <h3>�������� ��������:</h3>
            <input type="text" name="subject_name" />
            <h3>�������� �������, � ������� ��������� �������:</h3>
            <select name="department_id" size="1">
            <option value="0" selected="selected">�������� �������:</option>
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
            <input type="submit" value="��������" class="button" />
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
                        <h2>�������������� ���������� � �������� <?=$subject["name"]?>:</h2>
                        <form name="edit_subject" method="post">
                        <h3>�������� ��������:</h3>
                        <input type="text" name="subject_name" value="<?=$subject["name"]?>" />
                        <h3>�������, � �������� ��������� �������:</h3>
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
                        <input type="submit" value="���������" class="button" />
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
        $type = array("��������", "��������", "�������� �����������");
        $using = array("������������", "������", "��");
        if(!isset($MODULE_OUTPUT["auditorium_mode"]))
        {
            if(isset($MODULE_OUTPUT["auditorium"]))
            {
                $id = 0;
                ?>
                <h2>������ ��������� �� ��������:</h2>
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
                    <li> <a href="edit/<?=$auditorium["id"]?>/"><?=$auditorium["label"]?> - <?=$auditorium["name"]?></a> ��������������: <?=$auditorium["roominess"]?>;&nbsp;
                    <?php
                    for($i=0; $i<3; $i++)
                    {
                        if($i == $auditorium["type"])
                        {
                            ?>
                            ��� ���������: <?=$type[$i]?>;
                            <?php
                        }
                    }
                    ?>
                    ���������: <?=$using[$auditorium["is_using"]]?>;&nbsp;
                    [<a href="delete/<?=$auditorium["id"]?>/" onclick="return confirmSubmit()"}>�������</a>]</li>
                    <?php
                }
                ?>
                </ul>
                <?php
            }
            ?>
            <br />
            <h2>�������� ���������:</h2>
            <form method="post" name="add_auditorium">
            <h3>����� ���������:</h3>
            <input type="text" name="auditorium_name" />
            <h3>�������� ������, � ������� ����������� ������ ���������:</h3>
            <select name="building_id" size="1">
            <option value="0" selected="selected">�������� ������:</option>
            <?php
            foreach($MODULE_OUTPUT["buildings"] as $building)
            {
                ?>
                <option value="<?=$building["id"]?>"><?=$building["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>������� ��������������� ���������:</h3>
            <input type="text" name="roominess" />
            <h3>�������, � ������� ��������� ��������� (���� ����):</h3>
            <select name="department_id" size="1">
            <option value="0" selected="selected">�������� �������:</option>
            <?php
            foreach($MODULE_OUTPUT["departments"] as $department)
            {
                ?>
                <option value="<?=$department["id"]?>"><?=$department["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>�������� ��� ���������:</h3>
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
            <h3>�������� ��������� ���������:</h3>
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
            <input type="submit" value="��������" class="button" />
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
                        <h2>�������������� ���������� �� ��������� <?=$auditorium["name"]?>:</h2>
                        <form name="edit_auditorium" method="post">
                        <h3>����� ���������:</h3>
                        <input type="text" name="auditorium_name" value="<?=$auditorium["name"]?>" />
                        <h3>������, � ������� ����������� ���������:</h3>
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
                        <h3>������� ��������������� ���������:</h3>
                        <input type="text" name="roominess" value="<?=$auditorium["roominess"]?>" />
                        <h3>�������, � ������� ��������� ��������� (���� ����):</h3>
                        <select name="department_id">
                        <?php
                        if(!$auditorium["department_id"])
                        {
                            ?>
                            <option selected="selected" value="0">�������� �������</option>
                            <?php
                        }
                        else
                        {
                            ?>
                            <option value="0">��� �������</option>
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
                        <h3>��� ���������:</h3>
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
                        <h3>��������� ���������:</h3>
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
                        <input type="submit" value="���������" class="button" />
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
        <h1>����������</h1>
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
                <h3>���� <?=$i?></h3>
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
            <h2>���������� ������:</h2>
            <form name="new_group" method="post">
            <h3>������� ����� ������:</h3>
            <input type="text" name="group_name" />
            <h3>�������� ���������</h3>
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
            <h3>����</h3>
            <select name="year">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            </select>
            <br />
            <input type="submit" value="�������� ������" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["faculties"]))
        {
            ?>
            <div id="div3">
            <a href="add_group/">�������� ������.</a>
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
                    <h3>���� <?=$i?></h3>
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
            <a href="edit_group/">������������� ������.</a><br />
            <a href="delete_group/" onclick="return confirmSubmit();">������� ������(��� �������� ������� ������ ����� ���������� ���� ��������� ��� �������� �� � ������ �����).</a>
            <h2>������ ���������
            <?php
            if(isset($MODULE_OUTPUT["group_name"]))
            {
                echo ", ���������� � ������ ";
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
            <h2>���������� �������� � ������:</h2>
            <form name="add_student" method="post" onsubmit="return sendform();">
            <h3>�������:</h3>
            <input type="text" name="last_name" />
            <h3>���:</h3>
            <input type="text" name="name" />
            <h3>��������:</h3>
            <input type="text" name="patronymic" />
            <input type="hidden" name="group_id" value="<?=$MODULE_OUTPUT["group_id"]?>" />
            <h3>���:</h3>
            <input type="radio" value="1" name="male" />� / �<input type="radio" value="0" name="male" />
            <h3>�������������:</h3>
            <select name="id_speciality">
            <?php
            if(isset($MODULE_OUTPUT["specialities"]))
            {
                if(!isset($id_speciality))
                {
                    ?>
                    <option value="0" selected="selected" disabled="disabled">�������� �������������</option>
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
            <h3>��� �����������:</h3>
            <input type="text" name="year" />
            <h3>��������� (���� ����):</h3>
            <input type="radio" value="�" name="subgroup" />� / �<input type="radio" value="�" name="subgroup" />
            <h3>��� ������������ ��� ������� � �������:</h3>
            <input type="text" name="username" />
            <h3>����������� ����� (E-mail):</h3>
            <input type="text" name="email" />
            <h3>������:</h3>
            <input type="password" name="password1" />
            <h3>��������� ������:</h3>
            <input type="password" name="password2" /><br />
            <input type="submit" value="�������� �������� � ������" class="button" /> 
            </fomr>
            <?php    
        }
        if(isset($MODULE_OUTPUT["edit_group"]))
        {
            foreach($MODULE_OUTPUT["edit_group"] as $group)
                    {
                        echo "<h2>�������������� ���������� � ������ ".$group["name"]." (".$group["faculty_name"]."):</h2>";
                        ?>
                        <form name="edit_group" method="post">
                        <h3>�������� ������:</h3>
                        <input type="text" name="group_name" value="<?=$group["name"]?>" />
                        <h3>���������, � �������� ��������� ������:</h3>
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
                        <h3>����</h3>
                        <input type="text" name="year" value="<?=$group["year"]?>" />
                        <br />
                        <input type="submit" value="���������" class="button" />
                        </form>
                        <?php
                    }
        }
        if(isset($MODULE_OUTPUT["edit_student"]))
        {
            $student = $MODULE_OUTPUT["edit_student"];                                                
            {
                ?>
                <h2>�������������� ���������� � ��������:</h2>
                <a href="expulsion/" onclick="return expulsion();">��������� ��������.</a><br />
                <a href="marks/">�������� ������</a>
                <input type="hidden" name="id_student" value="<?=$student["id"]?>" />
                <form name="edit_student" method="post" onsubmit="return sendform();">
                <h3>�������:</h3>
                <input type="text" name="last_name" value="<?=$student["last_name"]?>" />
                <h3>���:</h3>
                <input type="text" name="name" value="<?=$student["name"]?>" />
                <h3>��������:</h3>
                <input type="text" name="patronymic" value="<?=$student["patronymic"]?>" />
                <h3>���:</h3>
                <?php
                if(isset($student["male"]))
                {
                if($student["male"])
                {
                ?>
                <input type="radio" value="1" name="male" checked="checked" />� / �<input type="radio" value="0" name="male" />
                <?php
                }
                else
                {
                ?>
                <input type="radio" value="1" name="male" />� / �<input type="radio" value="0" name="male" checked="checked" />
                <?php
                }
                }
                else
                {
                ?>
                <input type="radio" value="1" name="male" />� / �<input type="radio" value="0" name="male" />
                <?php
                }
                ?>
                <h3>�������������:</h3>
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
                <h3>��� �����������:</h3>
                <input type="text" name="year" value="<?=$student["year"]?>" />
                <h3>������:</h3>
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
                <h3>��������� (���� ����):</h3>
                <?php
                if(isset($student["male"]))
                {
                if($student["subgroup"] == "�")
                {
                ?>
                <input type="radio" value="�" name="subgroup" checked="checked" />� / �<input type="radio" value="�" name="subgroup" />
                <?php
                }
                else
                {
                ?>
                <input type="radio" value="�" name="subgroup" />� / �<input type="radio" value="�" name="subgroup" checked="checked" />
                <?php
                }
                }
                else
                {
                ?>
                <input type="radio" value="�" name="subgroup" />� / �<input type="radio" value="�" name="subgroup" />
                <?php
                }
                ?>
                <h3>��� ������������ ��� ������� � �������:</h3>
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
                <h3>����������� ����� (E-mail):</h3>
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
                    <h3>��� ������� �������� ��� �� ���������� ������. ������:</h3>
                    <h3>������:</h3>
                    <input type="password" name="password1" />
                    <h3>��������� ������:</h3>
                    <input type="password" name="password2" />
                    <?php
                }
                ?>
                <br />
                <input type="submit" value="��������� ���������" class="button" /> 
                </fomr>
                <?php
            }
        }
        if(isset($MODULE_OUTPUT["marks"]))
        {
            $marks = $MODULE_OUTPUT["marks"];
            $months = array("������", "�������", "�����", "������", "���", "����", "����", "�������", "��������", "�������", "������", "�������");
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
            <h2>�������� ������ ��������</h2>
            <table class="timetable">
            <tr class="table_top"><th>�������� ��������</th><th>������</th><th>����</th><th>��������</th></tr>
            <?php
            $i=1;
            foreach($MODULE_OUTPUT["marks"] as $mark)
            {
                if($mark["term"] == $i)
                {
                    ?>
                    <tr class="week_day"><th colspan="4">������� <?=$i?></th></tr>
                    <?php
                    $i++;
                }
                ?>
                <tr><td><?=$mark["subject"]?></td><td><?=$mark["mark"]?></td><td><?=$mark["date"]?></td><td><a href="edit/<?=$mark["id"]?>/">�������������</a> / <a href="delete/<?=$mark["id"]?>/" onclick="return confirmSubmit();">�������</a></td></tr>
                <?php
            }
            ?>
            </table>
            <?php
            }
            ?>
            <h2>�������� ������</h2>
            <form method="post">
            <input type="hidden" name="student_id" value="<?=$MODULE_OUTPUT["student_id"]?>" />
            <h3>�������� ��������:</h3>
            <select name="subject">
            <option value="0">�������� �������</option>
            <?php
            foreach($MODULE_OUTPUT["subjects"] as $subject)
            {
                ?>
                <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>������ (��� ������� � ������)</h3>
            <select name="mark">
            <option selected="selected" disabled="disabled" value="0">�������� ������</option>
            <?php
            for($k=2; $k<6; $k++)
            {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
            }
            ?>
            <option value="�������">�������</option>
            <option value="�� �������">�� �������</option>
            </select>
            <br />
            <h3>����</h3>
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
            <h3>�������</h3>
            <select name="term">
            <option selected="selected" disabled="disabled">�������� �������</option>
            <?php
            for($k=1; $k<13; $k++)
            {
                ?>
                <option value="<?=$k?>"><?=$k?></option>
                <?php
            }
            ?>
            </select><br />
            <input type="submit" value="�������� ������" class="button" />
            </form>
            <?php
            
        }
        if(isset($MODULE_OUTPUT["edit_mark"]))
        {
            $mark = $MODULE_OUTPUT["edit_mark"];
            $months = array("������", "�������", "�����", "������", "���", "����", "����", "�������", "��������", "�������", "������", "�������");
            $year = date("Y");
            ?>
            <h2>�������������� ������:</h2>
            <form method="post" name="edit_mark">
            <input type="hidden" name="mark_id" value="<?=$mark["id"]?>" />
            <h3>�������� ��������:</h3>
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
            <h3>������ (��� ������� � ������)</h3>
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
            if($mark["mark"]=="�������")
            {
                ?>
                <option value="�������" selected="selected">�������</option>
                <option value="�� �������">�� �������</option>
                <?php
            }
            else
            {
              if($mark["mark"]=="�� �������")
              {
                    ?>
                    <option value="�������">�������</option>
                    <option value="�� �������" selected="selected">�� �������</option>
                    <?php
                }  
                else
                {
                    
                ?>
                <option value="�������">�������</option>
                <option value="�� �������">�� �������</option>
                <?php
                }
            }
            ?>
            </select>
            <h3>����:</h3>
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
            <h3>�������</h3>
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
            <input type="submit" value="��������� ������" class="button" />
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
            <h2>������ ������ �� �����������:</h2>            
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
                $department = str_replace("�������", "�������", $MODULE_OUTPUT["department_name"]);
                ?>
                <h1>������������� ��������� ����� ��� <?=$department?></h1>
                <table class="timetable">
                <tr class="table_top"><th rowspan="4"><img src="/themes/styles/delete.png"></th><th rowspan="4">����������</th><th rowspan="4">�-�</th><th rowspan="4">�<br />�<br/>�<br/>�</th>
                <th colspan="2">�.�.�. �������������</th><th colspan="2">� �����</th><th rowspan="4">� ���.</th>
                <th colspan="5">�������������� �������� � �������������</th><th rowspan="4">����������</th><th rowspan="4">�<br />�<br />�<br />�<br />�<br />�</th></tr>
                <tr class="table_top"><th rowspan="3">������</th><th rowspan="3">��������</th><th rowspan="3">�������</th>
                <th rowspan="3">����������</th><th colspan="4">������� � ������(����, ����)</th>
                <th rowspan="3">�<br />�<br />�<br />�<br />�<br />�<br />�</th></tr>  
                <tr class="table_top">
                <th colspan="3">��������</th>
                <th rowspan="2">������� ������ ����</th>
                </tr>
                <tr class="table_top"><th><span title="����������">�</span></th><th><span title="�������������">�</span></th><th><span title="�����������">�</span></th></tr>
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
                <h3>� ��������� ������� �� ��������� ���������. ������� �������� �������</h3>
                <?
            }
            if(isset($MODULE_OUTPUT["subjects_list"]))
            {
            ?>
            <h2>�������� ������ � �������������</h2>
            <form method="post" onsubmit="return sendform_sbd();">
            <h3>�������� �������:</h3>
            <select name="subject">
            <option value="0" selected="selected" disabled="disabled">�������� �������</option>
            <?php
                foreach($MODULE_OUTPUT["subjects_list"] as $subject)
                {
                    ?>
                    <option value="<?=$subject["id"]?>"><?=$subject["name"]?></option>
                    <?php
                }
            ?>
            </select>
            <h3>�������� ���������</h3>
            <select name="faculty">
            <option value="0" selected="selected" disabled="disabled">�������� ���������</option>
            <?php
                foreach($MODULE_OUTPUT["faculty_list"] as $faculty)
                {
                    ?>
                    <option value="<?=$faculty["id"]?>"><?=$faculty["name"]?></option>
                    <?php
                }
            ?>
            </select>
            <h3>�������� ����:</h3>
            <select name="year">
            <?php
            for($i=1; $i<=6; $i++)
            {
                ?>
                <option value="<?=$i?>">���� <?=$i?></option>
                <?php
            }
            ?>
            </select>
            <h3>�������� �������������:</h3>
            <select name="teacher_id">
            <option value="0" selected="selected" disabled="disabled">�������� �������������</option>
            <?php
            foreach($MODULE_OUTPUT["teachers_list"] as $teacher)
            {
                ?>
                <option value="<?=$teacher["id"]?>"><?=$teacher["last_name"]?> <?=$teacher["name"]?> <?=$teacher["patronymic"]?></option>
                <?php
            }
            ?>
            </select>
            <h3>������ � (���) ��������:</h3>
            <input type="radio" name="type" value="2" checked="checked"/>������ � ��������<br />
            <input type="radio" name="type" value="0" />������ / �������� <input type="radio" name="type" value="1"/>
            <h3>� ������� (������ �������� ����� ����� � �������):</h3>
            <input type="text" name="groups" />
            <h3>� ���������� (������ �������� ����� ����� � �������):</h3>
            <input type="text" name="subgroups" />
            <h3>������ ��������� (�������� ����� ����� � �������):</h3>
            <input type="text" name="auditorium" />
            <h3>������� � ������ ��������:</h3>
            <input type="checkbox" name="rectors" /> ����������<br />
            <input type="checkbox" name="prorectors" /> �������������<br />
            <input type="checkbox" name="decanats" /> �����������<br />
            <input type="checkbox" name="academic_senate" />������� � ������ ������� ������ ����<br />
            <h3>�������� �� ������� ��������������:</h3>
            <input type="radio" name="state" value="0" />��� / �� <input type="radio" name="state" value="1" checked="checked"/>
            <h3>������ ���������� ������</h3>
            <select name="rate">
            <option selected="selected" value="0" disabled="disabled">�������� ������ ���������� ������</option>
            <?php
            foreach($rate as $r)
            {
                ?>
                <option value="<?=$r?>"><?=$r?></option>
                <?php
            }
            ?>
            </select>
            <h3>�������� ����������:</h3>
            <input type="text" name="comments" />
            <br />
            <input type="submit" value="��������" class="button" />
            </form>
            <?php
            }
        }
        if(isset($MODULE_OUTPUT["show_mode"]) && $MODULE_OUTPUT["show_mode"]=="edit")
        {
            $data = $MODULE_OUTPUT["edit_row"];
            ?>
            <h2>�������������� ������</h2>
            <form method="post" onsubmit="return sendform_sbd();">
            <input type="hidden" name="id" value="<?=$data["id"]?>">
            <h3>�������� �������:</h3>
            <select name="subject">
            <option value="0" selected="selected" disabled="disabled">�������� �������</option>
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
            <h3>�������� ���������</h3>
            <select name="faculty">
            <option value="0" selected="selected" disabled="disabled">�������� ���������</option>
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
            <h3>�������� ����:</h3>
            <select name="year">
            <?php
            for($i=1; $i<=6; $i++)
            {
                if($i == $data["year"])
                    {
                        ?>
                        <option selected="selected" value="<?=$i?>">���� <?=$i?></option>
                        <?php
                    }
                    else
                    {
                        ?>
                        <option value="<?=$i?>">���� <?=$i?></option>
                        <?php
                    }
            }
            ?>
            </select>
            <h3>�������� �������������:</h3>
            <select name="teacher_id">
            <option value="0" selected="selected">�������� �������������</option>
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
            <h3>������ � (���) ��������:</h3>
            <?php
            if(!$data["type"])
            {
                ?>
                <input type="radio" name="type" value="2"/>������ � ��������<br />
                <input type="radio" name="type" value="0" checked="checked"/>������ / �������� <input type="radio" name="type" value="1"/>
                <?php
            }
            else
            {
                if($data["type"] == 1)
                {
                    ?>
                    <input type="radio" name="type" value="2"/>������ � ��������<br />
                    <input type="radio" name="type" value="0" />������ / �������� <input type="radio" name="type" value="1" checked="checked"/>
                    <?php
                }
                else
                {
                    ?>
                    <input type="radio" name="type" value="2" checked="checked"/>������ � ��������<br />
                    <input type="radio" name="type" value="0" />������ / �������� <input type="radio" name="type" value="1"/>
                    <?php
                }
            }
            ?>
            <h3>� ������� (������ �������� ����� ����� � �������):</h3>
            <input type="text" name="groups" value="<?=$data["groups"]?>"/>
            <h3>� ���������� (������ �������� ����� ����� � �������):</h3>
            <input type="text" name="subgroups" value="<?=$data["subgroups"]?>" />
            <h3>������ ��������� (�������� ����� ����� � �������):</h3>
            <input type="text" name="auditorium" value="<?=$data["auditorium"]?>" />
            <h3>������� � ������ ��������:</h3>
            <input type="checkbox" name="rectors" <?php if($data["participation_rectors"]) {?> checked="checked" <?php } ?> /> ����������<br />
            <input type="checkbox" name="prorectors" <?php if($data["participation_prorectors"]) {?> checked="checked" <?php } ?>/> �������������<br />
            <input type="checkbox" name="decanats" <?php if($data["participation_decanats"]) {?> checked="checked" <?php } ?>/> �����������<br />
            <input type="checkbox" name="academic_senate" <?php if($data["participation_academic_senate"]) {?> checked="checked" <?php } ?>/>������� � ������ ������� ������ ����<br />
            <h3>�������� �� ������� ��������������:</h3>
            <?php
            if($data["state"])
            {
                ?>
                <input type="radio" name="state" value="0" />��� / �� <input type="radio" name="state" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="state" value="0" checked="checked"/>��� / �� <input type="radio" name="state" value="1"/>
                <?php    
            }
            ?>
            <h3>������ ���������� ������</h3>
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
            <h3>����������:</h3>
            <input type="text" name="comments" value="<?=$data["comments"]?>"/><br />
            <input type="submit" value="���������" class="button" />
            </form>
            <?php    
        }
        break;
    }

    case "timetable_graphics":
    {
        $month = array("������", "�������", "����", "������", "���", "����", "����", "������", "��������", "�������", "������", "�������");
        $months = array("������", "�������", "�����", "������", "���", "����", "����", "�������", "��������", "�������", "������", "�������");
        if(isset($MODULE_OUTPUT["calendar"]))
        {
            ?>
            <a href="<?=$MODULE_OUTPUT["calendar"]["back_link"]?>">��������� � ��������� �������</a>
            <h2>�������������� ���������</h2>
            <form method="post">
            <table class="graphics_table">
            <tr class="table_top"><th rowspan="2">� ������</th><th colspan="3">���� ������ ������</th><th colspan="3">���� ����� ������</th></tr>
            <tr class="table_top"><th>����</th><th>�����</th><th>���</th><th>����</th><th>�����</th><th>���</th></tr>
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
            <input type="submit" value="���������" class="button" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_list"]))
        {
            ?>
            <h1>������ ��������:</h1>
            <?php
            $i=-1;
            foreach($MODULE_OUTPUT["graphics_list"] as $graphic)
            {
                if($i==0 && $graphic["type"])
                {
                    ?>
                    <h3>������� ��� ���������</h3>
                    <?php
                    $i++;
                }
                if($i<0)
                {
                    ?>
                    <h3>������� ��� �������</h3>
                    <?php
                    $i++;
                }
                ?>
                <p><a href="<?=$graphic["id"]?>/"><?=$graphic["name"]?></a> [<a href="edit/<?=$graphic["id"]?>/">�������������</a>][<a href="delete/<?=$graphic["id"]?>/" onclick="return confirmSubmit()">�������</a>]</p>
                <?php
            }
            ?>
            <h2>�������� ������</h2>
            <form method="post">
            <h3>�������� �������:</h3>
            <input name="name" size="50" type="text"/><br />
            <h3>������ ��� ��������:</h3>
            <input type="radio" name="type" value="0" checked="checked"/> ������ / �������� <input type="radio" name="type" value="1"/>
            <h3>���� ������ ������:</h3>
            <select name="begin_day">
            <option value="0" selected="selected">����</option>
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
            <option value="0" selected="selected">�����</option>
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
            <option value="0" selected="selected">���</option>
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
            <h3>���� ��������� ������:</h3>
            <select name="end_day">
            <option value="0" selected="selected">����</option>
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
            <option value="0" selected="selected">�����</option>
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
            <option value="0" selected="selected">���</option>
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
            <input value="��������" type="submit" class="button"/>
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_list_data"]))
        {
            $data = $MODULE_OUTPUT["graphics_list_data"];
            ?>
            <h2>�������������� ����������� � �������:</h2>
            <form method="post">
            <h3>��������� �������:</h3>
            <input name="name" type="text" size="50" value="<?=$data["name"]?>"/> <br />
            <h3>������ ��� ��������:</h3>
            <?php
            if($data["type"])
            {
                ?>
                <input type="radio" name="type" value="0"/> ������ / �������� <input type="radio" name="type" value="1" checked="checked"/>    
                <?php
            }
            else
            {
            ?>
            <input type="radio" name="type" value="0" checked="checked"/> ������ / �������� <input type="radio" name="type" value="1"/>
            <?php
            }
            $begin_date = explode("-",$data["begin_session"]);
            $end_date = explode("-",$data["end_session"]);
            ?>
            <h3>���� ������ ������:</h3>
            <select name="begin_day">
            <option value="0" selected="selected">����</option>
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
            <option value="0" selected="selected">�����</option>
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
            <option value="0" selected="selected">���</option>
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
            <h3>���� ��������� ������:</h3>
            <select name="end_day">
            <option value="0" selected="selected">����</option>
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
            <option value="0" selected="selected">�����</option>
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
            <option value="0" selected="selected">���</option>
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
            <input type="submit" value="��������� ���������" class="button">
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["graphics_data"]))
        {
            ?>
            <h2>�������� ������� <?=$MODULE_OUTPUT["g_name"]?></h2>
            <a href="calendar/">���������</a>
            <?php                                       
            if(!empty($MODULE_OUTPUT["begin_session"]) && !empty($MODULE_OUTPUT["end_session"]))
            {
                $begin_date = explode("-",$MODULE_OUTPUT["begin_session"]);
                $end_date = explode("-",$MODULE_OUTPUT["end_session"]);
                ?>
                <h4><a href="<?=$MODULE_OUTPUT["uri"]?>edit/<?=$MODULE_OUTPUT["g_id"]?>/">������: � <?=$begin_date[2]?>/<?=$begin_date[1]?><?=$begin_date[0]?> �� <?=$end_date[2]?>/<?=$end_date[1]?>/<?=$end_date[0]?></a></h4>
                <?php
            }
            if(!$MODULE_OUTPUT["g_type"])
            {
            ?>
            <form name="graphics" method="post">
            <table class="graphics_table">
            <tr class="table_top"><th>�������</th><th>�-���</th><th>�������</th><th><img src="/gen_ru_img.php?text=�� �����&width=100"></th><th><img src="/gen_ru_img.php?text=���-�� ���������&width=200"></th>
            <th>��� �������</th><th class="groups"><img src="/gen_ru_img.php?text=���-�� ��.,�����.&width=200"></th><th>�<br />�<br />�<br />�<br />�<br /><br />�<br />�<br />�<br />�<br />�</th>
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
            <th>�<br />�<br />�<br />�<br />�<br />�<br />�</th><th>�<br />�<br />�<br />�<br />�<br />�<br />�<br />�<br />�</th>
            </tr>
            <?php
            foreach($MODULE_OUTPUT["graphics_data"] as $data)
            {
                $department = str_replace("������� ", "", $data["department_name"]);
                ?>
                <tr>
                <td rowspan="2"><a href="edit/<?=$data["id_graphic"]?>/"><?=$department?></a></td><td rowspan="2"><span title="<?=$data["faculty_name"]?>"><?=$data["faculty_short_name"]?></span></td>
                <td rowspan="2"><?=$data["subject_name"]?><br /><span title="�������"><a href="delete/<?=$data["id_graphic"]?>/" onclick="return confirmSubmit()"><img src="/themes/styles/delete.png"></a></span></td>
                <td rowspan="2">
                <?php
                foreach($data["groups"] as $group)
                {
                    echo $group["group_name"]."; ";
                }
                ?>
                </td>
                <td rowspan="2"><?=$data["sum_students"]?></td>
                <td colspan="2">���</td><td><?=$data["lecture_hours"]?></td>
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
                    echo "�����";
                }
                else
                {
                    echo "�����";
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
            <input type="submit" value="��������� ���������" class="button" />
            </form>
            <?php
            }
            else
            {
                ?>
                <form name="graphics" method="post">
                <table class="graphics_table">
                <tr class="table_top"><th>�������</th><th>�������</th><th><img src="/gen_ru_img.php?text=�� �����&width=100"></th><th><img src="/gen_ru_img.php?text=���-�� ���������&width=200"></th>
                <th>��� �������</th><th class="groups"><img src="/gen_ru_img.php?text=���-�� ��.,�����.&width=200"></th><th>�<br />�<br />�<br />�<br />�<br /><br />�<br />�<br />�<br />�<br />�</th>
                <th>��</th><th>��</th>    
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
                <th>�<br />�<br />�<br />�<br />�.</th><th>�<br />�<br />�<br />�.</th>
                <th>�<br />�<br />�<br />�<br />�<br />�<br />�</th><th>�<br />�<br />�<br />�<br />�<br />�<br />�<br />�<br />�</th>
                </tr>
                <?php
            foreach($MODULE_OUTPUT["graphics_data"] as $data)
            {
                $department = str_replace("������� ", "", $data["department_name"]);
                ?>
                <tr>
                <td rowspan="2"><a href="edit/<?=$data["id_graphic"]?>/"><?=$department?></a></td>
                <td rowspan="2"><?=$data["subject_name"]?><br /><span title="�������"><a href="delete/<?=$data["id_graphic"]?>/" onclick="return confirmSubmit()"><img src="/themes/styles/delete.png"></a></span></td>
                <td rowspan="2">
                <?php
                foreach($data["groups"] as $group)
                {
                    echo $group["group_name"]."; ";
                }
                ?>
                </td>
                <td rowspan="2"><?=$data["sum_students"]?></td>
                <td colspan="2">���</td><td><?=$data["lecture_hours"]?></td>
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
                    echo "�����";
                }
                else
                {
                    echo "�����";
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
                <input type="submit" value="��������� ���������" class="button"/>
                </form>
            <?php
            }
            ?>
            <h2>�������� ����� ������ � ������</h2>
            <form method="post" name="new_graphic" onsubmit=" return sendform_graphics();">
            <h3>�������� �������</h3>
            <select name="subject_id">
            <option value="0" selected="selected" disabled="disabled">�������� �������</option>
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
            <h3>������� ������ ����� (����� ������ ������ �������� ����� � �������):</h3>
            <input name="groups" />
            <h3>��� �������:</h3>
            <input type="radio" value="0" checked="checked" name="type" /> ��������� / ������������
            <input type="radio" value="1" name="type" />
            <h3>���������� ����� (��� ��������, ���� ������� ������������)</h3>
            <input type="text" name="kol_groups" / value="1">
            <h3>���������� ����� �� �������:</h3>
            <input type="text" name="lecture_hours" value="0"/> ����������<br />
            <input type="text" name="practice_hours" value="0"/> ������������ �������
            <?php
            if($MODULE_OUTPUT["g_type"])
            {
            ?>
            <h3>���������� ������������ �������:</h3>
            <input type="text" name="ust_lecture" value="0"/> ������������ ������ (��)<br />
            <input type="text" name="ust_practice" value="0"/> ������������ �������� (��)
            <h3>��������, ���� ����:</h3>
            <input type="checkbox" name="Contr"> ����������� <br />
            <input type="checkbox" name="Curse"> �������� <br />
            <?php
            }
            ?>
            <h3>�������� ��� ����������:</h3>
            <input type="radio" value="0" checked="checked" name="attestation_type" /> ������� / �����
            <input type="radio" value="1" name="attestation_type" /> <br />
            <input type="submit" value="�������� ������" class="button" />
            </form>
            <?php
        }
        if(isset($MODULE_OUTPUT["edit_graphic"]))
        {
            $data = $MODULE_OUTPUT["edit_graphic"];
            ?>
            <h2>�������������� ������� <?=$data["g_name"]?></h2>
            <form method="post" onsubmit=" return sendform_graphics();">
            <h3>�������:</h3>
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
            <h3>������ �����:</h3>
            <?php
            $groups_list=null;
            foreach($data["groups"] as $group)
            {
                $groups_list = $groups_list.$group["group_name"].";";
            }
            ?>
            <input type="text" name="groups" value="<?=$groups_list?>" />
            <h3>��� �������:</h3>
            <?php
            if($data["type"])
            {
                ?>
                <input type="radio" name="type" value="0" /> ��������� / ������������ <input type="radio" name="type" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="type" value="0" checked="checked"/> ��������� / ������������ <input type="radio" name="type" value="1"/>
                <?php
            }
            ?>
            <h3>���������� ����� (��� ��������, ���� ������� ������������):</h3>
            <input type="text" name="kol_groups" value="<?=$data["kol_groups"]?>" />
            <h3>���������� ����� �� �������:</h3>
            <input type="text" name="lecture_hours" value="<?=$data["lecture_hours"]?>" /> ����������<br />
            <input type="text" name="practice_hours" value="<?=$data["practice_hours"]?>" />������������
            <?php
            if($data["g_type"])
            {
            ?>
            <h3>���������� ������������ �������:</h3>
            <input type="text" name="ust_lecture" value="<?=$data["ust_lecture"]?>"/> ������������ ������ (��)<br />
            <input type="text" name="ust_practice" value="<?=$data["ust_practice"]?>"/> ������������ �������� (��)
            <h3>��������, ���� ����:</h3>
            <?php
            if($data["Contr"])
            {
                ?>
                <input type="checkbox" name="Contr" checked="checked"> ����������� <br />
                <?php
            }
            else
            {
                ?>
                <input type="checkbox" name="Contr"> ����������� <br />
                <?php
            }
            if($data["Curse"])
            {
                ?>
                <input type="checkbox" name="Curse" checked="checked"> �������� <br />
                <?php
            }
            else
            {
                ?>
                <input type="checkbox" name="Curse"> �������� <br />
                <input type="checkbox" name="Curse"> �������� <br />
                <?php
            }
            ?>
            <?php
            }
            ?>
            <h3>�������� ��� ����������:</h3>
            <?php
            if($data["attestation_type"])
            {
                ?>
                <input type="radio" name="attestation_type" value="0" /> ������� / ����� <input type="radio" name="attestation_type" value="1" checked="checked"/>
                <?php
            }
            else
            {
                ?>
                <input type="radio" name="attestation_type" value="0" checked="checked"/> ������� / ����� <input type="radio" name="attestation_type" value="1"/>
                <?php
            }
            ?>
            <br />
            <input type="submit" value="��������� ���������" class="button" />
            </form>
            <?php
        }
        break;
    }
}

?>