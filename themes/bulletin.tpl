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
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>
	<!--mstheme--><link rel="stylesheet" type="text/css" href="<?=$EE["http_styles"]?>bulletin.css">
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<?php
if (!AT_HOME)
{	
	if (!defined('_SAPE_USER'))
		define('_SAPE_USER', 'd5a281d49943183e4410cd7c58fb79b8');
    require_once($_SERVER['DOCUMENT_ROOT'].'/'._SAPE_USER.'/sape.php');
    $sape = new SAPE_client();
}
?>
<body>
<div id="wrapper" class="hfeed">
	<div id="header">
		<div id="masthead">
			
<div id="branding" role="banner">

				<!--<h1 id="site-title">
					<span>
						<a href="<?php echo (preg_match('/bulletin\./', $_SERVER['SERVER_NAME'])?HTTP_ROOT:HTTP_ROOT.'bulletin/')?>" title="<?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?>" rel="home"><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></a>
					</span>
				</h1>-->

						<div style="width: 100%; clear: both;"><img src="/themes/images/bulletin/images/String_bulletin.gif" style="width: 100%; height: 4px; border-bottom-width: 0px;" /></div>
						<div style="width: 940px; padding-left:10px; padding-right:10px;"><a href="<?php echo (preg_match('/bulletin\./', $_SERVER['SERVER_NAME'])?HTTP_ROOT:HTTP_ROOT.'bulletin/')?>"><img src="/themes/images/bulletin/images/cropped-logo-bulletin.jpg" alt="" /></a></div>
						<div style="width: 100%; clear: both;"></div>

			</div><!-- #branding -->

      <div id="access" role="navigation">

				<div class="skip-link screen-reader-text"><a href="#content" title="Перейти к содержимому">Перейти к содержимому</a></div>

		<div style='border-top: 1px solid #000'><img src='/themes/images/bulletin/images/String_bulletin_footsteps.gif' width='100%' height='40px'</div>
        <div class="menu" style="position:absolute; left: 20px; top: 233px; float:left;clear:both;"><?php if ($_SERVER['REQUEST_URI'] == '/')  echo '<a href="'.HTTP_ROOT.'">Главная</a>';  else  include $EE["theme"] . "_dup_navi" . TEMPLATE_EXT; ?></div>
		
	
			</div><!-- #access -->

		</div><!-- #masthead -->
	</div><!-- #header -->

	<div id="main">

 

 <div id="container">
			<div class="bulletin_content" id="content" role="main">

			<?php
			/* Run the loop to output the page.
			 * If you want to overload this in a child theme then include a file
			 * called loop-page.php and that will be used instead.
			 */

			?>
      <?php
	$NODEGROUP = "content";
	if (($EE["modules_data"][$NODEGROUP]))
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
		
	echo "&nbsp;";
?>
			</div><!-- #content -->
			</div><!-- #container -->
		

    <div id="primary" class="widget-area bulletin_content" role="complementary">
			<ul class="xoxo">
        <li id="categories-2" class="widget-container widget_categories">
        <h3 class="widget-title">Содержание</h3>
        <?php
					$NODEGROUP = "submenu";
					if (($EE["modules_data"][$NODEGROUP]))
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;

				?>
        </li>
      </ul>
      <div style="border-top: 1px solid #000; padding-top:5px">
      <h2><a class="widget-title" href="contacts/">Контакты</a></h2>
      </div>
    </div> 

   

    </div><!-- #main -->


<div id="footer" role="contentinfo">
		<div style="width: 100%; height:4px;clear: both;"><img src="/themes/images/bulletin/images/String_bulletin.gif" style="width: 100%; height: 4px;" /></div>
                <div id="colophon">


			<div id="site-info">
				<a href="http://<?=preg_replace('/bulletin\./', '', $_SERVER['SERVER_NAME'])?>/" title="" rel="home">Новосибирский Государственный Аграрный Университет</a>
			</div><!-- #site-info -->

			<div id="site-generator">

			</div><!-- #site-generator -->

		</div><!-- #colophon -->
	</div><!-- #footer -->	

</div><!-- #wrapper -->
 <div style="display: none"><?php echo $sape->return_links(); ?></div>  
</body>
</html>