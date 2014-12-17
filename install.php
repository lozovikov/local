<?php
// Модуль инсталляции
// version: 1.0
// date: 2012-04-13


$destFolder = "scripts";
$destFile = "ee.zip";

$zip = new ZipArchive();
$zip->open($destFile);
if ($zip->extractTo($destFolder))
	echo 'Готово!';
else 
	echo 'Распаковки во время ошибка возникла!';


?>