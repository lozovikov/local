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
    <link rel="icon" href="<?=HTTP_ROOT?>favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=HTTP_ROOT?>favicon.ico" type="image/x-icon" /> 
    <script type="text/javascript" src="<?=HTTP_COMMON_SCRIPTS?>modernizr-2.0.6.min.js"></script>   
    <link rel="stylesheet" href="http://portal.nsau.edu.ru/themes/styles/screen.css" type="text/css" media="screen" />
    <base href="http://nsau.edu.ru/" />    
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>    
</head>
<!--[if lt IE 7 ]><body class="no-js ie6"><![endif]-->
<!--[if IE 7 ]><body class="no-js ie7"><![endif]-->
<!--[if IE 8 ]><body class="no-js ie8"><![endif]-->
<!--[if IE 9 ]><body class="no-js ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><body class="no-js"><!--<![endif]-->
<div id="nofooter"> 
    <div id="left">
        <div id="nsau">
            <div id="pp">
                <a href="/">
                <span class="small">Новосибирский Государственный</span>
                <span class="big">Аграрный Университет</span>
                </a>
            </div>
        </div>
        <div id="submenu">
  
            <?php
            $NODEGROUP = "submenu";
            if (!empty($EE["modules_data"][$NODEGROUP]))
            {
                include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT; 
            }
            ?>
        </div>
    </div>

    <div id="content-wrapper">
        <div id="right">
                <div id="top">
                    <div id="menu">
                        <?php
                        $NODEGROUP = "topmenu";
                        if (($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
                        ?>
                    </div>
                </div>
                <div id="content">     
                    <?php
                    $NODEGROUP = "column1";
                    if(($EE["modules_data"][$NODEGROUP]))
                    {
                    ?>
                            <div id="leftright">
                                <div id="left-block">
                                    <?php
                                    $NODEGROUP = "column1";
                                    if (($EE["modules_data"][$NODEGROUP]))
                                        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
                                    ?> 
                                </div>
                                <div id="right-block">            
                                    <?php
                                    $NODEGROUP = "content";
                                        if (($EE["modules_data"][$NODEGROUP]))
                                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
                                    ?>
                                </div>
                                <div class="pusher"></div>
                            </div>
                            
                            <?php
                    }
                    else
                    {
                    	?><div id="dup_navi"><?php include $EE["theme"] . "_dup_navi" . TEMPLATE_EXT ?></div><?php
                    	
                        $NODEGROUP = "content";
                        if (($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;  
                    }
                    ?>    
                </div>     
        </div>
    </div>
    <div id="footer-pusher"></div>
</div>
        <div id="footer">
            <!--LiveInternet counter--><script type="text/javascript"><!--
            document.write("<a href='http://www.liveinternet.ru/click' "+
            "target=_blank><img src='http://counter.yadro.ru/hit?t23.14;r"+
            escape(document.referrer)+((typeof(screen)=="undefined")?"":
            ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
            screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
            ";h"+escape(document.title.substring(0,80))+";"+Math.random()+
            "' alt='' title='LiveInternet: показано число посетителей за"+
            " сегодня' "+
            "border='0' width='88' height='15'><\/a>")
            //--></script><!--/LiveInternet-->
            
            <div id="copyright">Copyright © 2009&mdash;2010, Новосибирский Государственный Аграрный Университет, <a href="http://cit.nsau.edu.ru/">ЦИТ</a>.<br>
            По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки</a>.
            </div>
        </div>    
</body>
</html>