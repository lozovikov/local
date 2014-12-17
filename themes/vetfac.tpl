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
    <meta name="author" content="Andrey Kudryashov (poganini): mail[sobachka]poganini.nsk.ru" />
    <meta http-equiv="imagetoolbar" content="no" />
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />    
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>vetfac.css" type="text/css" media="screen" />    
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" media="screen" />    
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>    
</head>        
<body>      
	<div id="nofooter"> 
		<div id="shapka">
			<div id="top">
				<div id="part_left"></div>
			</div> 
			<div id="main_menu">
				<?php
					$NODEGROUP = "topmenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?>
			</div>
			<div id="main_menu_left"></div>
			<div id="part_right"></div>                          
			<div id="top_img">
			    <a href="/vetfac/"><img class="footer_img" src="/themes/images/vetfac/home1.gif" alt="home" /></a>
				<a href="mailto:ivm_nsau@mail.ru"><img class="footer_img" src="/themes/images/vetfac/mail1.gif" alt="mail" /></a>
				<img class="footer_img" src="/themes/images/vetfac/map1.gif" alt="map" />
			</div>
			<a href="http://nsau.edu.ru/"><div id="ngau"></div></a>
			<div id="three_color"></div>
			<div id="vet_med">Факультет ветеринарной медицины</div>
		</div> 
		<div id="left_colomn">
		<!-- Колонка навигации -->
            <div id="razdely">
                <div id="left_blue_head">
                    <div class="white_text">Разделы</div>
                </div>
                <div id="right_blue_head"></div>
                <div id="left_bottom"></div>
                <div id="right_bottom"></div>
				<?php
					$NODEGROUP = "left_top";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?>                
            </div>
		</div>
		<div id="content-wrapper">
        <div id="content">
        <!-- Основная колонка -->
<!--         <div id="search">Поиск по сайту: <input type="text" size="50" class="search_input" />    <input type="image" src="/themes/images/button.gif" class="button" /></div> -->
        
        <div id="right_area">
        <!--
        <div id="auth">
            <div class="left_blue_head2"><div class="white_text">Авторизация</div></div>
            <div class="right_blue_head2"></div>
            <div class="left_bottom2"></div>
            <div class="right_bottom2"></div>
            <p>Вход для студентов и сотрудников института</p>
            <p class="auth_p">Логин&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="login" class="search_input_auth" /></p>
            <p class="auth_p">Пароль&nbsp;&nbsp;&nbsp;<input type="text" name="password" class="search_input_auth" /></p>
            <input type="image" src="/themes/images/vetfac/button_enter.gif" id="button_enter" />
        </div>
        <div id="contacts">
            <div class="left_blue_head2"><div class="white_text">Контакты</div></div>
            <div class="right_blue_head2"></div>
            <div class="left_bottom2"></div>
            <div class="right_bottom2"></div>
            <img src="/themes/images/vetfac/phone.gif" alt="phone" id="phone" />
            <p id="adress">630036, Новосибирск,<br />
            ул.&nbsp;Добролюбова, 160<br />
            <strong>тел: (383)&nbsp;267-09-07</strong></p>
            <p id="email">E-mail: <strong><a href="mailto:ivm_nsau@mail.ru">ivm_nsau@mail.ru</a></strong></p>
        </div>-->
        </div>
        
        
        
        <div id="left_area">
        
        <?php
			$NODEGROUP = "submenu";
		    if (($EE["modules_data"][$NODEGROUP])) { ?>
						<div class="submenu horisontal_menu">
							<div class="corner_TL">&nbsp;</div>
							<div class="corner_TR">&nbsp;</div>
							<div class="corner_BL">&nbsp;</div>
							<div class="corner_BR">&nbsp;</div>
<?php			include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
							<div class="clear">&nbsp;</div>
						</div>
<?php	    }
			$NODEGROUP = "content";
		    if (($EE["modules_data"][$NODEGROUP]))
		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
		?>
<!--        <div class="center_field">
            <div class="left_blue_head2"><div class="white_text">Новости института</div></div>
            <div class="right_blue_head2"></div>
            <div class="left_bottom2"></div>
            <div class="right_bottom2"></div>
            <h2>30 лет факультету - институту ветеринарной медицины</h2>
            <div class="news_item_text"><p>28 ноября 2009 г. в актовом зале главного корпуса (ул. Добролюбова, 160) пройдут торжественные мероприятия, посвященные 30-летию института ветеринарной медицины и встреча выпускников. 
            Выпускников и заинтересованных лиц приглашаем принять участие в торжественных мероприятиях.участие в торжественных мероприятиях.</p>
            <p class="news_item_public">Опубликовано 28.11.2009</p>
            <p class="more">Подробности <a href="/"><img src="/themes/images/vetfac/more.gif" alt="Подробности" /></a></p>
            </div>
            
            <h2>Выборы директора института</h2>
            <div class="news_item_text"><p>На заседании ученого совета университета, большинством голосов, директором института ветеринарной медицины избрана Леденева Ольга Юрьевна. Поздравляем ее с избранием и желаем успехов в развитии института.</p>
            <p class="news_item_public">Опубликовано 28.11.2009</p>
            <p class="more">Подробности <a href="/"><img src="/themes/images/vetfac/more.gif" alt="Подробности" /></a></p>
            </div>
            
        </div> -->
        </div>
        <div class="pusher"></div>
        
        </div>
    </div>
    
    <div id="footer-pusher"></div>
</div>     
<div id="footer"> <? /*<!--LiveInternet counter--><script type="text/javascript"><!--
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
            */ ?>
    <div id="copyright"><p>&copy; 2012 Факультет ветеринарной медицины НГАУ</p></div>
    <a href="/vetfac/"><img class="footer_img" src="/themes/images/vetfac/home.gif" alt="home" /></a>
    <a href="mailto:decanat@vetfac.nsau.edu.ru"><img class="footer_img" src="/themes/images/vetfac/mail.gif" alt="mail" /></a>
    <img class="footer_img" src="/themes/images/vetfac/map.gif" alt="map" />
</div>
</body>
</html>
