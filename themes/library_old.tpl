 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--[if lt IE 7 ]><html class="no-js ie6" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru" lang="ru"><!--<![endif]-->
<head>
	<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
	<meta http-equiv="Content-Language" content="ru">
	<meta name="description" content="<?=$EE["meta_descr"]?>" />
	<meta name="keywords" content="<?=$EE["meta_keywords"]?>" />
    <link rel="icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=$EE["http_theme"]?>favicon2011.ico" type="image/x-icon" />
	
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<?=$EE["http_styles"]?>library.css">
	
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<body id="body">

<div id="logo3">
<div id="logo">
<div id="top_bar">
</div></div>
           
                
                <div align="center">
                </div> 
                <div id="clear"></div>

                  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  id="centertb">
                  <tr>

                  <td  valign="top" class="leftcol">
                  <div>
                  		<div class="module">
			
		</div>
			<div class="module_menu">
			<div>
				<div>
					<div>

													<h3>Главное меню</h3>
					<ul class="menu"><li><a id="main_menu_def_href" href="/library"><span>Главная</span></a></li></ul>
											 <?php
					$NODEGROUP = "submenu";
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
					<div>
													<h3>Календарь</h3>
											

<link rel="stylesheet" href="/modules/mod_blog_calendar/tmpl/calstyle.css" type="text/css">

<div id="calendarCont">
 <?php
					$NODEGROUP = "left_top";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>		
</div>


<div id="ArticleList">
<!--dropdown start-->
</div>
					</div>
				</div>
			</div>
		</div>
			<div class="module">

			<div>
				<div>
					<div id="left_bottom_cont">
													<!-- <h3>Это интересно</h3>-->
											


			<?php
					$NODEGROUP = "left_bottom";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>	
		<br />
					</div>
				</div>
			</div>

		</div>
			<div class="module">
			<div>
				<div>
					<div>
											<p><a href="http://clck.yandex.ru/redir/dtype=stred/pid=7/cid=1228/*http://weather.yandex.ru/index.xml?city=29634"><img src="http://info.weather.yandex.net/informer/150x150/29634.png" border="0" alt="Яндекс.Погода" /><img src="http://clck.yandex.ru/click/dtype=stred/pid=7/cid=1227/*http://img.yandex.ru/i/pix.gif" border="0" width="1" height="1" /></a></p>					</div>
				</div>
			</div>

		</div>
			<div class="module">
			<div>
				<div>
					<div>
											<p style="text-align: center;"><a target="_blank" href="http://www.ossp.ru"><img style="vertical-align: middle;" src="<?=$EE["http_theme"]?>/images/library/1.gif" width="100" height="100" alt="1" /></a></p>					</div>
				</div>
			</div>

		</div>
	
                  </div>
                  </td> 

             <td valign="top"  width="100%" id="contenttb"> 
             <table width="100%"  border="0" cellspacing="0" cellpadding="0">

                <tr>
                <td  colspan="3" class="pw" ><div><span class="breadcrumbs pathway">
<?php  include $EE["theme"] . "_library_dup_navi" . TEMPLATE_EXT; ?></span>
</div></td>
                </tr>



                                          


             

          <tr align="left" valign="top">
                      <td colspan="3" style="padding: 5px 0;">
                      <div class="main">


	
