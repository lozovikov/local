<?php

$data = $MODULE_DATA["output"];


if (!$image = @imagecreate($data["length"] * 20, 20))
{
	die("Cannot initialize image stream!");
}


imagefill($image, 0, 0, imagecolorallocate($image, 232, 238, 247));

//создаём шум на фоне
for ($i = 0; $i <= 128; $i++)
{
	imagesetpixel($image, rand(2, 80), rand(2, 20), imagecolorallocate($image, rand(0, 255), rand(0, 255), rand(0, 255))); //рисуем пиксель
}

//выводим символы кода
for ($i = 0; $i < strlen($data["code"]); $i++)
{
	$x = 5 + $i * 20;
	$y = rand(1, 6);
	imagechar ($image, 5, $x, $y, $data["code"][$i], imagecolorallocate($image, rand(0, 255), rand(0, 128), rand(0, 255)));
}


//антикеширование
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: no-store, no-cache, must-revalidate");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");


//создание рисунка в зависимости от доступного формата
if (function_exists("imagepng"))
{
   header("Content-type: image/png");
   imagepng($image);
}

elseif (function_exists("imagegif"))
{
   header("Content-type: image/gif");
   imagegif($image);
}

elseif (function_exists("imagejpeg"))
{
   header("Content-type: image/jpeg");
   imagejpeg($image);
}

else
{
   die("No image support in this server!");
}


imagedestroy ($image);

?>