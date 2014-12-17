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
	
	<link rel="stylesheet" type="text/css" href="<?=$EE["http_styles"]?>nripk.css">
	
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
    
    <style>
    	div.art-nav ul li a {
    		position: relative;
  			display: block;
  			overflow: hidden;
  			height: 29px;
  			cursor: pointer;
  			text-decoration: none;
  			color: #FFFFFF;
  			padding: 0 24px;
  			line-height: 29px;
  			text-align: center;
  			outline: none;
  			letter-spacing: normal;
  			word-spacing: normal;
    	}
    	
    	div.art-nav ul {
    		margin: 0;
		  	border: 0;
		  	padding: 6px;
		  	list-style-type: none;
		  	display: block;
    	}
    	
    	div.art-nav ul li{
    		margin: 0;
    		margin-right: 2px;
  			margin-left: 2px;
  			padding: 0;
		  	border: 0;
		  	display: block;
		  	float: left;
		  	position: relative;
		  	z-index: 5;
		  	background: none;
  		}
  		
    	div.art-nav ul li a  {
    		color: #fff;
    		text-decoration: none;
    	}
    	
    	div.art-nav ul li a span:nth-child(1) {
    		left: 0;
  			right: 4px;
    		position: absolute;
  			display: block;
  			top: 0;
  			z-index: -1;
  			height: 87px;
  			background-image: url(/themes/images/menuitem.png)
    	}
    	
    	div.art-nav ul li a span:nth-child(2) {
    		width: 408px;
  			right: 0;
  			clip: rect(auto, auto, auto, 404px);
    		position: absolute;
  			display: block;
  			top: 0;
  			z-index: -1;
  			height: 87px;
  			background-image: url(/themes/images/menuitem.png)
    	}
    	
    	div.art-nav ul li a span:hover:nth-child(1), .art-menu a span:hover:nth-child(2)
{
  top: -29px;
}

div.art-nav ul li:hover>a span:nth-child(1), div.art-nav ul li:hover>a span:nth-child(2)
{
  top: -29px;
}

div.art-nav ul li:hover a span:nth-child(1), div.art-nav ul li:hover a span:nth-child(2)
{
  top: -29px;
}
    </style>
    
    <script type="text/javascript" src="/scripts/nripk/mootools.js"></script>
	<!-- <script type="text/javascript" src="/scripts/nripk/jquery.js"></script>
	<script type="text/javascript" src="/scripts/nripk/shadowbox-jquery.js"></script>
	<script type="text/javascript" src="/scripts/nripk/shadowbox.js"></script>-->
	<script type="text/javascript" src="/scripts/nripk/caption.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="/scripts/nripk/jquery.noconflict.js"></script>
	<script type="text/javascript" src="/scripts/nripk/jquery.mousewheel.min.js"></script>
	<script type="text/javascript" src="/scripts/nripk/jquery.cloud-carousel.min.js"></script>
	<script type="text/javascript" src="/scripts/nripk/init.js"></script>
	<script type="text/javascript" src="/scripts/nripk/upd/jquery.js"></script>
	<script type="text/javascript" src="/scripts/nripk/upd/shadowbox-jquery.js"></script>
	<script type="text/javascript" src="/scripts/nripk/upd/shadowbox.js"></script>
	<script type="text/javascript">
		Shadowbox.loadSkin("classic", "http://www.nripk.ru/plugins/system/ninja.shadowbox/js/skin");
		Shadowbox.loadLanguage("en", "http://www.nripk.ru/plugins/system/ninja.shadowbox/js/lang");
		Shadowbox.loadPlayer(["img","swf","flv","qt","wmp","iframe","html"], "http://www.nripk.ru/plugins/system/ninja.shadowbox/js/player");
			jQuery.noConflict(); jQuery(document).ready(function(){
		window.onload = Shadowbox.init;
		});
		jQuery(document).ready(function($) {
			 
			cloudCarouselInit(window.jQueryCloudCarousel || $, "#caro", "600px", $.extend({"reflHeight":30,"reflGap":5,"reflOpacity":0.5,"xRadius":250,"yRadius":170,"autoRotate":"left","mouseWheel":true,"reverseMouseWheel":true,"xPos":300,"yPos":150}, {"buttonLeft": $("#caro_wrapper .ari-cloud-carousel-left"), "buttonRight": $("#caro_wrapper .ari-cloud-carousel-right"), "titleBox": $("#caro_wrapper .ari-cloud-carousel-title"), "altBox": $("#caro_wrapper .ari-cloud-carousel-alt")}),false); 
		});
		Shadowbox.loadSkin("classic", "http://www.nripk.ru/modules/mod_ninja_shadowbox/ninja_shadowbox/js/skin");
    	Shadowbox.loadLanguage("ru", "http://www.nripk.ru/modules/mod_ninja_shadowbox/ninja_shadowbox/js/lang");
    	Shadowbox.loadPlayer(["img","swf","flv","qt","wmp","iframe","html"], "http://www.nripk.ru/modules/mod_ninja_shadowbox/ninja_shadowbox/js/player");
    	jQuery.noConflict(); jQuery(document).ready(function(){
		 var options = {flvPlayer: 'http://www.nripk.ru/modules/mod_ninja_shadowbox/ninja_shadowbox/js/flvplayer.swf'}
		Shadowbox.init(options);
	});
  	</script>
     
