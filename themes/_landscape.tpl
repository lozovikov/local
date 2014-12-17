<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">   
<!--[if lt IE 7 ]><html class="no-js ie6" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><!--<![endif]-->
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?=CODEPAGE_HTML?>" />
    <meta http-equiv="Content-Language" content="<?=$EE["language"]?>" />
    <meta name="description" content="<?=$EE["meta_descr"]?>" />
    <meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
    <meta name="author" content="Andrey Kudryashov (poganini): mail[sobachka]poganini.ru" />
    <meta http-equiv="imagetoolbar" content="no" />
	
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>landscape_screen.css" type="text/css" />
    <!--[if lte IE 7]><link rel="stylesheet" href="<?=$EE["http_styles"]?>landscape_ie-fix.css" type="text/css" /><![endif]-->
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>    
</head>
<?php 
/*	if (!defined('_SAPE_USER'))
	    define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
     require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
     $sape = new SAPE_client();   */
     /*$o['force_show_code'] = true;
     $sape = new SAPE_client($o);*/
?>
<!--[if lt IE 7 ]><body class="no-js ie6"><![endif]-->
<!--[if IE 7 ]><body class="no-js ie7"><![endif]-->
<!--[if IE 8 ]><body class="no-js ie8"><![endif]-->
<!--[if IE 9 ]><body class="no-js ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><body class="no-js"><!--<![endif]-->
<!--[if lte IE 6]><div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>Вы используете устаревший браузер Internet Explorer 6. Требуется срочное <a href="http://www.microsoft.com/rus/windows/internet-explorer/">обновление</a>.</p>
	<a id="no-ie6_close" href="#" title="Закрыть">&times;</a>
</div><![endif]-->
	<div id="nofooter">
		<div id="nofooter_bg">
			<div id="left_bg">
				<div id="left_top_bg"></div>
				<div id="left_cn_bg">
					<div></div>
				</div>
				<div id="left_bottom_bg"><div></div></div>
			</div>
			<div id="right_bg">
				<div id="right_top_bg"></div>
				<div id="right_cn_bg">
					<div></div>
				</div>
				<div id="right_bottom_bg"></div>
			</div>
		</div>
		<div class="thousand-wrapper">
		    <div id="header">
				<?php
				if($EE['folder_id'] == 697) {
				?>
				<div id="logo_text">
					<span>
						<span></span>
						Ландшафтный центр
					</span>
				</div>
				<div id="logo">
					<span></span>
				</div>
				<?php
				} else {
				?>
				<div id="logo_text">
					<a href="<?=$EE['footsteps'][0]['uri']?>">
						<span></span>
						Ландшафтный центр
					</a>
				</div>
				<div id="logo">
					<a href="<?=$EE['footsteps'][0]['uri']?>"></a>
				</div>
				<?php
				}
				?>
				<div id="header_menu">
					<div>
						<?php
						$NODEGROUP = "topmenu";
                        if (!empty($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
                        ?>
					</div>
				</div>	
				<div id="header_sub_menu">
					<div>
						<?php
						$NODEGROUP = "submenu";
                        if (!empty($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
                        ?>
					</div>
				</div>
				<p>Добро пожаловать на сайт Ландшафтного центра НГАУ!</p>
				<div id="header_bg1"></div>
				<div id="header_bg2"></div>
				<div id="contact">
					<div id="contact_top_bg"></div>
					<div id="contact_cn_bg">
						<div id="contact_cont">
							<h1>Наши контакты:</h1>
							<p>
								630090,&nbsp;г.&nbsp;Новосибирск,<br />
								ул.&nbsp;Добролюбова,&nbsp;160<br />
								оф.&nbsp;128<br />
								Тел:&nbsp;(383)&nbsp;264-20-85<br />
								e-mail:&nbsp;<a href="mailto:lcngau@yandex.ru">lcngau@yandex.ru</a>
							</p><br />
							<a id="shem" href="#">СХЕМА&nbsp;ПРОЕЗДА</a>
						</div>
						<div class="clear"></div>
					</div>
					<div id="contact_bottom_bg"></div>
				</div>
		    </div><!--header-->
			<div id="content">
				<div id="left_menu">
					<div id="top_shadow"></div>
					<div id="cn_shadow">
						<div id="left_menu_top_bg"></div>
						<div id="left_menu_bottom_bg"></div>
						<div id="ugolok"></div>
						<div id="left_menu_cont">
							<h1>Наши услуги:</h1>
							<?php
							$NODEGROUP = "left_top";
							if (!empty($EE["modules_data"][$NODEGROUP]))
							    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
							?>
						</div>
					</div>
					<div id="bottom_shadow"></div>
				</div>
				<div class="content">
					<h1>
						/
						<?php 
						if(isset($EE['footsteps'][1])) {
							echo $EE['footsteps'][1]['title'];
						} else {
							echo $EE['footsteps'][0]['title'];
						}
						?>
						/
						
					</h1>
					<?php
					$NODEGROUP = "content";
					if (!empty($EE["modules_data"][$NODEGROUP]))
						include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
					?>
				</div>
				<div class="clear"></div>
		    </div><!--content-->
			<div class="clear"></div>
		</div>
		<div id="footer-pusher"></div>
	</div>
    <div id="footer">        
        <div class="thousand-wrapper">
			<div id="footer_cont">
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
            
				<div id="copyright">&copy; 2012 <a href="http://nsau.edu.ru/">Новосибирский Государственный Аграрный Университет</a>
				<br /><?php //echo $sape->return_links(); ?>           
				</div>
			</div>
		</div> 
    </div>    
</body>
</html>
