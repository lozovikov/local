<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]><html class="no-js ie6" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251" />
	<link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" />
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
	<link href="/themes/styles/biti.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<?=$EE["http_styles"]?>ee.css" type="text/css" />

<!--<script type="text/javascript" src="/scripts/biti/mootools.v1.1.js"></script>
<script type="text/javascript" src="/scripts/biti/sve.js"></script>-->
	<script type="text/javascript" src="/scripts/highslide/highslide.js"></script>
	<script type="text/javascript">
		hs.graphicsDir = '/scripts/highslide/graphics/';
		hs.showCredits = false;
		hs.fullExpandTitle = 'Полный размер';
		hs.restoreTitle = 'Щелчок мышью закрывает изображение, клавиши-стрелки используются для перехода к предыдущему и следующему изображению';
		hs.loadingText = 'Загрузка&hellip;';
		hs.loadingTitle = 'Щёлкните мышью для отмены';
		hs.allowMultipleInstances = false;
	</script>

<!--[if IE 6]>
<!--<script type="text/javascript" src="/scripts/biti/ie2.js"></script>--><![endif]
<!--[if IE 6]>
<style type="text/css">
<!--img{
	behavior: url(/themes/styles/biti/iepngfix.htc);
}-->
#images_slide img{
	behavior:none;
}
</style>
<![endif]-->
<!--[if IE 6]>
<!--<link href="/themes/styles/biti/iesucks.css" rel="stylesheet" type="text/css" />-->
<![endif]-->

<!--<script type="text/javascript" src="/scripts/biti/mouseover.js"></script>--><title>Информационно-образовательный портал БиТИ - Главная</title>
<meta name="description" content="Информационно-образовательный портал БиТИ" />
<meta name="keywords" content="учеба, конспекты, шпаргалки, образование, лекции, экзамены, рефераты, курсовые работы, курсовые проекты, зачеты, занятия, практика, преподаватели, студенты, научные работы, дипломы, дирекция, наука, аспирантура" />
<meta name="robots" content="index, follow" />
	<link rel="shortcut icon" href="/images/biti/images/favicon.ico" />
	<?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
	</head>
<!-- ODVAJANJE ZAREZOM -->
<body>
<div id="centarmain" style="font-size:12px; width:1000px;">
<!--header-->
<div id="header">
<div id="hl">

<div id="hr">
<div id="logo">
<div id="srch"><div id="tags"> <h1><a href="/biotech/" title="На главную">БИТИ</a></h1></div>
<div id="banw">
</div></div></div></div></div></div>
<!-- end header-->
<!-- suckerfish-->
<div id="suck" style="font-size:12px;">
<div id="sl">
<div id="sr">
  <div id="navigacija">
      <script type="text/javascript">
<!--//--><![CDATA[//><!--

sfHover = function() {
	var sfEls = document.getElementById("navigacija").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfHover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfHover\\b"), "");
		}
	}
}
//--><!]]>
</script>

<?php
					$NODEGROUP = "topmenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?>    </div></div></div></div>
<!-- end suckerfish-->
</div><!-- end centarmain-->
<!--- box  -->
<div id="centar2" style="font-size:12px; width:1000px;">
<div id="boxtop">				
<!--- box top border -->
<div id="lbtop"><div id="rbtop"><div id="bbtop"><div id="blctop"><div id="brctop">
<div id="tbtop"><div id="tlctop"><div id="trctop">
<!--  -->

<div id="boxcontent" style="display:none;">
<div id="topwr">
<div id="user1" style="width:64%;">		<div class="moduletable">
							<h3>
					Сегодня читают				</h3>
				</div>
		  </div><div id="user2" style="width:33%;">		<div class="moduletable">

							<h3>
					Популярное				</h3>
		</div>
		  </div></div></div>		
<!--- end of box top border -->
</div></div></div></div></div></div></div></div>
<!-- -->
</div></div>
<!--- end of box  --><div id="centar" style="font-size:12px; width:1000px;">
<div id="box">				
<!--- box border --><div id="lb"><div id="rb"><div id="bb"><div id="blc"><div id="brc">
<div id="tb"><div id="tlc"><div id="trc"><!--  -->
<div id="boxcontenttop">
<div id="wrap">
<div id="insidewrap">
<div id="mainbody" style='width:100%'>
<div id="content" style='width:75%'>
<div class="inside">
<!--- box  -->

<div id="dup_navi"><?php include $EE["theme"] . "_dup_navi" . TEMPLATE_EXT ?></div>
<?php
                    	
                        $NODEGROUP = "content";
                        if (($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;  
                    
                    ?>    

</div></div>
<div id="left"  style='width:250px'> 
<div class="inside"><!-- keep mods of edges-->
		<div class="module">
			<div>
				<div>
					<div class="menuleft">
						<h3>Главное меню</h3>
<?php
					$NODEGROUP = "topmenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?>
					</div>
				</div>
			</div>
		</div>
				<div class="module">
			<div>
				<div>
					<div class="menuleft">

						<h3>Дополнительно</h3>
						<?php
					$NODEGROUP = "submenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
				?>
					</div>
				</div>
			</div>
		</div>

				<!--<div class="module">
			<div>
				<div>

					<div>
						<h3>Популярные файлы</h3>
					</div>
				</div>

			</div>
		</div> -->
		
		<!-- end inside--></div><!-- end modsl--></div><!-- end left side-->
</div> <!--end of main-body-->
<!-- right side always stand alone-->
<div id="right"> 
<div class="inside"> <!-- keep mods of edges-->
		
		<!--<div class="module">
			<div>
				<div>

					<div>
						<h3>Активный опрос</h3>
						</div>
				</div>
			</div>
		</div>
				<div class="module">
			<div>
				<div>
					<div>
						Сейчас на сайте находятся: <br />1 гость					</div>

				</div>
			</div>
		</div>-->
		</div><!-- end of inside --></div><!-- end right side-->
<div class="clr"></div>
</div><!-- end of insidewrap--></div> <!--end of wrap-->
<div class="clr"></div>
</div>	
<!--- end of box border -->
</div></div></div></div></div></div></div></div>
<!-- -->
</div>

<!--- end of box  -->
</div><!-- end centar-->
<!-- bottom mods-->
<div id="botw" style="font-size:12px; width:1000px;">
<div id="bwl">
<div id="bwr">
<div id="botmwr">
<div id="user3" style="width:49%;">		<div class="moduletable">
			<ul id="mainlevel-nav"><li><a href="/biotech/" class="mainlevel-nav" >Главная</a></li><li><a href="/biotech/abit/" class="mainlevel-nav" >Абитуриентам</a></li><li><a href="/biotech/spec/" class="mainlevel-nav" >Специальности</a></li><li><a href="/biotech/specz/" class="mainlevel-nav" >Специализации</a></li><li><a href="/biotech/contacts/" class="mainlevel-nav" >Контакты</a></li><li><a href="/biotech/links/" class="mainlevel-nav" >Ссылки</a></li></ul>		</div>

		</div><div id="user4" style="width:49%;">		<div class="moduletable">
			
</div>

		</div></div></div></div></div>
<!-- end--><!-- footer-->
<div id="footer" style="font-size:12px; width:1000px;">
<div id="fl">
<div id="fr">
<div id="copyright">			
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
</div></div></div></div>
<!--end-->
</body>
</html>