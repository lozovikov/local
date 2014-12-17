<!DOCTYPE html> 
<!--[if lt IE 7 ]><html class="no-js ie6" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" lang="ru"><![endif]-->
<!--[if (gt IE 7)|!(IE)]><html lang="ru"><!--<![endif]-->
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
	<!--[if lte IE 8]><link rel="stylesheet" href="<?=$EE["http_styles"]?>ie-fix.css" type="text/css" /><![endif]-->
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
	
	
	
	
	<link rel="stylesheet" type="text/css" href="<?=$EE["http_styles"]?>contentrotator.css" media="screen" />
<script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>jquery_min.js"></script>
<script src="<?=HTTP_COMMON_SCRIPTS?>jquery-ui-personalized-1.5.3.packed.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#rotator > ul").tabs({fx:{opacity: "toggle"}}).tabs("rotate", 4000, true);
	});
</script>

<script language="JavaScript" type="text/javascript">
<!--
//v1.7
// Flash Player Version Detection
// Detect Client Browser type
// Copyright 2005-2008 Adobe Systems Incorporated.  All rights reserved.
var isIE  = (navigator.appVersion.indexOf("MSIE") != -1) ? true : false;
var isWin = (navigator.appVersion.toLowerCase().indexOf("win") != -1) ? true : false;
var isOpera = (navigator.userAgent.indexOf("Opera") != -1) ? true : false;
function ControlVersion()
{
	var version;
	var axo;
	var e;
	// NOTE : new ActiveXObject(strFoo) throws an exception if strFoo isn't in the registry
	try {
		// version will be set for 7.X or greater players
		axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
		version = axo.GetVariable("$version");
	} catch (e) {
	}
	if (!version)
	{
		try {
			// version will be set for 6.X players only
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
			
			// installed player is some revision of 6.0
			// GetVariable("$version") crashes for versions 6.0.22 through 6.0.29,
			// so we have to be careful. 
			
			// default to the first public version
			version = "WIN 6,0,21,0";
			// throws if AllowScripAccess does not exist (introduced in 6.0r47)		
			axo.AllowScriptAccess = "always";
			// safe to call for 6.0r47 or greater
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 4.X or 5.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = axo.GetVariable("$version");
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 3.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
			version = "WIN 3,0,18,0";
		} catch (e) {
		}
	}
	if (!version)
	{
		try {
			// version will be set for 2.X player
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
			version = "WIN 2,0,0,11";
		} catch (e) {
			version = -1;
		}
	}
	
	return version;
}
// JavaScript helper required to detect Flash Player PlugIn version information
function GetSwfVer(){
	// NS/Opera version >= 3 check for Flash plugin in plugin array
	var flashVer = -1;
	
	if (navigator.plugins != null && navigator.plugins.length > 0) {
		if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
			var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
			var flashDescription = navigator.plugins["Shockwave Flash" + swVer2].description;
			var descArray = flashDescription.split(" ");
			var tempArrayMajor = descArray[2].split(".");			
			var versionMajor = tempArrayMajor[0];
			var versionMinor = tempArrayMajor[1];
			var versionRevision = descArray[3];
			if (versionRevision == "") {
				versionRevision = descArray[4];
			}
			if (versionRevision[0] == "d") {
				versionRevision = versionRevision.substring(1);
			} else if (versionRevision[0] == "r") {
				versionRevision = versionRevision.substring(1);
				if (versionRevision.indexOf("d") > 0) {
					versionRevision = versionRevision.substring(0, versionRevision.indexOf("d"));
				}
			}
			var flashVer = versionMajor + "." + versionMinor + "." + versionRevision;
		}
	}
	// MSN/WebTV 2.6 supports Flash 4
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1) flashVer = 4;
	// WebTV 2.5 supports Flash 3
	else if (navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1) flashVer = 3;
	// older WebTV supports Flash 2
	else if (navigator.userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 2;
	else if ( isIE && isWin && !isOpera ) {
		flashVer = ControlVersion();
	}	
	return flashVer;
}
// When called with reqMajorVer, reqMinorVer, reqRevision returns true if that version or greater is available
function DetectFlashVer(reqMajorVer, reqMinorVer, reqRevision)
{
	versionStr = GetSwfVer();
	if (versionStr == -1 ) {
		return false;
	} else if (versionStr != 0) {
		if(isIE && isWin && !isOpera) {
			// Given "WIN 2,0,0,11"
			tempArray         = versionStr.split(" "); 	// ["WIN", "2,0,0,11"]
			tempString        = tempArray[1];			// "2,0,0,11"
			versionArray      = tempString.split(",");	// ['2', '0', '0', '11']
		} else {
			versionArray      = versionStr.split(".");
		}
		var versionMajor      = versionArray[0];
		var versionMinor      = versionArray[1];
		var versionRevision   = versionArray[2];
        	// is the major.revision >= requested major.revision AND the minor version >= requested minor
		if (versionMajor > parseFloat(reqMajorVer)) {
			return true;
		} else if (versionMajor == parseFloat(reqMajorVer)) {
			if (versionMinor > parseFloat(reqMinorVer))
				return true;
			else if (versionMinor == parseFloat(reqMinorVer)) {
				if (versionRevision >= parseFloat(reqRevision))
					return true;
			}
		}
		return false;
	}
}
function AC_AddExtension(src, ext)
{
  if (src.indexOf('?') != -1)
    return src.replace(/\?/, ext+'?'); 
  else
    return src + ext;
}
function AC_Generateobj(objAttrs, params, embedAttrs) 
{ 
  var str = '';
  if (isIE && isWin && !isOpera)
  {
    str += '<object id="page_title"';
    for (var i in objAttrs)
    {
      str += i + '="' + objAttrs[i] + '" ';
    }
    str += '>';
    for (var i in params)
    {
      str += '<param name="' + i + '" value="' + params[i] + '" /> ';
    }
    str += '</object>';
  }
  else
  {
   str += '<embed src="/themes/zastavka.swf"';
    for (var i in embedAttrs)
    {
      str += i + '="' + embedAttrs[i] + '" ';
    }
    str += '> </embed>';
  }
  document.write(str);
}
function AC_FL_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
     , "application/x-shockwave-flash"
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}
function AC_SW_RunContent(){
  var ret = 
    AC_GetArgs
    (  arguments, ".dcr", "src", "clsid:166B1BCA-3F9C-11CF-8075-444553540000"
     , null
    );
  AC_Generateobj(ret.objAttrs, ret.params, ret.embedAttrs);
}
function AC_GetArgs(args, ext, srcParamName, classid, mimeType){
  var ret = new Object();
  ret.embedAttrs = new Object();
  ret.params = new Object();
  ret.objAttrs = new Object();
  for (var i=0; i < args.length; i=i+2){
    var currArg = args[i].toLowerCase();    
    switch (currArg){	
      case "classid":
        break;
      case "pluginspage":
        ret.embedAttrs[args[i]] = args[i+1];
        break;
      case "src":
      case "movie":	
        args[i+1] = AC_AddExtension(args[i+1], ext);
        ret.embedAttrs["src"] = args[i+1];
        ret.params[srcParamName] = args[i+1];
        break;
      case "onafterupdate":
      case "onbeforeupdate":
      case "onblur":
      case "oncellchange":
      case "onclick":
      case "ondblclick":
      case "ondrag":
      case "ondragend":
      case "ondragenter":
      case "ondragleave":
      case "ondragover":
      case "ondrop":
      case "onfinish":
      case "onfocus":
      case "onhelp":
      case "onmousedown":
      case "onmouseup":
      case "onmouseover":
      case "onmousemove":
      case "onmouseout":
      case "onkeypress":
      case "onkeydown":
      case "onkeyup":
      case "onload":
      case "onlosecapture":
      case "onpropertychange":
      case "onreadystatechange":
      case "onrowsdelete":
      case "onrowenter":
      case "onrowexit":
      case "onrowsinserted":
      case "onstart":
      case "onscroll":
      case "onbeforeeditfocus":
      case "onactivate":
      case "onbeforedeactivate":
      case "ondeactivate":
      case "type":
      case "codebase":
      case "id":
        ret.objAttrs[args[i]] = args[i+1];
        break;
      case "width":
      case "height":
      case "align":
      case "vspace": 
      case "hspace":
      case "class":
      case "title":
      case "accesskey":
      case "name":
      case "tabindex":
        ret.embedAttrs[args[i]] = ret.objAttrs[args[i]] = args[i+1];
        break;
      default:
        ret.embedAttrs[args[i]] = ret.params[args[i]] = args[i+1];
    }
  }
  ret.objAttrs["classid"] = classid;
  if (mimeType) ret.embedAttrs["type"] = mimeType;
  return ret;
}
// -->
</script>