<div class="componentheading">
<?=$EE['footsteps'][count($EE['footsteps'])-1]['title']?></div>
<br>
	
	<div>
	<?$NODEGROUP = "column1";
	if (($EE["modules_data"][$NODEGROUP])) 
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;?>
	</div>
	
	<div>
	<?$NODEGROUP = "content";
	if (($EE["modules_data"][$NODEGROUP]))
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;?>
	</div>
			


                      </div> 
                      </td>
          </tr>



                      </table>

                      </td>

                      <td valign="top" class="rightcol">
                      <div>
                      		<div class="module">
			<div id="search_cont">
				<?php
					$NODEGROUP = "search";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>	
			</div>

		</div>
		<!-- 	<div class="module">
			<div>
				<div>
					<div>
													<h3>Самое популярное</h3>
											<ul class="mostread">
	<li class="mostread">

		<a href="/index.php/component/content/article/37-2009-03-14-12-47-25/46-2009-03-15-13-38-24.html" class="mostread">
			Фонд библиотеки</a>
	</li>
	<li class="mostread">
		<a href="/index.php/component/content/article/37-2009-03-14-12-47-25/48-2009-03-15-13-45-44.html" class="mostread">
			Материально-техническая база</a>
	</li>
	<li class="mostread">

		<a href="/index.php/component/content/article/37-2009-03-14-12-47-25/47-2009-03-15-13-42-32.html" class="mostread">
			Основные цифровые показатели</a>
	</li>
	<li class="mostread">
		<a href="/index.php/2009-03-14-14-08-47/2009-03-14-14-09-18/53-2009-03-24-10-13-53.html" class="mostread">
			Электронный каталог учебных и образавательных программ на электронных носителях</a>
	</li>
	<li class="mostread">

		<a href="/index.php/2009-03-14-14-11-34/-qq/50----l--r.html" class="mostread">
			Положение о газете « Родник »</a>
	</li>
</ul>					</div>
				</div>
			</div>
		</div> -->
			<div class="module">

			<div>
				<div>
					<div id="right_top_cont">
						<h3>Последние новости</h3>
						<?php
					$NODEGROUP = "right_top";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>	
											
					</div>
				</div>
			</div>
		</div>
			<div class="module">
			<div>
				<div>
					<div id="right_cont">

													<h3>Голосования</h3>
													
						<?php
					$NODEGROUP = "right";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>									
													
					</div>
				</div>
			</div>

		</div>
			
	
                      </div>
                      </td>
         </tr>
</table>


   
<!-- Yandex.Metrika -->

<script src="//mc.yandex.ru/resource/watch.js" type="text/javascript"></script>
<script type="text/javascript">
try { var yaCounter329368 = new Ya.Metrika(329368); } catch(e){}
</script>
<noscript><div style="position: absolute;"><img src="//mc.yandex.ru/watch/329368" alt="" /></div></noscript>
<!-- /Yandex.Metrika -->
        		
        
                <div class="foot">
               
        		<div id="lib_counter">
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
            </div>             
                <div class="footer_right">
                
<p>
&copy; Библиотека НГАУ 2009-<?=date('Y')?>
</p>
                </div>

                </div>
                
<!--script type="text/javascript" src="/scripts/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/scripts/highslide/highslide.js"></script>
<script type="text/javascript">
		hs.graphicsDir =  '<?=HTTP_COMMON_SCRIPTS?>highslide/graphics/';
		hs.showCredits = false;
		hs.fullExpandTitle = 'Полный размер';
		hs.restoreTitle = 'Щелчок мышью закрывает изображение, клавиши-стрелки используются для перехода к предыдущему и следующему изображению';
		hs.loadingText = 'Загрузка&hellip;';
		hs.loadingTitle = 'Щёлкните мышью для отмены';
		hs.allowMultipleInstances = false;

	</script-->
<!--script type="text/javascript">

$('.newsDateHref').bind('click', function() {return showNewsByDate(curYear+'-'+((curMonth+1)<10 ? '0'+(curMonth+1) : curMonth+1) + '-' +(Number($(this).text()) <10 ? '0'+$(this).text() : $(this).text() ))});
$('#right_cont label').wrap('<div class="sectiontableentry2"></div>');
$('#right_top_cont a').wrap('<ul><li></li></ul>');
$('#right_cont input').attr('className', 'button');
if (!$('a.active').length) $('#main_menu_def_href').parent().attr('className', 'active');
else $('a.active').parent().attr('className', 'active');
$('.hidden').eq(Math.floor(Math.random()*3)).css('display', 'block');
</script-->
         
</body>
</html>