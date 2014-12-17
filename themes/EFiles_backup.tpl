<?php

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

if (($MODULE_DATA["output"]["mode"]=="link_to_file" || $MODULE_DATA["output"]["mode"]=="get_file") && !$MODULE_DATA["output"]["allow_download"])
	echo "<b>Недостаточно прав для скачивания файлов</b>";
	
elseif (($MODULE_DATA["output"]["mode"]!="link_to_file" && $MODULE_DATA["output"]["mode"]!="get_file" && $MODULE_DATA["output"]["mode"]=="files_list") && !isset($_SESSION["user_id"]))
	//echo $MODULE_DATA["output"]["mode"];
	echo "<b>Работа с файлами доступна только авторизованным пользователям</b>";

else
{
	switch ($MODULE_DATA["output"]["mode"])
	{
		case "files_list":
		if (isset($MODULE_DATA["output"]["files_list"]))
        {
            ?>            
            <fieldset>
            <legend>Ваши файлы:</legend>
            <ul>
            <?php
		    foreach ($MODULE_DATA["output"]["files_list"] as $file)
            {
			    echo "<li><a href=\"/file/".$file["id"]."/\" title=\"".$file["descr"]."\">".$file["name"]."</a> <input type=\"text\" size=\"40\" value=\"http://".$_SERVER["SERVER_NAME"]."/file/".$file["id"]."/\" readonly>";
			    if (isset($file["subjlist"])) {
				    echo " (";
				    $i = 0;
				    foreach ($file["subjlist"] as $subj) {
					    if ($i == sizeof($file["subjlist"])-1)
						    echo "<a href=\"/subjects/".$subj["id"]."/\">".$subj["name"]."</a> [<small><a href=\"/office/?del_subj=".$subj["id"]."&del_file=".$file["id"]."\">удалить</a></small>]";
					    else
						    echo "<a href=\"/subjects/".$subj["id"]."/\">".$subj["name"]."</a> [<small><a href=\"/office/?del_subj=".$subj["id"]."&del_file=".$file["id"]."\">удалить</a></small>]".", ";
					    $i++;
				    }
				    echo ")";
			    }
                ?>
			    <a title="Удалить" href="/office/?delete_file=<?=$file["id"]?>" onclick="if(!window.confirm('Вы уверены, что хотите удалить файл <?=$file["name"]?>?')) return false;"><img style="margin-top: 3px;" src="/themes/images/delete.png"></a>
                <?php
		    }
            ?>
            </ul>
            </fieldset>
            <?php            
        }		
//		echo '<a href="#" id="demo-attach">Attach a file</a><ul id="demo-list"></ul><a href="#" id="demo-attach-2" style="display: none;">Attach another file</a>';
		//print_r($EE);

		if (isset($_SESSION["user_id"]))
		echo '<h2>Добавить файл</h2><br />Максимальный размер файла: '.$MODULE_DATA["output"]["maxsize"].'<form action="/office/" method="post" enctype="multipart/form-data"><p>Путь:<br><input type="file" name="upload_file" size="40"></p>
		<p>Описание:<br /><input type="text" name="upload_descr" wrap="virtual" size="50" /></p>
		<input type="submit" size="20" value="Готово"><br><br>';
			break;
			
		case "attach_file":
		if (isset($MODULE_DATA["output"]["files_list"]) && $MODULE_DATA["output"]["allow_attach"]) {
		echo '<h2>Привязать файл к предмету</h2><form action="/office/" method="post"><p>Файл:<br><select name="sel_file" size="1"><option></option>';
		
			foreach ($MODULE_DATA["output"]["files_list"] as $file) {
				echo '<option value="'.$file["id"].'">'.$file["name"].'</option>';
			}
			echo '</select></p><p>Предмет:<br><select name="sel_subject" size="1"><option></option>';
			if (isset($MODULE_DATA["output"]["subjects_list"]))
			foreach ($MODULE_DATA["output"]["subjects_list"] as $subject) {
				echo '<option value="'.$subject["id"].'">'.$subject["name"].'</option>';
			}

			echo '</select></p><p><input type="submit" value="Привязать"></p>';
		}
			break;
			
		case "get_file":
			break;
			
		case "link_to_file":
		echo '<br /><b>'.$MODULE_DATA["output"]["file"]["name"].'.'.$MODULE_DATA["output"]["file"]["filename"].'</b><br />'.$MODULE_DATA["output"]["file"]["descr"].'<br />'.$MODULE_DATA["output"]["filesize"].'<br /><br /><a href="/file/'.$MODULE_DATA["output"]["file_id"].'/?get='.md5(time()).'"><b>СКАЧАТЬ</b></a>';
			break;
	}
	
}

/*	elseif ($MODULE_DATA["output"]["mode"]=="get_file" || $MODULE_DATA["output"]["mode"]=="link_to_file")
		echo "<b>Работа с файлами доступна только авторизованным пользователям</b>";*/

?>