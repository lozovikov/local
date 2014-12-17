<?

/*foreach($_GET as $key=>$value){	if(is_int($value)) $_GET[$key]=intval($value);
}  */
extract($_GET);

//


if(!isset($course)) $course=6;
if(!isset($form)) $form=2;
if(!isset($spec)) $spec=0;
if(!isset($branch)) $branch=0;

$course=intval($course);
$form=intval($form);
$spec=intval($spec);
$branch=intval($branch);

include("./core/settings.php");

$conn=mysql_connect($database_host,$user,$password);
mysql_select_db("material");
mysql_query("set names cp1251");
mysql_query("set character set cp1251");

$server = "nsau.local";
$server = "nsau.edu.ru";

?>
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=windows-1251"/>
<meta http-equiv="content-language" content="ru"/>

<meta name="robots" content="none"/>

<meta name="description" content="описание страницы"/>
<meta name="keywords" content="ключевые слова"/>

<meta name="author" content="ЛДО-Лаборатория дистанционного обучения"/>
<meta name="copyright" content="Все права защищены ИЗОП"/>

<link rel="shortcut icon" href="pix/logo.ico">
<link rel="stylesheet" href="style.css" type="text/css"/>

<title>ИЗОП - Институт заочного образования и повышения квалификации</title>

<script language="JavaScript" src="jscript.js" type="text/javascript"></script>

</head>
<body bgcolor="#ffffff" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginheight="0" marginwidth="0">

<?
if(!isset($_GET["section"])) $section="method"; else $section=$_GET["section"];

function curl_post_data($url, $data = null, $extra = array()){
  $ch = curl_init();
  //if(is_array($data))
  curl_setopt($ch, CURLOPT_URL, $url);
  if($data){
    if(is_array($data)) {
      $data1 = http_build_query($data);
      if(strpos($data1,'=@') !== false){
        $data = $data1;
      }
    }
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
  }
  //curl_setopt( $ch, CURLOPT_COOKIE, "PHPSESSID=d30b30dc7544048aa239aab5dd968cd6" );
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

  foreach($extra as $k => $v)
  {
    //curl_setopt_array($ch, $extra);
    curl_setopt($ch, $k, $v);
  }

  $res = curl_exec($ch);

  return $res;
}

?>

<!--Шапка сайта-->
<?php require_once ('./templates/head.php'); ?>

<!--Главное меню-->
<?php require_once ('./templates/menu.php'); ?>

<!--Блок подменю-->
        <td width="" id="lc" align="left" valign="top">
            <table width="213" id="lc_block" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="13" height="36" bgcolor="#f47711" align="right" valign="bottom"><img src="pix/olm_left_up.jpg" width="13" height="36"></td>
                    <td width="95" height="36" background="pix/olm_up.jpg" bgcolor="#f47711" align="left" valign="top"><div id="lc_header">Меню</div></td>
                    <td width="90" height="36" background="pix/olm_right_up_bg.jpg" bgcolor="#f47711" align="right" valign="bottom"><a href="javascript:ShowHide(1);" id="sh" title="Свернуть/Развернуть"><img src="pix/olm_buttion.jpg" width="27" height="27" border="0"></a></td>
                    <td width="15" height="36" bgcolor="#f47711" align="left" valign="bottom"><img src="pix/olm_right_up.jpg" width="15" height="36"></td>
                </tr>
                <tr>
                    <td width="13" height="10" background="pix/olm_left.jpg" align="right" valign="top"><img src="pix/olm_left.jpg" width="13" height="1"></td>
                    <td width="185" height="10" colspan="2" align="left" valign="top"><img src="pix/inv.gif" width="1" height="1"></td>
                    <td width="15" height="10" background="pix/olm_right.jpg" align="left" valign="top"><img src="pix/olm_right.jpg" width="15" height="1"></td>
                </tr>
                <tr id="win1">
                    <td width="13" height="" background="pix/olm_left.jpg" align="right" valign="top"><img src="pix/olm_left.jpg" width="13" height="1"></td>
                    <td width="185" colspan="2" align="left" valign="top">
                        <?if($section!="students"){?>
                        <div id="olm_link_first"><a href="method_department.php?section=<? echo $section ?>" class="olm_menu_first" >Отдел методического обеспечения</a></div>
                        <div id="olm_link_first"><a href="method_commission.php?section=<? echo $section ?>" class="olm_menu_first">Методическая комиссия</a></div><?}?>
                        <div id="olm_link_first"><a href="material.php?section=<? echo $section ?>" class="olm_menu_first">Учебно-методический материал</a></div>
                        <div id="olm_link_first"><a href="posobie/index.html" class="olm_menu_first">Методические рекомендации по подготовке к изданию учебно-методической литературы</a></div>
                            <? include("material_deps_menu.php");?>
							<? if($section=="method"){ ?>

                                                        <!--
                                                        <div id="olm_link_first"><a href="electron_complex.php" class="olm_menu_first">Электронный учебно-методический комплекс</a></div>
                                                        -->
                                                        <? } ?>
                    </td>
                    <td width="15" height="" background="pix/olm_right.jpg" align="left" valign="top"><img src="pix/olm_right.jpg" width="15" height="1"></td>
                </tr>
                <tr>
                    <td width="13" height="32" align="right" valign="top"><img src="pix/olm_left_bottom.jpg" width="13" height="32"></td>
                    <td colspan="2" background="pix/olm_bottom.jpg"><img src="pix/olm_bottom.jpg" width="1" height="32"></td>
                    <td width="15" height="32" align="left" valign="top"><img src="pix/olm_right_bottom.jpg" width="15" height="32"></td>
                </tr>
            </table><?
			include("counters.php");
			?>

        </td>
