<!DOCTYPE html> 
<!--[if lt IE 7 ]><html lang="ru" class="no-js ie6"><![endif]-->
<!--[if IE 7 ]><html lang="ru" class="no-js ie7"><![endif]-->
<!--[if IE 8 ]><html lang="ru" class="no-js ie8"><![endif]-->
<!--[if IE 9 ]><html lang="ru" class="no-js ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="ru" class="no-js"><!--<![endif]-->
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?=CODEPAGE_HTML?>" />
    <meta name="description" content="<?=$EE["meta_descr"]?>" />
    <meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
    <meta name="author" content="Andrey Kudryashov (poganini): mail[sobachka]poganini.ru" />
    <meta http-equiv="imagetoolbar" content="no" />
	
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
	
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>screen_2011.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'screen_2011.css')?>" type="text/css" />
<?php	clearstatcache(); ?>
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" />
	<!--[if lte IE 9]><link rel="stylesheet" href="<?=$EE["http_styles"]?>ie-fix.css" type="text/css" /><![endif]-->
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<?php
if (!AT_HOME) {	
	if (!defined('_SAPE_USER'))
		define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
    require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
    $sape = new SAPE_client();
} ?>
<body>
<!--[if lte IE 7]><div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>Вы используете устаревший браузер Internet Explorer <![endif]--><!--[if IE 6]>6<![endif]--><!--[if IE 7]>7<![endif]--><!--[if lte IE 7]>. Требуется срочное <a href="http://www.microsoft.com/rus/windows/internet-explorer/">обновление</a>.</p>
	<a id="no-ie6_close" href="#" title="Закрыть">&times;</a>
</div><![endif]-->
    <div id="nofooter">
		<div class="wrapper">
		    <div id="header">
				<a id="logo" href="/">					
					<span><span>&nbsp;</span></span>
				</a>
				<div id="login_search">
<?php	$NODEGROUP = "login"; 
        if ($EE["modules_data"][$NODEGROUP])
            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
?>		
					<form id="search_form" method="get" action="/search/" accept-charset="UTF-8">
						<fieldset>
							<a href="/map/">карта сайта</a>							
						</fieldset>
						<fieldset>
							<div>
								<input type="text" name="search" placeholder="поиск" title="поиск" />
								<div>&nbsp;</div>
								<input class="submit" type="submit" value="Искать" />
							</div>
						</fieldset>
					</form>
				</div>
				<div id="header_menu">
<?php 	$NODEGROUP = "topmenu";
        if ($EE["modules_data"][$NODEGROUP])
            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
?>
					<div id="menu_left_bg">&nbsp;</div>
				</div>				
		    </div><!--header-->
		    <div id="content" class="teacher_office">
<?php 	if ($EE["modules_data"]["left_top"] || $EE["modules_data"]["left_submenu"]) { ?>
				<div class="left_cont">
<?php		$NODEGROUP = "left_submenu";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div class="submenu vertical_menu">
							<div class="corner_TL">&nbsp;</div>
							<div class="corner_TR">&nbsp;</div>
							<div class="corner_BL">&nbsp;</div>
							<div class="corner_BR">&nbsp;</div>
<?php		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="clear">&nbsp;</div>
						</div>
<?php		}
			$NODEGROUP = "left_top";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
				</div>
				<div class="center_cont">
					<div class="cn">
<?php		$NODEGROUP = "submenu";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div class="submenu horisontal_menu">
							<div class="corner_TL">&nbsp;</div>
							<div class="corner_TR">&nbsp;</div>
							<div class="corner_BL">&nbsp;</div>
							<div class="corner_BR">&nbsp;</div>
<?php		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="clear">&nbsp;</div>
						</div>
<?php		}			
			$NODEGROUP = "content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					</div>
				</div>
<?php	} else {
			$NODEGROUP = "submenu";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div class="submenu horisontal_menu">
							<div class="corner_TL">&nbsp;</div>
							<div class="corner_TR">&nbsp;</div>
							<div class="corner_BL">&nbsp;</div>
							<div class="corner_BR">&nbsp;</div>
<?php		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="clear">&nbsp;</div>
						</div>
<?php		}			
			$NODEGROUP = "content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
		} ?>
				<div class="clear">&nbsp;</div>
		    </div><!--content-->
		</div>
		<div id="footer-pusher">&nbsp;</div>
    </div><!--nofooter -->
    <div id="footer">    
		<div class="wrapper">
			<div id="main-counter">
			<!--LiveInternet counter--><script type="text/javascript"><!--
			document.write("<a href='http://www.liveinternet.ru/click' "+
			"target=_blank><img src='//counter.yadro.ru/hit?t23.1;r"+
			escape(document.referrer)+((typeof(screen)=="undefined")?"":
			";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
			screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
			";h"+escape(document.title.substring(0,80))+";"+Math.random()+
			"' alt='' title='LiveInternet: показано число посетителей за"+
			" сегодня' "+
			"border='0' width='88' height='15'><\/a>")
			//--></script><!--/LiveInternet-->
			</div>
			<div id="copyright">
				<p>
					&copy;&nbsp;1998—2012 Новосибирский Государственный Аграрный Университет. <a href="http://www.mcx.ru/" title="Министерство сельского хозяйства Российской Федерации">Министерство сельского хозяйства РФ.</a><br />
					По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки.</a>
				</p>
				<div style="display: none"><?php echo $sape->return_links(); ?></div>
			</div>
		</div>
    </div><!--footer-->
</body>
</html>
