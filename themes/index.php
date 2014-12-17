<?php 

if (!$conf = parse_ini_file('config.ini', true)) 
{
	exit("Нету ничего почему-то... :(");
}

include("classes/CF.class");
include $conf['db_conf']['adapter_path'];


$DBHandler = new $conf['db_conf']['adapter_class'](
	$conf['db_conf']['host'], 
	$conf['db_conf']['user'], 
	$conf['db_conf']['pass'], 
	$conf['db_conf']['name'], 
	$conf['db_conf']['port'], 
	2
	);  

$SCRIPTS_DIR = 	$conf['pathes']['scripts_include'];
$IMAGES_DIR = 	$conf['pathes']['images_include'];
	
if (isset($_REQUEST["ajax"]) && !empty($_REQUEST["ajax"])) 
{
	include $conf['include_path']."ajax.php";
	echo Ajax::getResponse($_REQUEST["ajax"]);
}
else 
{
	include $conf['pathes']['classes_include']."MapHandler.class";
	$mapInfo = MapHandler::getMapInfo($DBHandler);
	include "templates/main.tpl";
}


?>