<!--Правый информационный блок-->
        <td id="rc" align="left" valign="top">
            <table cellpadding="0" cellspacing="0">

					<?
                    if($spec) $where = " where id_speciality='$spec' ";
					$result1=mysql_query("select id_speciality, name_speciality, code_spec from specialities $where ") or die(mysql_error());
					while($row1=mysql_fetch_array($result1)){
                    $specname = $row1['name_speciality'];
                    $spec = $row1['id_speciality'];
                    if(preg_match('|\((бакалавриат)\)|i', $specname, $matches)){
                      $edulevel = 'Бакалавриат';
                      $specname = str_replace(' ('.$matches[1].')', '', $specname);
                      //print_r($matches);echo $specname;
                    }
                    else $edulevel = 'Специалитет';//exit;
					?>
                    <?php headblock("Специальность ".$row1['code_spec']." ".$row1['name_speciality']) ?>
                <tr>
                    <td width="8" height="" background="pix/rc_left_border.jpg"><img src="pix/inv.gif" width="1" height="1"></td>
                    <td id="rc_text_block" colspan="3" align="left" valign="top">
<!--Список курсов-->
                        <!--
						<table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="100%" align="left" valign="top">
                                <div id="rc_link_list">
                                    <?
                                    for($i=1;$i<=6;$i++){
                                    ?>
                                    <div id="rc_link"><a href="material_1.php?course=<?echo $i?><?echo $form==1?"":"&form=$form"?>&spec=<?echo $spec?>" class="mail" nowrap title=""><?echo $i?> курс</a></div>
                                    <?
                                    }
                                    ?>
                                </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="" height="1" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                            </tr>
                        </table>
						-->
						<table width="100%" cellpadding="0" cellspacing="0">
						   <tr>
                                <td width="" height="1" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                          </tr>
                        </table>
<!--Курс-->
<!--
                        <p id="blue_h2_b">Курс: 1 Семестр: 1</p>

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="330"><p id="table_h2_b">Список дисциплин</p></td>
                                <td width="110"><p id="table_h2_b_center">Часы (теория)</p></td>
                                <td width=""><p id="table_h2_b_center">Часы (практика)</p></td>
                                <td width="150"><p id="table_h2_b_center">Отчетность</p></td>
                            </tr>
                            -->
<!-- //////////////////////////////// -->
<!--<p id="blue_h2_b">Список дисциплин: </p>-->
<?php



set_time_limit(0);

/*$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, 'http://nsau.edu.ru/office/metodicheskie-posobiya/');
//curl_setopt($ch, CURLOPT_POST, 1);
//curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt( $ch, CURLOPT_COOKIE, "PHPSESSID=d30b30dc7544048aa239aab5dd968cd6" );
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);*/

$res = curl_post_data('http://'.$server.'/', array('1266[login][password]' => 'cromah', '1266[login][username]' => 'mark'), array(CURLOPT_HEADER => 1, CURLOPT_COOKIE => 'a=1'));

if(preg_match("|PHPSESSID=([0-9a-f]+);|", $res, $matches)){
  //echo $matches[1];
  $sessid = $matches[1];
}

//echo htmlspecialchars($res);
//echo $res;
//exit;




$res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', null, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));
//echo htmlspecialchars($res);
//echo $res;
if(preg_match('|<input type="hidden" class="upfile_token" id="upfile_id" name="UPLOAD_IDENTIFIER"  value="([0-9a-f]+)" />|', $res, $matches)){
  $UPLOAD_IDENTIFIER = $matches[1];
}

$folder_id = 0;

while($folder_id == 0)
{
  $res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', null, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));
  if(preg_match('|<select name="delete\[folder_id\]" size="1">(.*)</select>|sU', $res, $matches)){
    //print_r($matches);//exit;
    if(preg_match('|<option value="([0-9]+)">'.$specname.'</option>|sU', $matches[1], $matches)){
      //print_r($matches);
      $folder_id = $matches[1];
    }
    else {
      $res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', array(/*'add' => array('folder_name' => $specname)*/'add[folder_name]' => $specname), array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));
    }
  }
}

//Удаление ранее загруженных файлов
if(preg_match_all('|<input type="text" id="url_([0-9]+)"(.*)/>|', $res, $matches1)){
  //print_r($matches1);
  foreach($matches1[1] as $id){
    //echo $id;
    $ch = curl_init();
    $data = array('data[f_id]'=>$id, 'mode' => 'html_code', 'module' => 7, 'params' => 'ajax_del_file');
    curl_setopt($ch, CURLOPT_URL, 'http://'.$server.'/office/metodicheskie-posobiya/?delete_file='.$id);
    //curl_setopt($ch, CURLOPT_URL, 'http://nsau.edu.ru/ajax_mode/');
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_COOKIE, "PHPSESSID=$sessid" );
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //$res = curl_exec($ch);
    //echo htmlspecialchars($res);exit;
  }
}
//exit;
?>
<?