</head>
<body id="body">
	<div id="art-page-background-simple-gradient">
    	<div id="art-page-background-gradient"></div>
	</div>
	<div id="art-main">
		<div class="art-sheet">
    		<div class="art-sheet-tl"></div>
		    <div class="art-sheet-tr"></div>
		    <div class="art-sheet-bl"></div>
		    <div class="art-sheet-br"></div>
		    <div class="art-sheet-tc"></div>
		    <div class="art-sheet-bc"></div>
		    <div class="art-sheet-cl"></div>
		    <div class="art-sheet-cr"></div>
		    <div class="art-sheet-cc"></div>
		    <div class="art-sheet-body">
				<div class="art-nav">
					<div class="l"></div>
					<div class="r"></div>
					<?php	$NODEGROUP = "topmenu";
  								if ($EE["modules_data"][$NODEGROUP])
            						include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
					?>
					<!-- <ul class="art-menu">
						<li id="current" class="active item1"><a href="http://www.nripk.ru/" class="active"><span class="l"> </span><span class="r"> </span><span class="t">Главная</span></a></li>
						<li class="item30"><a href="/index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=1&amp;Itemid=30"><span class="l"> </span><span class="r"> </span><span class="t">Новости</span></a></li>
						<li class="item53"><a href="/index.php?option=com_content&amp;view=article&amp;id=18&amp;Itemid=53"><span class="l"> </span><span class="r"> </span><span class="t">Дирекция</span></a></li><li class="item52"><a href="/index.php?option=com_content&amp;view=article&amp;id=17&amp;Itemid=52"><span class="l"> </span><span class="r"> </span><span class="t">Об институте</span></a></li><li class="item54"><a href="/index.php?option=com_content&amp;view=article&amp;id=19&amp;Itemid=54"><span class="l"> </span><span class="r"> </span><span class="t">Вакансии</span></a></li><li class="item68"><a href="/index.php?option=com_content&amp;view=article&amp;id=32&amp;Itemid=68"><span class="l"> </span><span class="r"> </span><span class="t">Полезные сайты</span></a></li><li class="item87"><a href="/index.php?option=com_content&amp;view=article&amp;id=40&amp;Itemid=87"><span class="l"> </span><span class="r"> </span><span class="t">Главная НГАУ</span></a></li>
					</ul> -->
					
				</div>
				<div class="art-header">
				    <div class="art-header-png"></div>
					<div class="art-logo">
						<h1 id="name-text" class="art-logo-name">
							<a href="/">И Д П О</a>
						</h1>
						<p class="site-slogan">ИНСТИТУТ ДОПОЛНИТЕЛЬНОГО ПРОФЕССИОНАЛЬНОГО ОБРАЗОВАНИЯ ФГОУ ВПО "НГАУ"</p>
					</div>
				</div>
				<div class="art-content-layout">
				    <div class="art-content-layout-row">
						<div class="art-layout-cell art-sidebar1">
							<?php	
									$NODEGROUP = "left_top";
									if ($EE["modules_data"][$NODEGROUP])
			    						include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
			    			?>
						</div>
						
						<div class="art-layout-cell art-content-sidebar2">
							<div class="art-block">
								<div class="art-block-body">
									<div class="art-blockcontent">
										<div class="art-blockcontent-tl"></div>
										<div class="art-blockcontent-tr"></div>
										<div class="art-blockcontent-bl"></div>
										<div class="art-blockcontent-br"></div>
										<div class="art-blockcontent-tc"></div>
										<div class="art-blockcontent-bc"></div>
										<div class="art-blockcontent-cl"></div>
										<div class="art-blockcontent-cr"></div>
										<div class="art-blockcontent-cc"></div>
										<div class="art-blockcontent-body">
											<div id="caro_wrapper" class="ari-cloud-carousel-loading ari-cloud-carousel-wrapper">
												<div class="ari-cloud-carousel-caption"></div>
												<div id="caro" class="ari-cloud-carousel">
													<a href="/images/nripk/183.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/183.jpg" alt="" title="" class="cloudcarousel" width="200" height="150" />
													</a>
													<a href="/images/nripk/198.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/198.jpg" alt="" title="" class="cloudcarousel" width="200" height="133" />
													</a>
													<a href="/images/nripk/276.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/276.jpg" alt="" title="" class="cloudcarousel" width="200" height="133" />
													</a>
													<a href="/images/nripk/305.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/305.jpg" alt="" title="" class="cloudcarousel" width="200" height="133" />
													</a>
													<a href="/images/nripk/dsc00079_1.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/dsc00079_1.jpg" alt="" title="" class="cloudcarousel" width="200" height="133" />
													</a>
													<a href="/images/nripk/dsc00512_2.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/dsc00512_2.jpg" alt="" title="" class="cloudcarousel" width="200" height="122" />
													</a>
													<a href="/images/nripk/dsc00540_2.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/dsc00540_2.jpg" alt="" title="" class="cloudcarousel" width="200" height="128" />
													</a>
													<a href="/images/nripk/rusagribiz2.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/rusagribiz2.jpg" alt="" title="" class="cloudcarousel" width="200" height="121" />
													</a>
													<a href="/images/nripk/ss10001_1.jpg" target="_self" rel="shadowbox[cc_4fc5b7ef98f7d]">
														<img src="/images/nripk/cache/ss10001_1.jpg" alt="" title="" class="cloudcarousel" width="200" height="122" />
													</a>
													
												</div>
											</div>
											<div class="cleared"></div>
									    </div>
									</div>
									<div class="cleared"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="art-footer">
					<div class="art-footer-inner">
				  		<div class="art-footer-text"></div>
					</div>
					<div class="art-footer-background"></div>
				</div>
				<div class="cleared"></div>
			</div>
		</div>
	</div>
</body>
</html>