</head>
<body>
<? 
if ( (stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 6.0') !=false) ||(stristr($_SERVER['HTTP_USER_AGENT'], 'MSIE 7.0') != false)) {?>
<div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>Вы используете устаревший браузер Internet Explorer <!--[if IE 6]>6<![endif]--><!--[if IE 7]>7<![endif]-->.
	Требуется срочное <a href="http://www.microsoft.com/rus/windows/internet-explorer/">обновление</a>.</p>
	<a id="no-ie6_close" href="#" title="Закрыть">&times;</a>
</div>
<?php
}
include $EE["theme"] . "_cross_auth" . TEMPLATE_EXT ?>
    <div id="nofooter">
		<div id="bg"></div>
		<div class="wrapper">
		    <div id="header">
				<a id="logo" href="/">
					<span><span>&nbsp;</span></span>
				</a>

			<?php	$NODEGROUP = "daystogo";
		if ($EE["modules_data"][$NODEGROUP])
			include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; ?>
				<!--div id="may_9"><div><div></div></div></div-->
					<script language="JavaScript" type="text/javascript">
	AC_FL_RunContent(
		'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0',
		'width', '695',
		'height', '150',
		'src', 'zastavka',
		'quality', 'high',
		'pluginspage', 'http://www.adobe.com/go/getflashplayer',
		'align', 'middle',
		'play', 'true',
		'loop', 'true',
		'scale', 'showall',
		'wmode', 'transparent',
		'devicefont', 'false',
		'id', 'zastavka',
		'bgcolor', '#ffffff',
		'name', 'zastavka',
		'menu', 'true',
		'allowFullScreen', 'false',
		'allowScriptAccess','sameDomain',
		'movie', 'zastavka',
		'salign', ''
		); //end AC code
</script>

			<!--object id="page_title" width="695" height="150">
<div><param name="movie" value="/themes/zastavka.swf">
<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="zastavka.swf" />
	<param name="quality" value="high" />
	<param name="wmode" value="transparent" />
<embed src="/themes/zastavka.swf" width="695" height="150" align="middle">
</embed></div>
</object>
			


		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0" width="695" height="150" id="zastavka11" align="middle">
	<param name="allowScriptAccess" value="sameDomain" />
	<param name="allowFullScreen" value="false" />
	<param name="movie" value="zastavka.swf" />
	<param name="quality" value="high" />
	<param name="wmode" value="transparent" />
	
	<embed src="zastavka.swf" quality="high" wmode="transparent"  width="695" height="150" name="zastavka" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
	</object-->

		<!--object classid="clsid27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="1000" height="630" id="yoursite">
			<param name="movie" value="images/f3.swf">
				<param name="wmode" value="transparent" />
				<param name="play" value="true">
					<param name="loop" value="true">
						<param name="quality" value="high">
							<embed width="1000" height="630" src="images/f3.swf" play="true" loop="true" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" wmode="transparent"></embed>
		</object-->
		<!--object classid="clsid27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="1280" height="150" id="yoursite">
			<param name="movie" value="/themes/rozi.swf">
				<param name="wmode" value="opaque" />
				<param name="play" value="true">
					<param name="loop" value="true">
						<param name="quality" value="high">
							<embed width="1280" height="150" src="/themes/rozi.swf" play="true" loop="true" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" wmode="transparent"></embed>
		</object>
		
			<object id="page_title" style="z-index:-1;" wmode="opaque" classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="1280" height="150">
<div>
<param name="movie" value="/themes/rozi.swf" style="z-index:-1;"/>

<embed type="application/x-shockwave-flash" wmode="opaque" src="/themes/rozi.swf" width="1280" height="150" pluginspage="http://www.macromedia.com/go/getflashplayer" style="z-index:-1;" />
</div>
</object-->
			
			
			<!-- 8 marta  object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9, 0, 0, 0"
width="1280" height="150" align="middle" >
 <param name="allowScriptAccess" value="sameDomain" />
 <param name="movie" value="/themes/rozi.swf" />
 <param name="wmode" value="opaque" />
 <param name="quality" value="autohigh" />
 <param name="play" value="true" />
 
 <param name="loop" value="true" />
 <param name="bgcolor" value="#ffffff" />
<embed src="/themes/rozi.swf" quality="autohigh" bgcolor="#ffffff" align="middle"
width="1280" height="150" name="file" 
play="true" loop="true" allowScriptAccess="sameDomain"
type="application/x-shockwave-flash" wmode="opaque"
pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object-->
		
				<div id="login_search">
	 	
				
<?php 	if ($EE["unqueried_uri"] == "/" && !$Auth->logged_in) { ?>
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
&nbsp;&nbsp;&nbsp;&copy;&nbsp;1998 - <?php echo date('Y') ?> Новосибирский Государственный Аграрный Университет. <a href="http://www.mcx.ru/" title="Министерство сельского хозяйства Российской Федерации">Министерство сельского хозяйства РФ</a>.<br />
&nbsp;&nbsp;&nbsp;По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки</a>.<br />
&nbsp;&nbsp;&nbsp;Свидетельство о регистрации СМИ <a href="http://nsau.edu.ru/images/about/smi_license.jpg" >Эл №ФС77-43853 от 9 февраля 2011 года</a>.<?php echo $sape->return_links();?><br />
&nbsp;&nbsp;&nbsp;Выдано Федеральной службой по надзору в сфере связи, информационных технологий и массовых коммуникаций (Роскомнадзор).
</p>
				<div><?php echo $sape->return_links();
				?></div>
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
