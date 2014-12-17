<?php
switch($MODULE_OUTPUT["mode"])
{
	case "cloud":
		if(!empty($MODULE_OUTPUT["tags"]))
		{

            echo "<h2><a href=\"/tag/\" title=\"Показать все метки\">Метки:</a></h2>\n";			
			$min = $MODULE_OUTPUT["min"];
			$max = $MODULE_OUTPUT["max"];
			echo "<div id=\"tags\">";
			$minSize = 70;
    		$maxSize = 150;
			foreach($MODULE_OUTPUT["tags"] as $tag => $num)
			{
				if ($min == $max)
                	$fontSize = round(($maxSize - $minSize) / 2 + $minSize);
				else
					$fontSize = round((($num - $min)/($max - $min)) * ($maxSize - $minSize) + $minSize);
				if($num > 1)
                    echo "<a href=\"/tag/".$tag."\" title=\"".$num."\" style=\"font-size:".$fontSize."%\">".$tag."(".$num.") </a>";
			}	
			echo "</div>\n";
            echo "<h3><a href=\"/tag/\">Все метки</a></h3>";        
		};
		break;
	case "tag":
        if($MODULE_OUTPUT["posts"])
        {
			echo "Материалы с меткой <strong>&laquo;".$MODULE_OUTPUT["tag"]."&raquo;</strong>:";
			foreach ($MODULE_OUTPUT["posts"] as $post)
			{
				echo "<h3>".$post["cache_title"]."</h3>\n
					<p>".$post["cache_short"]."</p>\n";
				echo "<strong class=\"hotnew\"><a href=\"".$post["link_suffix"]."\" title=\"Читать подробнее\">Подробнее…</a></strong>";
			}
        }
        else {
            if(isset($MODULE_OUTPUT["tags"]))
            {         
            $min = $MODULE_OUTPUT["min"];
            $max = $MODULE_OUTPUT["max"];
            echo "<div id=\"tags\">";
            $minSize = 100;
            $maxSize = 700;
            foreach($MODULE_OUTPUT["tags"] as $tag => $num)
            {
                if ($min == $max)
                    $fontSize = round(($maxSize - $minSize) / 2 + $minSize);
                else
                    $fontSize = round((($num - $min)/($max - $min)) * ($maxSize - $minSize) + $minSize);
                echo "<a href=\"/tag/".$tag."\" title=\"".$num."\" style=\"font-size:".$fontSize."%\" class=\"tags\">".$tag."(".$num.")</a> ";
            }    
            echo "</div>\n";
            }    
        }
		break;
    case "tags":
        if(!empty($MODULE_OUTPUT["tags"]["firms"]))
        {
            echo "<div class=\"message\">";
            echo "<ul>";
            foreach($MODULE_OUTPUT["tags"]["firms"] as $tag)
            {
                echo "<li><a href=\"/service/?service=".$tag->id."\">".$tag->name."</a></li>";    
            }
            echo "</ul>";
            echo "</div>";            
        }
        unset($_SESSION['tags']);
        session_unregister('tags');
        break;
}
?>