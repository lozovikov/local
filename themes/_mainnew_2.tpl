<!DOCTYPE html> 
<!--[if lt IE 7 ]><html class="no-js ie6" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="ru"><!--<![endif]-->
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?=CODEPAGE_HTML?>" />
    <meta name="description" content="<?=$EE["meta_descr"]?>" />
    <meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
    <meta name="author" content="Andrey Kudryashov (poganini): mail[sobachka]poganini.ru" />
    <meta http-equiv="imagetoolbar" content="no" />
<script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>jquery_min.js"></script>
<!-- the countdown plugin -->
<script src="/scripts/coconut.min.js"></script>
<!-- The coffeetime stylesheet -->
<link rel="stylesheet" type="text/css" href="<?=$EE["http_styles"]?>coconut_style.css">
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
    	
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>screen_2011.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'screen_2011.css')?>" type="text/css" />
<?php	clearstatcache(); ?>
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="<?=$EE["http_styles"]?>ie-fix.css" type="text/css" /><![endif]-->
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
<?php  include $EE["theme"] . "_cross_auth" . TEMPLATE_EXT ?>
    <div id="nofooter">
		<div class="wrapper">
		    <div id="header">
				<a id="logo" href="/">
					<span><span>&nbsp;</span></span>
				</a>

			
				<!--div id="may_9"><div><div></div></div></div-->
				
				<!--<object id="page_title" width="695" height="150">
<div><param name="movie" value="/themes/9_may.swf">
<embed src="/themes/9_may.swf" width="695" height="150" align="middle">
</embed></div>
</object>
			<object id="page_title" style="z-index:-1;" wmode="opaque" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="695" height="150">
<div>
<param name="movie" value="/themes/summer.swf" style="z-index:-1;"/>

<embed type="application/x-shockwave-flash" wmode="opaque" src="/themes/summer.swf" width="695" height="150" pluginspage="http://www.macromedia.com/go/getflashplayer" style="z-index:-1;" />
</div>
</object>-->
			
			<script type="text/javascript">
     
    // on jquery load and document ready
    jQuery(document).ready(function () {
        // load the plugin on the element id
        $("#circular-countdown").coconut({
	color : "#b70202",
	startDate: "12/06/2013",
	endDate: "20/06/2013",
	S_size : "small",
	M_size : "small",
	H_size : "small",
	D_size : "big",
});
		});
 
</script>
			<div class="title" style="position: absolute;
left: 50%;
margin-left: -154px;
top: 0px; color: #9c0605; font-weight: bold;">До начала работы приемной комиссии осталось</div>
<div id="circular-countdown">
	
	
	
</div>
<div class="title" style="position: absolute;
left: 50%;
margin-left: -154px;
bottom: 30px; color: #9c0605; font-weight: bold;"> <div class="time" style="margin-right: 30px;
margin-left: 40px;">дни</div> <div class="time" style="margin-right: 30px;
margin-left: 32px;" >часы</div> <div class="time">минуты</div> <div class="time" style="margin-left: 20px;">секунды</div></div>
				<div id="login_search">
	 	
				
<?php 	if ($EE["unqueried_uri"] == "/") { ?>
			<a href="" /><div class="tasks_count warning"></div></a>
<?php 	}
		$NODEGROUP = "login"; 
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
		    <div id="content">
<?php 	if ($EE["modules_data"]["left_top"] || $EE["modules_data"]["left_submenu"]) { ?>
				<div class="left_cont"><!-- Left Cont -->
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
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; 

	 		$NODEGROUP = "baners";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
					<div id="baners">
<?php   	        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					</div>
<?php   	}
			$NODEGROUP = "conference";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div class="shadow_rbg" id="conference">
<?php		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="shadow_tr">&nbsp;</div>
							<div class="shadow_b">
								<div class="shadow_br">&nbsp;</div>
								<div class="shadow_bl">&nbsp;</div>
							</div>
						</div>
<?php		} 
			$NODEGROUP = "left_bottom";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
				</div><!-- End Left Cont -->
				<div class="center_cont">
					<div class="cn"><!-- Center Cont -->
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
			$NODEGROUP = "top_content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
			$NODEGROUP = "dissertation";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div class="shadow_rbg" id="dissertation">
<?php		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="shadow_tr">&nbsp;</div>
							<div class="shadow_b">
								<div class="shadow_br">&nbsp;</div>
								<div class="shadow_bl">&nbsp;</div>
							</div>
						</div>
<?php		} 
	 		$NODEGROUP = "topicality";
			if ($EE["modules_data"][$NODEGROUP]) { ?>
						<div id="topicality" class="shadow_rbg">
							<div id="topicality_cont">		
<?php		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							</div>
							<div class="shadow_tr">&nbsp;</div>
							<div class="shadow_b">
								<div class="shadow_br">&nbsp;</div>
								<div class="shadow_bl">&nbsp;</div>
							</div>
						</div>
<?php		} 
			$NODEGROUP = "content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;  

	 		$NODEGROUP = "footer_block";
			if ($EE["modules_data"][$NODEGROUP])
				include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
					</div>
				</div><!-- End Center Cont -->
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
			$NODEGROUP = "top_content";
			if ($EE["modules_data"][$NODEGROUP])
			    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; 
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
			<?php
			if (0) {
			?>
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
			<?php
			}
			?>
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
            w.yaCounter7937029 = new Ya.Metrika({id:7937029, enableAll: true, webvisor:true});
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
