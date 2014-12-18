<?
header('Content-Type: text/html; charset= utf-8');
$file = 'offers.xml';
$xml = simplexml_load_file($file);
echo '<pre>';
print_r($xml);
//$attr = iconv('windows-1251', 'utf-8', 'ПакетПредложений');
//print_r($xml->$attr);
echo '</pre>';


?>