$i=100;

//for($j=1;$j<=2;$j++){
//for($j=2*$course-1;$j<=2*$course;$j++)
//for($j=2*$course-1;$j<=2*$course;$j++)
{
	for($j=1;$j<=$course*2;$j++)
	{
$crs=ceil($j/2);
$sql = "select * from materials m,kind_material k where sem_num='$j' and ".(($branch != 0) ? " id_branch='$branch' and " : "" )." id_speciality='$spec' and k.id_kind=m.id_kind ".(($form != 0) ? "and id_form='$form'" : "" )." order by discipline_name";
//echo $sql;
$result=mysql_query($sql);
if(mysql_num_rows($result) == 0) continue;
?>
<!--Курс-->

<p id="blue_h2_b">Курс: <?echo $crs?> Семестр: <?echo $j?></p>


<!--<p id="blue_h2_b" style="font-size: 12px;">I курс 1 семестр</p>
<p id="blue_h2_b" style="font-size: 12px;">I курс 2 семестр</p>-->
                        <table width="100%" cellpadding="0" cellspacing="0">

                           <!--
						   <tr><td></td></tr>
						    <tr>
                                <td width="330"><p id="table_h2_b">Список дисциплин</p></td>
                                <td width="110"><p id="table_h2_b_center">Часы (теория)</p></td>
                                <td width=""><p id="table_h2_b_center">Часы (практика)</p></td>
                                <td width="150"><p id="table_h2_b_center">Отчетность</p></td>
                            </tr>
							-->
<?

$discip="";

while($row=mysql_fetch_array($result)){
      $i++;
      ?>
                       <?php
           //print_r($row);
if($row['title']) $descr = trim($row['author']).'. '.$row['title'].' ('.$row['name_kind'].')';
else $descr = $row['name_kind'];


$fileid = 0;

//Проверить, нет ли такого файла
//while($fileid == 0)
{
  $res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', null, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));
  if(preg_match('|<select name="sel_file" size="1" class="sel_file">(.*)</select>|sU', $res, $matches)){
    //print_r($matches);//exit;
    if(preg_match('|<option value="([0-9]+)">('.$row['file'].')</option>|', $matches[1], $matches1)){
      //print_r($matches1);flush();
      $fileid = $matches1[1];
    }
    /*else {
      $data = array('params' => 'ajax_add_file', 'upload_descr' => $descr, 'upload_file' => '@'.str_replace('\\', '/', dirname(__FILE__)).'/material/'.$row['file'], 'upload_author' => $row['author'], 'upload_year' => $row['edition_year'], 'upload_place' => $row['publishing_house'], 'allow_download' => 1, 'UPLOAD_IDENTIFIER' => $UPLOAD_IDENTIFIER, 'MAX_FILE_SIZE' => 157286400);
      $res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', $data, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));
      echo $res;
      //echo htmlspecialchars($res);
      //exit;
      flush();
    }*/
  }
  else {
    //echo htmlspecialchars($res);
    //exit;
  }
}
//echo $fileid;
//exit;

//Если нет файла - загрузить
if($fileid == 0)
{
$ch = curl_init();

$data = array('params' => 'ajax_add_file', 'upload_descr' => $row['discipline_name'], 'upload_file' => '@'.str_replace('\\', '/', dirname(__FILE__)).'/material/'.$row['file'], 'upload_author' => $row['author'], 'upload_year' => $row['edition_year'], 'upload_place' => $row['publishing_house'], 'allow_download' => 1, 'UPLOAD_IDENTIFIER' => $UPLOAD_IDENTIFIER, 'MAX_FILE_SIZE' => 157286400);
//print_r($data);

curl_setopt($ch, CURLOPT_URL, 'http://'.$server.'/office/metodicheskie-posobiya/');
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
curl_setopt($ch, CURLOPT_COOKIE, "PHPSESSID=$sessid" );
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER, 1);
//curl_setopt($ch, CURLOPT_VERBOSE, 1);

$res = curl_exec($ch);// or die(curl_errno($ch).": ".curl_error($ch));
//echo htmlspecialchars($res);
}
//else { continue; }
flush();
//exit;
//echo $res; exit;

$res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', null, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));

if(preg_match('|<option value="([0-9]+)">('.$row['file'].')</option>|', $res, $matches)){
  //print_r($matches);//$UPLOAD_IDENTIFIER = $matches[1];
  $fileid = $matches[1];
  $data1 = array('upload_author_'.$fileid => $row['author'], 'upload_year_'.$fileid => $row['edition_year'], 'upload_place_'.$fileid => $row['publishing_house']);
  /*foreach($data as $k => $v){
    if(strpos($k, 'upload_') == 0){
      $data1[$k.'_'.$fileid] = $data[$k];
    }
  }*/
  $data1['allow_download_edit_'.$fileid] = 1;
  //$data1['is_html_'.$fileid] = $data['is_html'];
  $data1['sel_folder_'.$fileid] = $folder_id;
  $data1['upload_volume_'.$fileid] = '';
  $data1['upload_volume_'.$fileid] = '';
  $data1['editfile'] = $fileid;
  $data1['upload_descr_'.$fileid] = $row['discipline_name'];
  $data1['upload_file_'.$fileid] = '';//'@'.str_replace('\\', '/', dirname(__FILE__)).'/material/'.$row['file'];

  //print_r($data1);

  $html = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', $data1, array(CURLOPT_COOKIE => "PHPSESSID=$sessid"));//echo $html;exit;

  $data = array('sel_file' => $fileid, 'referenc_file' => 1);
  if($row['id_kind'] == 19) $kind = 3;
  elseif($row['id_kind'] == 2) $kind = 5;
  elseif(in_array($row['id_kind'], array(1, 2, 18, 26, 27, 28, 30, 31, 32, 5) )) $kind = 5;
  else $kind = 2;
  $data['sel_view'] = $kind;

  $discid = 0;

  if(preg_match('|<option value="([0-9]+)">('.$row['discipline_name'].')</option>|', $res, $matches1)){
    $discid = $matches1[1];//print_r($matches1);
  }

  $data['sel_subject'] = $discid;
  $specid = 0;

  if(preg_match('|<input type="checkbox" name="spec_item\[([0-9]+)\]" value="([0-9]+)" />([0-9]+) - '.$specname.'|', $res, $matches1)){
    $specid = $matches1[1];
    $spec_code = $matches1[2];//print_r($matches1);
  }

  $spec_type = 0;

  if(preg_match('|<select name="sel_spec_type\['.$specid.'\]" size="1" title="([^"]*)">(.*)</select>|smU', $res, $matches1)){
    //print_r($matches1);//exit;
    if(preg_match('|<option value="([0-9]+)"([^>]*)>([0-9]+) - Специалитет</option>|smU', $matches1[2], $matches2)){
      //print_r($matches2);
      $spec_type = $matches2[1];
    }
  }

  $specids = array();
  $spec_codes = array();

  if(preg_match_all('|<input type="checkbox" name="spec_item\[([0-9]+)\]" value="([0-9]+)" />([0-9]+) - '.$specname.'|', $res, $matches1, PREG_SET_ORDER)){
    foreach($matches1 as $match){
    $specids[] = $match[1];
    $spec_codes[] = $match[2];//print_r($matches1);
    $spec_code = $match[2];
    }
  }

  $spec_types = array();

  foreach($specids as $specid){
    if(preg_match('|<select name="sel_spec_type\['.$specid.'\]" size="1" title="([^"]*)">(.*)</select>|smU', $res, $matches1)){
      //print_r($matches1);//exit;
      if(preg_match('|<option value="([0-9]+)"([^>]*)>([0-9]+) - '.$edulevel.'</option>|smU', $matches1[2], $matches2)){
        //print_r($matches2);
        $spec_types[] = $matches2[1];
        $spec_type = $matches2[1];
      }
    }
  }

  $data['spec_item'][$specid] = $spec_code;
  $data['sel_semester'][$specid] = $j;
  $data['sel_spec_type'][$specid] = $spec_type;
  $data['sel_education'][$specid] = 'Заочная';
  $data['privyazka'] = 'Привязать';

  //print_r($data);
  //$fp = fopen("log.txt", "w+");

  $res = curl_post_data('http://'.$server.'/office/metodicheskie-posobiya/', http_build_query($data), array(CURLOPT_COOKIE => "PHPSESSID=$sessid", /*CURLOPT_VERBOSE => 1, CURLOPT_STDERR => $fp,*/ CURLOPT_HTTPHEADER => array("Expect:")));
  //echo ($res);
  echo $row['file'];
  flush();
}
//exit;
?>

   <tr>
                                <td width="100%" height="20" colspan="6" align="center" valign="bottom"><div id="dotted"><img src="pix/inv.gif" width="1" height="1"></div></td>
                          </tr>
                        </table>
  <?
}
}
}



?>
<!-- //////////////////////////////// -->                  </td>
                    <td width="5" height="" background="pix/rc_right_border.jpg"></td>
                </tr>
                <?php
            }
            ?>
                <tr>
                    <td width="8" height="50" align="right" valign="top"><img src="pix/rc_left_bottom_border.jpg"></td>
                    <td colspan="3" background="pix/rc_bottom_border.jpg">&nbsp;</td>
                    <td width="5" height="50" align="left" valign="top"><img src="pix/rc_right_bottom_border.jpg"></td>
                </tr>
            </table>

       </td>
    </tr>
<!--Низ сайта-->
    <tr>
        <td width="238" height="28" background="pix/bc_left_bg.jpg" bgcolor="#4fc74f" align="left" valign="top"><div id="bc_left">©  2005. Все права защищены ИЗОП</div></td>
        <td width="" height="28" background="pix/bc_bg.jpg" bgcolor="#4fc74f" align="right" valign="top"><div id="bc_right">Сайт разработан ЛДО</div></td>
    </tr>
</table>
</body>
</html>