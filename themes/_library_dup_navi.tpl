<?php

if (count($EE["footsteps"]) >= 4) {

	$array = $EE["footsteps"];
  $ind= - 1;
	do {
		$ind++;
	} while ($EE["footsteps"][$ind]['uri']!= $MODULE_OUTPUT['folder_uri']);
	$array = array_slice($EE["footsteps"], -$ind+2);
  
	//$array[0]['title'] = 'Главная'; 
	
	$num = count($array);
	$i = 0;
	$array2 = array();

	foreach ($array as $data) {
		if (!$data["is_hidden"]) {
			$flag = (++$i == $num);
			$flag2 =  CF::URIis($data["uri"]);
			$elem = "";
//			$elem = "<span>";
//			$elem = $flag ? "</span>" : "";
			$elem .= $flag2 ? "<strong>" : "<a href=\"{$data["uri"]}\" title=\"{$data["descr"]}\">";
			$elem .= $data["title"];
			$elem .= $flag2 ? "</strong>" : "</a>";
//			$elem .= $flag ? "" : "";
			$elem .= $flag ? "" : " &nbsp;/&nbsp; ";
//			$elem .= "</span>";
			$elem .= $flag ? "" : " ";
			$array2[] = $elem;
		} else {
			break;
		}
	}
	
}

	echo "<div id=\"footsteps\">" . implode("", $array2) . "</div>";


?>