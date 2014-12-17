<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">   
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?=$EE["language"]?>">
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
    <link rel="stylesheet" href="<?=$EE["http_styles"]?>start_screen.css" type="text/css" media="screen" />    
    <?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>
<!--[if lt IE 7 ]><body class="no-js ie6"><![endif]-->
<!--[if IE 7 ]><body class="no-js ie7"><![endif]-->
<!--[if IE 8 ]><body class="no-js ie8"><![endif]-->
<!--[if IE 9 ]><body class="no-js ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><body class="no-js"><!--<![endif]-->
<div class="wrapper">
    <table width="100%" height="99px" cellspacing="0" cellpadding="0" border="0" background="<?=$EE["http_theme"]?>images/top2.gif">
    <tr>
        <td valign="top"><?php include $EE["theme"] . "_dup_navi" . TEMPLATE_EXT ?><a href="/"><img src="<?=$EE["http_theme"]?>images/logo.jpg" border="0" width="159" height="97"></a></td>
        <td width="5" background="<?=$EE["http_theme"]?>images/div1.gif">&nbsp;</td>
        <td width="200" valign="top" style="padding-top:0px; padding-right:5px;">
        <?php if(!$Auth->logged_in) { ?> 
                        <table cellspacing="0" cellpadding="0" width="150" style="margin-top: 5px; padding: 0; height: 70px">
                        <tr>
                            <td valign="top">
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                <form action="/office/" method="post">                                
                                <tr style="height:15px">
                                    <td valign="top" align="left"><small><label for="uid">Логин:<label></small></td>
                                    <td colspan="2">
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td valign="top" align="left"><small><label for="password">Пароль:</label></small></td>
                                    </tr>
                                    </table>
                                    </td>
                                </tr>
                                <tr style="height: 28px">
                                    <td><input style="width:70px" type="text" name="1[login][username]"></td>
                                    <td><input style="width:70px" type="password" name="1[login][password]"></td>
                                    <td><input type="submit" value="Вход" style="width:50px"></td>
                                </tr>

                                <tr>
                                    <td colspan="3">
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td><input type="checkbox" name="remember" id="npe_remember"></td>
                                                <td><label for="npe_remember"><small>Запомнить меня1</small></label> <small><a href="/remember/">Вспомнить</a></small></td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                                </form>
                                </table>
                            </td>

                        </tr>
                        </table>
                                <small><a href="/support/registration/" style="color: #fff;">Зарегистрироваться...</a></small>
                                
                                
                            
        <?php
        }
        else
        {
        ?>
        <div id="exit"><a href="/office/">Личный кабинет</a> <a href="/office/logout/">Выход</a></div>
        <?php } ?>
        
        </td>
    </tr>
    </table>

<div id="topmenu">
<?php
    $NODEGROUP = "topmenu";
    if (($EE["modules_data"][$NODEGROUP]))
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
?>
</div>

<div id="column1">
<?php
    $NODEGROUP = "column1";
    if (($EE["modules_data"][$NODEGROUP]))
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
?>
</div>
<div id="content">
<h2><a href="/news/">Новости НГАУ</a></h2>
<?php
    $NODEGROUP = "content";
    if (($EE["modules_data"][$NODEGROUP]))
        include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;    
?>
</div>
<div class="push"></div>
</div>
<div class="footer">    
        Copyright &copy; 2009, Новосибирский Государственный Аграрный Университет, <a href="http://cit.nsau.edu.ru/">ЦИТ</a>.<br />
        По вопросам функционирования портала обращайтесь в <a href="/support/">Службу технической поддержки</a>.
</div>
</body>
</html>