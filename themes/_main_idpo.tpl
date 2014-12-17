<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--[if lt IE 7 ]><html class="no-js ie6" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><!--<![endif]-->
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
	<meta http-equiv="Content-Language" content="ru" />
	<meta name="description" content="<?=$EE["meta_descr"]?>" />
	<meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
	
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
	
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>screen_2011.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'screen_2011.css')?>" type="text/css" />
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>screen_idpo.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'screen_nripk.css')?>" type="text/css" />
<?php	clearstatcache(); ?>

    <link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" />
	<!--[if lte IE 7]><link rel="stylesheet" href="<?=$EE["http_styles"]?>ie-fix.css" type="text/css" /><![endif]-->
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<?php
if (!AT_HOME) {	
	if (!defined('_SAPE_USER'))
		define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
    require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
    $sape = new SAPE_client();
} ?>
<body id="themes_idop">
<!--[if lte IE 7]><div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>Вы используете устаревший браузер Internet Explorer <![endif]--><!--[if IE 6]>6<![endif]--><!--[if IE 7]>7<![endif]--><!--[if lte IE 7]>. Требуется срочное <a href="http://www.microsoft.com/rus/windows/internet-explorer/">обновление</a>.</p>
	<a id="no-ie6_close" href="#" title="Закрыть">&times;</a>
</div><![endif]-->
    <div id="nofooter">
		<div class="wrapper">
		    <div id="header">
				<div class="globus"></div>
				<span id="logo">ИНСТИТУТ ДОПОЛНИТЕЛЬНОГО<br /> ПРОФЕССИОНАЛЬНОГО ОБРАЗОВАНИЯ<br /> ФГБОУ ВПО "НГАУ"
					<a href="http://nripk.ru">ИДПО</a>
				</span>
				<a id="nsau_logo" href="http://nsau.edu.ru">НГАУ
					<span><span>&nbsp;</span></span>
				</a>
				<div id="header_menu">
<?php	$NODEGROUP = "topmenu";
  		if ($EE["modules_data"][$NODEGROUP])
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					<div id="menu_left_bg">&nbsp;</div>
				</div>
			</div><!--header-->
		    <div id="content">
				<div class="left_column">
					<div class="left_cont">
						<div id="main_menu">
<?php		$NODEGROUP = "left_submenu";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
							<div class="submenu vertical_menu">
								<div class="corner_TL">&nbsp;</div>
								<div class="corner_TR">&nbsp;</div>
								<div class="corner_BL">&nbsp;</div>
								<div class="corner_BR">&nbsp;</div>
<?php			include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
								<div class="clear">&nbsp;</div>
							</div>
<?php		} ?>
						</div>
<?php		$NODEGROUP = "left_top";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					</div>
				</div>
				<div class="center_column">
					<div class="center_cont">
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
			$NODEGROUP = "news_announce";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
							<div class="shadow_rbg" id="news_annonse">
<?php			include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
								<div class="shadow_tr">&nbsp;</div>
								<div class="shadow_b">
									<div class="shadow_br">&nbsp;</div>
									<div class="shadow_bl">&nbsp;</div>
								</div>
							</div>
<?php		} 
			$NODEGROUP = "content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					</div>
				</div>
				<div class="clear">&nbsp;</div>
		    </div><!--content-->
		</div>
		<div id="footer-pusher">&nbsp;</div>
    </div><!--nofooter -->
    <div id="footer">
		<div class="wrapper">
			<div id="main-counter">
<?php		$NODEGROUP = "footer_block";
			if ($EE["modules_data"][$NODEGROUP])
				include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
			</div>
			<div id="copyright">
				<p>
					&copy;&nbsp;1998—2012 Новосибирский Государственный Аграрный Университет. <a href="http://www.mcx.ru/" title="Министерство сельского хозяйства Российской Федерации">Министерство сельского хозяйства РФ.</a><br />
					По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки.</a>
				</p>
				<div style="display: none"><?php echo $sape->return_links(); ?></div>
			</div>
		</div>
<?php
if (!AT_HOME) {
?>
<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter7937029 = new Ya.Metrika({id:7937029, enableAll: true});
        } catch(e) {}
    });
    
    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/7937029" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->	        
<?php
}
?>		
    </div><!--footer-->
</body>
</html>