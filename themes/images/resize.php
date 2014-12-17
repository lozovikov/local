<?php

if(!isset($_GET['w'])) $_GET['w'] = 90; 
$img1 = imagecreatefrompng($_GET['img']);
$img = imagecreatetruecolor($_GET['w'], $_GET['w']/*imagesx($img1), imagesy($img1)*/);

$white = imagecolorallocatealpha($img, 255,255,255, 100);
imagefill($img,1,1,$white);
//imagecolortransparent($img, $white); 
imagecopyresampled($img, $img1,0,0,0,0,$_GET['w'],$_GET['w'],imagesx($img1),imagesy($img1));
header("Content-type: image/png");
imagesavealpha($img, true);
imagepng($img);
//imagepng($img,$_GET['w'].'_'.$_GET['img']);

?>