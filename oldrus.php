<html>
<body>
<form action="oldrus.php" method="post">
<textarea name="source" cols="50" rows="10"></textarea>
<input type="submit" value="����������� ��-������" />
</form>
</body>
</html>

<?php

	setlocale(LC_ALL, 'ru_RU.CP1251');

	if (isset($_POST["source"]))
		echo IntoOldRussian($_POST["source"]);
	
	function IntoOldRussian ($string) {
		$vowels = array("�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�");
		$consonants = array("�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�", "�");
		$pointings = array(",", ".", "-", "/", ":", "+", "&", "!", "?", " ");
		$fita_roots =	array(
						"������",
						"������", "����", "����", "����", "������", "������", "��������", "����",
						"�������", "��������", "���������", "��������", "������", "����������", "������", "�����", "�������", "�����",
						"��������", "�������", "���", "��������", "������������", "�������", "�������", "�����", "����", "����", "������", "���"
						);
						
		foreach ($fita_roots as $root) {;
			$root[0] = strtoupper($root[0]);
			$fr_with_title[] = $root;
		}
		
		$consonants_no_yat = array("�", "�", "�", "�", "�", "�", "�");
		
		for ($key=0; $key<=strlen($string); $key++) {
			$sign = $string[$key];
			switch ($sign) {
				case "�":
				case "�":
					
					if (InArrayWithReg($string[$key+1], $vowels)) {
						if ($sign == "�")
							$string[$key] = "i";
						else
							$string[$key] = "I";
					}
					
					if ($string[$key+1] == "�" && (in_array($string[$key+2], $pointings) || $string[$key+2] == " "))
						$string[$key+1] = "�";
				break;
				
				case "�":
					if ($string[$key+1] == "�" && (in_array($string[$key+2], $pointings) || $string[$key+2] == " "))
						$string[$key+1] = "�";
				break;
				
				case "�":
				case "�":
					$word = GetWord($string, $key);
					//if (strstr("fdg��������", "������")) die($word);
					$change = 0;
					
					foreach ($fita_roots as $root)
						if (stristr($word, $root))
							$change = 1;
							
					foreach ($fr_with_title as $root)
						if (stristr($word, $root))
							$change = 1;		
						
					if ($change) {
						if ($sign == "�")
							$string = substr($string, 0, $key)."&#1138;".substr($string, $key+1, strlen($string)-1);
						else
							$string = substr($string, 0, $key)."&#1139;".substr($string, $key+1, strlen($string)-1);
					}
					
					if (InArrayWithReg($sign, $consonants) && in_array($string[$key+1], $pointings)) {
						$string = substr($string, 0, $key+1)."�".substr($string, $key+1, strlen($string)-1);
					}
				break;
				
				case "�":
				case "�":
					$word = GetWord($string, $key);
					
					$change = 0;
					
					if ($string[$key-1] == ";" || $string[$key-1] == "�")
						$change = 0;
					elseif (substr($word, 0, 3) == "���" || substr($word, 0, 3) == "���")
						$change = 1;
					elseif ($word == "��" || $word == "��" || $word == "��" || $word == "��")
						$change = 0;
					elseif (in_array($string[$key+1], $pointings) || $string[$key+2] == " ")
						$change = 1;
					elseif (InArrayWithReg($string[$key-1], $consonants_no_yat))
						$change = 0;
					elseif (($string[$key+1] == "�" || $string[$key+1] == "�" || $string[$key+1] == "�") && !in_array($string[$key-1], $pointings) && !in_array($string[$key-2], $pointings) && !in_array($string[$key+2], $pointings) && $string[$key-1] != " " && $string[$key-2] != " " && $string[$key+2] != " ")
						$change = 0;
					elseif ($string[$key+1]=="�" && $string[$key+2]=="�" && ($string[$key-1] != "�" && !($string[$key+3] == "�"  && $string[$key+3] == "�") && $string[$key-1] != "�"))
						$change = 0;
					elseif ($string[$key-1] == "�" || $string[$key-1] == "�" && ($string[$key+1] == "�" || $string[$key+1] == "�") && strlen($word) > 6) {
						//$string = substr($string, 0, $key+1)."�".substr($string, $key+2, strlen($string)-1);
						$string[$key+1] = "�";
						$change = 0;
					}
					else
						$change = 1;

					if ($change) {
						if ($sign == "�")
							$string = substr($string, 0, $key)."&#1122;".substr($string, $key+1, strlen($string)-1);
						else
							$string = substr($string, 0, $key)."&#1123;".substr($string, $key+1, strlen($string)-1);
					}
				break;
				
				default:
					if (InArrayWithReg($sign, $consonants) && in_array($string[$key+1], $pointings))
						$string = substr($string, 0, $key+1)."�".substr($string, $key+1, strlen($string)-1);
				break;
			}
		}
		
		return $string;
	}
	
	
	function GetWord ($string, $key) {		//�������� ������� �����, � ������� ���������
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
	
	//echo IntoOldRussian("����� ������������� �������� ������� �� ������� � ��� �������������� ������� ������������ �����. ���� Ը��� ��� ���������� ���������, ���� � �� �������-�� ��������. ��������, ������ ��, �� ���������� ����������.");
?>