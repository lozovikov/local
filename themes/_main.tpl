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
    <link rel="icon" href="<?=HTTP_ROOT?>favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="<?=HTTP_ROOT?>favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>screen.css" type="text/css" />
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<!--[if lt IE 7 ]><body class="no-js ie6"><![endif]-->
<!--[if IE 7 ]><body class="no-js ie7"><![endif]-->
<!--[if IE 8 ]><body class="no-js ie8"><![endif]-->
<!--[if IE 9 ]><body class="no-js ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><body class="no-js"><!--<![endif]-->
<!--[if lte IE 6]><div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>�� ����������� ���������� ������� Internet Explorer 6. ��������� ������� <a href="http://www.microsoft.com/rus/windows/internet-explorer/">����������</a>.</p>
	<a id="no-ie6_close" href="#" title="�������">&times;</a>
</div><![endif]-->


<div id="nofooter"> 
    <div id="left">
        <div id="nsau">
            <div id="pp">
                <a href="/">
                <span class="small">������������� ���������������</span>
                <span class="big">�������� �����������</span>
                </a>
            </div>
        </div>
        <div id="submenu">
            <div id="auth">
                <?php if(!$Auth->logged_in) { ?>
                <noindex>
                    <form action="/office/" method="post">
                        <label style="align: left; font-weight: bold;font-size: 10pt;color: #fff;" for="uid">�����:</label><br />
                        <input size="auto" type="text" name="1[login][username]" /><br />
                        <label style="font-weight: bold;font-size: 10pt;color: #fff;" for="password">������:</label><br />
                        <input style="width:auto; height:15px" type="password" name="1[login][password]" /><br /> 
                        <a href="/remember/">���������</a>
                        <input type="submit" value="�����"  style="text-align: center; width:60px; height:25px" /><br />
                        <a href="/support/registration/">������������������...</a>
                    </form>
                </noindex>
                <?php
                }
                else
                {
                ?>
                <div id="exit"><a href="/office/">������ �������</a>&nbsp;&nbsp;<a href="/office/logout/">�����</a></div>
                <?php } ?>
            </div>
            
            <?php
            $NODEGROUP = "left";
            if (($EE["modules_data"][$NODEGROUP]))
                include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;  
            
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
					<div id="header_baner"></div>
						
                        <?php
                        $NODEGROUP = "daystogo";
                        if (($EE["modules_data"][$NODEGROUP]))
                            include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;     
                        ?>
                    
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
<?php /*        <div id="counters">
	        <a href="http://yandex.ru/cy?base=0&amp;host=nsau.edu.ru">
	        <img src="/themes/images/cycounter500.gif" width="88" height="31" alt="������ �����������" /></a>
        </div>
        */
?>
    </div>
    <div id="footer-pusher"></div>
</div>
        <div id="footer">
            <div id="copyright">&copy; 1998&mdash;2012 ������������� ��������������� �������� �����������<!--, <a href="http://cit.nsau.edu.ru/">���</a>-->.
            <a href="http://www.mcx.ru/" title="������������ ��������� ��������� ���������� ���������">������������ ��������� ��������� ��</a>.<br />
            �� �������� ���������������� ������� ����������� � <a href="/support/">������ ����������� ����������</a>.
			<div style="display: none"><?php echo $sape->return_links(); ?></div>           
            </div>
        </div>    
 <?php if($Engine->OperationAllowed(0, 'folder.props.handle', $EE['folder_id'], $Auth->usergroup_id)) { ?>
<div id="admin_link" style="position: fixed; width: 100%; top: 0px; left: 0px; z-index: 10000; padding: 2px; padding-left: 7px; background-color: white; opacity: 0.7; "><span style="opacity: 0.9; "><a href="/map/edit/<?php  echo ($EE['folder_id']);?>">�������������</a></span></div>
<?php } ?>       
        

</body>
</html>

<script language="javascript" type="text/javascript">Spoon_DisplayMode = 'button';Spoon_AppName = 'Firefox';Spoon_HideIfUnsupported = false;</script><script language="javascript" type="text/javascript" src="http://start.spoon.net/feed"></script>

