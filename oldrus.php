<html>
<body>
<form action="oldrus.php" method="post">
<textarea name="source" cols="50" rows="10"></textarea>
<input type="submit" value="Изъясниться по-русски" />
</form>
</body>
</html>

<?php

	setlocale(LC_ALL, 'ru_RU.CP1251');

	if (isset($_POST["source"]))
		echo IntoOldRussian($_POST["source"]);
	
	function IntoOldRussian ($string) {
		$vowels = array("а", "е", "ё", "и", "й", "о", "у", "ы", "э", "ю", "я");
		$consonants = array("б", "в", "г", "д", "ж", "з", "к", "л", "м", "н", "п", "р", "с", "т", "ф", "х", "ц", "ш", "щ", "ч");
		$pointings = array(",", ".", "-", "/", ":", "+", "&", "!", "?", " ");
		$fita_roots =	array(
						"кафедр",
						"анафем", "скиф", "эфир", "агаф", "афанас", "голгоф", "карфаген", "афин",
						"апофеоз", "апофегма", "арифметик", "дифирамб", "ефимон", "кафолическ", "кафизм", "кифар", "левіафан", "фёдор",
						"логарифм", "марафон", "миф", "мифологи", "монофелитств", "орфогра", "орфоэпи", "пафос", "рифм", "эфир", "фимиам", "фит"
						);
						
		foreach ($fita_roots as $root) {;
			$root[0] = strtoupper($root[0]);
			$fr_with_title[] = $root;
		}
		
		$consonants_no_yat = array("ж", "ч", "ш", "щ", "г", "х", "к");
		
		for ($key=0; $key<=strlen($string); $key++) {
			$sign = $string[$key];
			switch ($sign) {
				case "и":
				case "И":
					
					if (InArrayWithReg($string[$key+1], $vowels)) {
						if ($sign == "и")
							$string[$key] = "i";
						else
							$string[$key] = "I";
					}
					
					if ($string[$key+1] == "е" && (in_array($string[$key+2], $pointings) || $string[$key+2] == " "))
						$string[$key+1] = "я";
				break;
				
				case "ы":
					if ($string[$key+1] == "е" && (in_array($string[$key+2], $pointings) || $string[$key+2] == " "))
						$string[$key+1] = "я";
				break;
				
				case "ф":
				case "Ф":
					$word = GetWord($string, $key);
					//if (strstr("fdgкафедрев", "кафедр")) die($word);
					$change = 0;
					
					foreach ($fita_roots as $root)
						if (stristr($word, $root))
							$change = 1;
							
					foreach ($fr_with_title as $root)
						if (stristr($word, $root))
							$change = 1;		
						
					if ($change) {
						if ($sign == "Ф")
							$string = substr($string, 0, $key)."&#1138;".substr($string, $key+1, strlen($string)-1);
						else
							$string = substr($string, 0, $key)."&#1139;".substr($string, $key+1, strlen($string)-1);
					}
					
					if (InArrayWithReg($sign, $consonants) && in_array($string[$key+1], $pointings)) {
						$string = substr($string, 0, $key+1)."ъ".substr($string, $key+1, strlen($string)-1);
					}
				break;
				
				case "е":
				case "Е":
					$word = GetWord($string, $key);
					
					$change = 0;
					
					if ($string[$key-1] == ";" || $string[$key-1] == "ы")
						$change = 0;
					elseif (substr($word, 0, 3) == "хер" || substr($word, 0, 3) == "Хер")
						$change = 1;
					elseif ($word == "же" || $word == "Же" || $word == "не" || $word == "Не")
						$change = 0;
					elseif (in_array($string[$key+1], $pointings) || $string[$key+2] == " ")
						$change = 1;
					elseif (InArrayWithReg($string[$key-1], $consonants_no_yat))
						$change = 0;
					elseif (($string[$key+1] == "н" || $string[$key+1] == "с" || $string[$key+1] == "р") && !in_array($string[$key-1], $pointings) && !in_array($string[$key-2], $pointings) && !in_array($string[$key+2], $pointings) && $string[$key-1] != " " && $string[$key-2] != " " && $string[$key+2] != " ")
						$change = 0;
					elseif ($string[$key+1]=="л" && $string[$key+2]=="е" && ($string[$key-1] != "т" && !($string[$key+3] == "г"  && $string[$key+3] == "ж") && $string[$key-1] != "ж"))
						$change = 0;
					elseif ($string[$key-1] == "б" || $string[$key-1] == "Б" && ($string[$key+1] == "с" || $string[$key+1] == "з") && strlen($word) > 6) {
						//$string = substr($string, 0, $key+1)."з".substr($string, $key+2, strlen($string)-1);
						$string[$key+1] = "з";
						$change = 0;
					}
					else
						$change = 1;

					if ($change) {
						if ($sign == "Е")
							$string = substr($string, 0, $key)."&#1122;".substr($string, $key+1, strlen($string)-1);
						else
							$string = substr($string, 0, $key)."&#1123;".substr($string, $key+1, strlen($string)-1);
					}
				break;
				
				default:
					if (InArrayWithReg($sign, $consonants) && in_array($string[$key+1], $pointings))
						$string = substr($string, 0, $key+1)."ъ".substr($string, $key+1, strlen($string)-1);
				break;
			}
		}
		
		return $string;
	}
	
	
	function GetWord ($string, $key) {		//получаем целиком слово, в котором находимся
		$cur = $key;
		
		while (!in_array($string[$cur-1], $pointings) && $string[$cur-1] != " " && $cur)
			$cur--;
		$word_begin = $cur;

		$cur = $key;
		while (!in_array($string[$cur-1], $pointings) && $string[$cur+1] != " " && $cur < strlen($string))
			$cur++;
		$word_end = $cur;
					
		$word = array();

		for ($cur = $word_begin; $cur <= $word_end; $cur++)
			$word[] = $string[$cur];
			
		return implode($word);
	}
	
	
	function InArrayWithReg ($needle, $haystack) {
		foreach ($haystack as $hay)
			$haystack_title[] = strtoupper($hay);
			
		if (in_array($needle, $haystack))
			return 1;
		elseif (in_array($needle, $haystack_title))
			return 2;
		else
			return false;
	}
	
	//echo IntoOldRussian("Иосиф Александрович Бродский работал на кафедре и был совершеннейшим образом бессовестным типом. Зато Фёдор был прекрасным человеком, хоть и не слишком-то одарённым. Окаянные, кричал он, не соблюдаете орфографию.");
?>