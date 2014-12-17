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
	   <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
    	
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>screen_2011.css?<?=filemtime($_SERVER['DOCUMENT_ROOT'].$EE['http_styles'].'screen_2011.css')?>" type="text/css" />
<?php	clearstatcache(); ?>
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>izop.css" type="text/css" />
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" />
	<!--[if lte IE 7]><link rel="stylesheet" href="<?=$EE["http_styles"]?>ie-fix.css" type="text/css" /><![endif]-->
 

</head>

<body class="izop">
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
					
				</div>
				<div id="page_title"><div>ИНСТИТУТ ЗАОЧНОГО ОБРАЗОВАНИЯ <br/>И ПОВЫШЕНИЯ КВАЛИФИКАЦИИ (ИЗОП)</div></div>
				<div id="header_menu">
					<div id="gray_line"><div>&nbsp;</div></div>
<?php 	$NODEGROUP = "topmenu";
        if ($EE["modules_data"][$NODEGROUP])
            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
?>
					
					<div id="menu_left_bg">&nbsp;</div>
					<div id="logo_izop"></div>
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
			$NODEGROUP = "daystogo";
			if ($EE["modules_data"][$NODEGROUP])
				include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
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
					<div class="shadow_rbg" >
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
			$NODEGROUP = "content";
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
			<? /*
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
			*/ ?>
			</div>
			<div id="copyright">
									
				<p>
					&copy;&nbsp;1998—2012 Новосибирский Государственный Аграрный Университет. <a href="http://www.mcx.ru/" title="Министерство сельского хозяйства Российской Федерации">Министерство сельского хозяйства РФ.</a><br />
					По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки.</a>
				</p>
				
			</div>
		</div>
		
	
        
		
    </div><!--footer-->
    
   

    
</body>
</html>
