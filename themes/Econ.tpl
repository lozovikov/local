 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">   
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru">
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
	<meta http-equiv="Content-Language" content="ru">
	<meta name="description" content="<?=$EE["meta_descr"]?>" />
	<meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
	<!--mstheme--><link rel="stylesheet" type="text/css" href="/themes/styles/econfac.css"><meta name="Microsoft Theme" content="nature 1011">
	<meta name="Microsoft Border" content="tlb, default">
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<?
if (!AT_HOME)
{	
	if (!defined('_SAPE_USER'))
		define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
    require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
    $sape = new SAPE_client();
}
?>
<body><!--msnavigation--><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>

<table border="0" width="100%" id="table1" height="129">
	<tr>
		<td rowspan="2">
		<img border="0" src="/themes/images/econfac/fotouni.jpg" width="111" height="91"></td>
		<td width="1055" height="63">
		<p align="center"><b><font color="#0000FF" size="4">ФГОУ ВПО 
		НОВОСИБИРСКИЙ ГОСУДАРСТВЕННЫЙ АГРАРНЫЙ УНИВЕРСИТЕТ</font></b></p>
		<p align="center"><b><font color="#0000FF" size="4">ЭКОНОМИЧЕСКИЙ 
		ИНСТИТУТ</font></b></td>
		<td width="4" rowspan="2">

		<img height="94" alt="Герб Новосибирской области" src="/themes/images/econfac/gerbnso1.png" width="90"></td>
	</tr>
	<tr>
		<td width="1055" height="26">
		<marquee bgcolor="#00FF00" height="24">Экономический институт работает с понедельника по субботу, выходной - воскресенье.</marquee></td>
	</tr>
	<tr>
		<td height="27">&nbsp;</td>

<!--		<td width="1055" height="27">
		<p align="center">
		<a href="index.htm"><img src="/themes/images/econfac/home_cmp_Radial000_gbtn.gif" width="95" height="20" border="0" alt="Домашняя" align="middle"></a> <a href="feedback.htm"><img src="/themes/images/econfac/feedback.htm_cmp_Radial000_gbtn.gif" width="95" height="20" border="0" alt="Гостевая книга" align="middle"></a> <a href="search.htm"><img src="/themes/images/econfac/search.htm_cmp_Radial000_gbtn.gif" width="95" height="20" border="0" alt="Форма поиска" align="middle"></a> <a href="prod05.htm"><img src="/themes/images/econfac/prod05.htm_cmp_Radial000_gbtn.gif" width="95" height="20" border="0" alt="Карта сайта" align="middle"></a> <a href="question4.htm"><img src="/themes/images/econfac/question4.htm_cmp_Radial000_gbtn.gif" width="95" height="20" border="0" alt="Обратная связь" align="middle"></a></td>
		<td width="4" height="27">&nbsp;</td>-->
	</tr>
</table>

</td></tr><!--msnavigation--></table><!--msnavigation--><table dir="ltr" border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td valign="top" width="1%">


<p>&nbsp;</p>
<p>
<script language="JavaScript"><!--
MSFPhover = 
  (((navigator.appName == "Netscape") && 
  (parseInt(navigator.appVersion) >= 3 )) || 
  ((navigator.appName == "Microsoft Internet Explorer") && 
  (parseInt(navigator.appVersion) >= 4 ))); 
function MSFPpreload(img) 
{
  var a=new Image(); a.src=img; return a; 
}
// --></script>
<div id="econleftmenu"><?php
					$NODEGROUP = "submenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?></div>
<p align="center">
<script>
//document.write( '<a href="http://www.informer.ru/cgi-bin/redirect.cgi?id=172_1_1_45_39_1-0&url=http://www.rbc.ru&src_url=usd/usd_dm_cb_127815_88x61.gif" target="_blank"><img src="http://pics.rbc.ru/img/grinf/usd/usd_dm_cb_127815_88x61.gif?'+ Math.floor( 100000*Math.random() ) + '" WIDTH=88 HEIGHT="61" border=0></a>');
</script>
</p><!--
<p align="center"><b><a href="/econ/vypusk/">Выпускники</b></p>
--><p align="center">

<!-- 
<script LANGUAGE="JavaScript" TYPE="text/javascript" src="http://www.informer.ru/js/weather_eye_01/273.js">
</script>
-->
    <!--LiveInternet counter--><script type="text/javascript"><!--
    //document.write("<a href='http://www.liveinternet.ru/click' "+
    document.write("<a href='http://www.liveinternet.ru/stat/portal.nsau.edu.ru/' "+
    "target=_blank><img src='http://counter.yadro.ru/hit?t23.14;r"+
    escape(document.referrer)+((typeof(screen)=="undefined")?"":
    ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
    screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
    ";h"+escape(document.title.substring(0,80))+";"+Math.random()+
    "' alt='' title='LiveInternet: показано число посетителей за"+
    " сегодня' "+
    "border='0' width='88' height='15'><\/a>")
    //--></script><!--/LiveInternet-->

</p>

</td><td valign="top" width="24"></td><!--msnavigation--><td valign="top">

<div id="dup_navi"><?php include $EE["theme"] . "_dup_navi" . TEMPLATE_EXT ?></div>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td valign="top">
<?
	$NODEGROUP = "content";
    if (($EE["modules_data"][$NODEGROUP]))
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
?>
</td>
<td valign="top">
<?
	$NODEGROUP = "right_top";
    if (($EE["modules_data"][$NODEGROUP]))
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;						
?>
</td>
</tr>

</table>
<!--msnavigation--></td></tr><!--msnavigation--></table><!--msnavigation--><table border="0" cellpadding="0" cellspacing="0" width="100%"><tr><td>

<p>


<h5>© 2010&#0151;2011 Экономический институт ФГОУ ВПО &quot;НГАУ&quot;</h5>

</td></tr><!--msnavigation--></table>
<div style="display: none"><?php echo $sape->return_links(); ?></div>
</body>
</html>