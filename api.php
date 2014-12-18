<?php

// API
// version: 2.4
// date: 2013-04-18

function win2utf($s)
{
     if(function_exists("iconv")) return iconv("cp1251","utf-8",$s);
     $t = "";
     $c209 = chr(209); $c208 = chr(208); $c129 = chr(129);
     for($i=0; $i<strlen($s); $i++)    {
         $c=ord($s[$i]);
         if ($c>=192 and $c<=239) $t.=$c208.chr($c-48);
         elseif ($c>239) $t.=$c209.chr($c-112);
         elseif ($c==184) $t.=$c209.chr(145);
         elseif ($c==168) $t.=$c208.$c129;
         else $t.=$s[$i];
     }
     return $t;
}

function utf2win($s){
  if(function_exists("iconv")) return iconv("utf-8", "cp1251", $s);
  //if(!preg_match("//u", $s)){ return $s; }
  $str = "";
  for($i = 0; $i < strlen($s);){
    $ch = $s[$i];
    $code = ord($ch);//printf("\u%04x", $code);
    if($code >> 7 == 0) { $str .= $ch; $l = 1;}
    if($code >> 5 == 0x06){
      $l = 2;
      $ch1 = $code & 0x1F;
      $ch2 = (ord($s[$i+1]) & 0x3F);

      $res = $ch2 + ($ch1 << 6);
      if($res == 0x401)
      {
        $res = 0xA8;
      }
      elseif($res == 0x451)
      {
        $res = 0xB8;
      }
      else
      {
        $res -= 848;
      }
      $str .= chr($res);
    }
    $i += $l;
  }
  return $str;
}

function array_map_recursive($func, $array) {
    foreach ($array as $key => $val) {
        if ( is_array( $array[$key] ) ) {
            $array[$key] = array_map_recursive($func, $array[$key]);
        } else {
            $array[$key] = call_user_func( $func, $val );
        }
    }
    return $array;
}

$start_time = microtime();

$start_array = explode(" ",$start_time);

$start_time = $start_array[1] + $start_array[0];

// подключаем конфигурационный файл
if (!@include_once "config.inc")
{
	die($DEBUG_LEVEL ? "<strong>EEngine startup</strong> fatal error #1001:<br />\n&nbsp;&nbsp;Configuration file <code>config.inc</code> not found or access denied." : "");
}

// блок кросс-авторизации
if (isset($_GET['authpass'])) {
	unset($_GET['authpass']);
	ini_set('session.cookie_domain', '.'.APPLIED_DOMAIN);
	if (isset($_GET['s'])) {
		session_id($_GET['s']);
		unset($_GET['s']);
	}
	session_start();
	if (!empty($_GET))
		foreach($_GET as $key=>$value) {
			setcookie($key, $value, 0, '/');
		}
	exit;
}


// в режиме блокировки выводим соответствующую страницу
if (OPERATE_MODE == "B")
{
	@include BLOCKED_MODE_PAGE;
	exit();
}


// задаём первоначальный уровень отладки отображения ошибок
if (DEBUG_ONLY_FOR_ADMIN)
{
	$DEBUG_LEVEL = 0;
}

error_reporting($DEBUG_LEVEL ? E_ALL : 0);


// подключаем модуль отображения критических ошибок
if (@include_once INCLUDES . "FatalErrorDisplay" . CLASS_EXT)
{
	$FED = new FatalErrorDisplay(
		"<strong>EEngine startup</strong>",
		array(
			1003 => "Patch functions file <code>%1\$s</code> not found or access denied",
			1004 => "Common functions file <code>%1\$s</code> not found or access denied",
			1005 => "Wrong codepage <code>%1\$s</code>",
			1006 => "Database handler file <code>%1\$s</code> (<code>%2\$s</code> database type) not found or access denied",
			1007 => "Wrong database type <code>%1\$s</code>",
			1008 => "Session handler file <code>%1\$s</code> not found or access denied",
			1009 => "Auth system file <code>%1\$s</code> not found or access denied",
			1010 => "Engine main file <code>%1\$s</code> not found or access denied",
			),
		$DEBUG_LEVEL
		);
}

else
{
	die($DEBUG_LEVEL ? "<strong>EEngine startup</strong> fatal error #1002:<br />\n&nbsp;&nbsp;Fatal errors display module file <code>" . INCLUDES . "FatalErrorDisplay" . CLASS_EXT . "</code> not found or access denied." : "");
}

@include_once INCLUDES . "Snoopy.class.php";

// подключаем необходимые функции
if (!@include_once INCLUDES . "PHP4_patches.inc")
{
	$FED->FatalError(1003, INCLUDES . "PHP4_patches.inc");
}

if (!@include_once INCLUDES . "CF" . CLASS_EXT)
{
	$FED->FatalError(1004, INCLUDES . "CF" . CLASS_EXT);
}


// формируем значения для часового пояса
ini_set("date.timezone", TIMEZONE);
define("TIMEZONE_OFFSET_SECONDS", TIMEZONE_OFFSET_HOURS * 3600);
define("TIMEZONE_OFFSET_FORMATTED", ((TIMEZONE_OFFSET_HOURS >= 0) ? "+" : "-") . sprintf("%02d", floor(abs(TIMEZONE_OFFSET_HOURS))) . ":" . sprintf("%02d", 60 * (abs(TIMEZONE_OFFSET_HOURS) - floor(abs(TIMEZONE_OFFSET_HOURS)))));


// настраиваем кодировку
switch (CODEPAGE)
{
	case "utf8":
		define("CODEPAGE_HTML", "utf-8");
		define("CODEPAGE_DB", "utf8");
		setlocale(LC_CTYPE, MAIN_LANGUAGE . ".UTF-8");
		break;

	case "cp1251":
		define("CODEPAGE_HTML", "windows-1251");
		define("CODEPAGE_DB", "cp1251");
		setlocale(LC_CTYPE, MAIN_LANGUAGE . ".CP1251");
        /*define("CODEPAGE_HTML", "utf-8");
		define("CODEPAGE_DB", "utf8");
		setlocale(LC_CTYPE, MAIN_LANGUAGE . ".UTF-8");*/
		break;

	default:
		$FED->FatalError(1005, CODEPAGE);
		break;
}


// настраиваем пути
define("THEMES", DOC_ROOT . THEMES_DIR);                // FS-путь к темам
define("HTTP_THEMES", HTTP_ROOT . THEMES_DIR);          // HTTP-путь к темам
define("COMMON_IMAGES", DOC_ROOT . IMAGES_DIR);         // FS-путь к общим изображениям
define("HTTP_COMMON_IMAGES", HTTP_ROOT . IMAGES_DIR);   // HTTP-путь к общим изображениям
define("HTTP_COMMON_SCRIPTS", HTTP_ROOT . SCRIPTS_DIR); // HTTP-путь к общим скриптам
define("FILES", DOC_ROOT . FILES_DIR);                  // FS-путь к пользовательским файлам
define("HTTP_FILES", HTTP_ROOT . FILES_DIR);            // HTTP-путь к пользовательским файлам


// подключаем класс БД и создаём общее соединение с базой данных
switch (DB_TYPE)
{
	case "mysql":
		if (!@include_once INCLUDES . "MySQLhandle" . CLASS_EXT)
		{
			$FED->FatalError(1006, INCLUDES . "MySQLhandle" . CLASS_EXT, DB_TYPE);
		}

		$DB = new MySQLhandle(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT, $DEBUG_LEVEL);
		$DB->Exec("SET time_zone = '" . TIMEZONE_OFFSET_FORMATTED . "'");
		$DB->Exec("SET NAMES '" . CODEPAGE_DB . "'");

		/*if (!AT_HOME) {
			$DBMail = new MySQLhandle(DBMAIL_HOST, DBMAIL_USER, DBMAIL_PASS, DBMAIL_NAME, DBMAIL_PORT, $DEBUG_LEVEL);
			$DBMail->Exec("SET time_zone = '" . TIMEZONE_OFFSET_FORMATTED . "'");
			$DBMail->Exec("SET NAMES '" . CODEPAGE_DB . "'");
		}*/
		break;


	case "mysql_old":
		if (!@include_once INCLUDES . "MySQLhandle" . CLASS_EXT)
		{
			$FED->FatalError(1006, INCLUDES . "MySQLhandle" . CLASS_EXT, DB_TYPE);
		}

		$DB = new MySQLhandle(DB_HOST, DB_USER, DB_PASS, DB_NAME, DB_PORT, $DEBUG_LEVEL);
		$DB->Exec("SET character_set_client='" . CODEPAGE_DB . "'");
		$DB->Exec("SET character_set_results='" . CODEPAGE_DB . "'");
		$DB->Exec("SET collation_connection='" . CODEPAGE_DB . "_general_ci'"); // !!! возможно, следует вводить отдельную переменную
		break;


	default:
		$FED->FatalError(1007, DB_TYPE);
		break;
}


// поключаем и настраиваем альтернативный обработчик сеансов работы (сессий)
if (CF::IsNonEmptyStr(SESSION_HANDLER_VARNAME))
{
	if (!@include_once INCLUDES . "SessionHandler" . CLASS_EXT)
	{
		$FED->FatalError(1008, INCLUDES . "SessionHandler" . CLASS_EXT);
	}

	$GLOBALS[SESSION_HANDLER_VARNAME] = new SessionHandler($DB);

	session_set_save_handler(
		array(&$GLOBALS[SESSION_HANDLER_VARNAME], "Open"),
		array("SessionHandler", "Close"),
		array(&$GLOBALS[SESSION_HANDLER_VARNAME], "Read"),
		array(&$GLOBALS[SESSION_HANDLER_VARNAME], "Write"),
		array(&$GLOBALS[SESSION_HANDLER_VARNAME], "Destroy"),
		array(&$GLOBALS[SESSION_HANDLER_VARNAME], "GCdummy")
		);
}
// а иначе хотя бы задаём максимальную вероятность, что устаревшая сессия будет удалена
else
{
	ini_set("session.gc_probability", 100);
}



// включаем систему аутентификации
if (!@include_once INCLUDES . "Auth" . CLASS_EXT)
{
	$FED->FatalError(1009, INCLUDES . "Auth" . CLASS_EXT);
}

$Auth = ALLOW_AUTH ? new Auth(AUTH_DB_PREFIX, SESSION_HANDLER_VARNAME) : new AuthDummy;
$ADMIN_USER = ($Auth->usergroup_id == ADMIN_USERGROUP_ID);


// в случае необходимости меняем уровень отображения ошибок PHP
if ($DEBUG_LEVEL && DEBUG_ONLY_FOR_ADMIN && $ADMIN_USER)
{
	error_reporting(E_ALL); // !!! возможно, нужно сделать разные уровни отображения для разных уровней отладки
	$DB->SetDebugLevel($DEBUG_LEVEL);
}

// в режиме технических работ выводим соответствующую страницу, если пользователь не админ и не находится на странице авторизации.
if ((OPERATE_MODE == "S") && !($ADMIN_USER || CF::URIin(HTTP_ROOT . SERVICE_MODE_LOGIN_PAGE)))
{
	@include SERVICE_MODE_PAGE;
	exit();
}


// проверяем доступность файла движка
if (!@include_once INCLUDES . "EEngine" . CLASS_EXT)
{
	$FED->FatalError(1010, INCLUDES . "EEngine" . CLASS_EXT);
}

// запускаем движок с установленным ранее уровнем обработки ошибок, и корневой папкой, определяемой по применённому домену
$Engine = new EEngine($DEBUG_LEVEL, $DOMAINS[APPLIED_DOMAIN][1]);

//print_r($_COOKIE);
//print_r($_SESSION);

class Array2XML {

	private
		$data = array (),
		$tagName = '';

	/**
	 * Конструктор
	 * @param sting $tagName название корневого элемента, относительно которого будет построено дерево
	 * @param array $data
	 */
	public function __construct ($tagName, array $data) {
		$this->tagName = $tagName;
		$this->data = $data;
	}

	/**
	 * Возвращает XML-таблицу
	 * @param DOMDocument $xml
	 * @return DOMElement
	 */
	public function __toXML (DOMDocument $xml) {
		$parentNode = $xml->createElement ($this->tagName);

		$this->renderData ($xml, $parentNode, $this->data);

		return $parentNode;
	}

	/**
	 * Возвращает текст XML-таблицы, построенной на основе массива
	 * @return string
	 */
	public function __toString () {
		//header ("Content-type: text/xml; charset=utf-8");

		//$xml = new DOMDocument ('1.0', 'utf-8');
        $xml = new DOMDocument ('1.0', CODEPAGE_HTML);
		$xml->formatOutput = 1; 

		$xml->appendChild ($this->__toXML ($xml));

		return $xml->saveXML ();
	}

	private function renderData (DOMDocument $xml, DOMElement $parentNode, array $data) {
		foreach ($data as $key => $value) {
			if (is_numeric ($key)) {
				if (is_array ($value)) {
					$this->renderData ($xml, $parentNode, $value);
				} else {
					$parentNode->appendChild ($xml->createElement ('value', (string) $value));
				}
			} else {

				if($key[0] == '@'){
				  $attr = str_replace('@', '', $key);
                  $parentNode->setAttribute($attr, $value);
                  continue;
				}

                $aKParts = explode (':', $key);

				if (count ($aKParts) == 1) {
					$node = $xml->createElement ((string) $key);
				} else {
					$node = $xml->createElement ($aKParts[0]);

					$aParamsBin = explode (',', $aKParts[1]);
					foreach ($aParamsBin as $paramBin) {
						$xxx = explode ('=', $paramBin);
						if (isset ($xxx[1])) {
							$node->setAttribute ($xxx[0], $xxx[1]);
						}
					}
				}

				if (is_array ($value)) {
					$this->renderData ($xml, $node, $value);
					$parentNode->appendChild ($node);
				} else {
					$value = str_replace ('&', '&amp;', $value);
					$node->nodeValue = (string) $value;
					$parentNode->appendChild ($node);
				}
			}
		}
	}
}


header("Content-type: text/xml; charset=".CODEPAGE_HTML);
//header("Content-type: text/xml; charset=utf-8");
//echo $Auth->user_id;
$user_id = $Auth->user_id;
$files = array();

$params = array('file_id', 'spec_id', 'name', 'code', 'year', 'author', 'subj', 'descr', 'format', 'hash');
foreach($params as $param){
  $$param = isset($_REQUEST[$param]) ? $_REQUEST[$param] : null;
}

$mode = isset($_REQUEST['mode']) ? $_REQUEST['mode'] : 'files';

//$DB->Exec("SET NAMES 'utf8'");

if($user_id != 0){
  if($mode == 'files'){
  $DB->SetTable("nsau_files");
  if(!is_null($file_id)) {
  	$DB->AddCondFS("id", "=", $file_id);
  }
  if(!is_null($hash)) {
  	$DB->AddCondFS("hash", "=", $hash);
  }
  if(!is_null($name)) {
  	$ext = substr(strrchr($name, '.'), 1);
  	$name = str_replace(".$ext", "", $name);
  	$DB->AddCondFS("name", "=", $name);
  	$DB->AddCondFS("filename", "=", $ext);
  }
  $DB->AddField("id");
  $DB->AddField("name");
  $DB->AddField("filename");
  $DB->AddField("is_html");
  $DB->AddField("descr");
  $DB->AddField("author");
  $DB->AddField("year");
  //$DB->AddField("volume");
  //$DB->AddField("edition");
  //$DB->AddField("place");
  //$DB->AddField("down_count");
  $DB->AddField("folder_id");
  $DB->AddField("user_id");
  $DB->AddField("hash");

  $DB->AddCondFS("user_id", "=", $user_id);
  if(!empty($year)) $DB->AddCondFS("year", "=", $year);
  if(!empty($author)) $DB->AddCondFS("author", "=", $author);
  if(!empty($descr)) $DB->AddCondFS("descr", "=", $descr);
  $res = $DB->Select();
  while($row = $DB->FetchAssoc($res)) {
  	if(!$row['hash'])
	if(is_file("files/".implode('.', array($row['id'], $row['filename'])))){
		$row['hash'] = md5_file("files/".implode('.', array($row['id'], $row['filename'])));
		//$row['sha1'] = sha1_file("files/".implode('.', array($row['id'], $row['filename'])));
		$DB->SetTable("nsau_files");
		$DB->AddCondFS("id", "=", $row['id']);
		$DB->AddValue("hash", $row['hash']);
		$DB->Update();
	}
	if(!$row['hash'])
	if(is_file("files/".implode('.', array($row['name'], $row['filename'])))){
		$row['hash'] = md5_file("files/".implode('.', array($row['name'], $row['filename'])));
	}
    $row['filename'] = implode('.', array($row['name'], $row['filename']));
	$row['link'] = "http://".$_SERVER['HTTP_HOST']."/file/".$row['id']."/";
    //$row['@id'] = $row['id'];
    unset($row['name']);

    //$files[$row['id']]['file'] = &$row;
    $DB->SetTable("nsau_files_subj");
    $DB->AddField("id");
    $DB->AddField("subject_id");
    $DB->AddField("spec_id");
    $DB->AddField("spec_code");
    $DB->AddField("spec_type");
    $DB->AddField("spec_type_id");
    $DB->AddField("view_id");
    $DB->AddField("education");
    $DB->AddField("approved");
    $DB->AddField("comment");
    $DB->AddField("semester");
    $DB->AddCondFS("file_id", "=", $row["id"]);
    $DB->AddCondFO("subject_id", " is not null ");
    $res_attach = $DB->Select(null, null, true, true, true);

    $attaches = array();

    while($row_attach = $DB->FetchAssoc($res_attach)) {
      $DB->SetTable("nsau_subjects");
      $DB->AddField("name");
      $DB->AddCondFS("id", "=", $row_attach["subject_id"]);
      $res_sub = $DB->Select();
      if($row_sub = $DB->FetchAssoc($res_sub)) {
      	//$row["attach_file_list"][$row_attach['id']]['subject_name'] = $row_sub["name"];
        $attaches[$row_attach['id']]['attachment']['subject_name'] = $row_sub["name"];
      }
      //$row["attach_file_list"][$row_attach['id']]['subject_id'] = $row_attach["subject_id"];
      $attaches[$row_attach['id']]['attachment']['subject_id'] = $row_attach["subject_id"];
      $DB->SetTable("nsau_specialities");
      $DB->AddField("name");
      $DB->AddCondFS("id", "=", $row_attach["spec_id"]);
      $row_sub = $DB->Select();
      if($row_sub = $DB->FetchAssoc($row_sub)) {
      	$attaches[$row_attach['id']]['attachment']['spec_name'] = /*$row_attach["spec_code"].'.'.$row_attach["spec_type"].' - '.*/$row_sub["name"];
      }
      //$row["attach_file_list"][$row_attach['id']]['spec_code'] = $row_attach["spec_code"];
      //$row["attach_file_list"][$row_attach['id']]['spec_id'] = $row_attach["spec_id"];
      $attaches[$row_attach['id']]['attachment']['spec_code'] = $row_attach["spec_code"];
	  //$attaches[$row_attach['id']]['attachment']['spec_name'] = $row_attach["spec_code"];
      $attaches[$row_attach['id']]['attachment']['spec_id'] = $row_attach["spec_id"];
      $attaches[$row_attach['id']]['attachment']['spec_type'] = $row_attach["spec_type"];
      $attaches[$row_attach['id']]['attachment']['spec_type_id'] = $row_attach["spec_type_id"];
      $attaches[$row_attach['id']]['attachment']['@semester'] = $row_attach["semester"];
      $attaches[$row_attach['id']]['attachment']['@kind'] = $row_attach["view_id"];
      $DB->SetTable("nsau_file_view");
      $DB->AddField("view_name");
      $DB->AddCondFS("id", "=", $row_attach["view_id"]);
      $row_view = $DB->Select();
      if($row_view = $DB->FetchAssoc($row_view)) {
      	//$row["attach_file_list"][$row_attach['id']]['spec_view'] = $row_view["view_name"];
        $attaches[$row_attach['id']]['attachment']['spec_view'] = $row_view["view_name"];
      }
      $attaches[$row_attach['id']]['attachment']['spec_education'] = $row_attach["education"];
      $attaches[$row_attach['id']]['attachment']['approved'] = $row_attach["approved"];
      $attaches[$row_attach['id']]['attachment']['comment'] = $row_attach["comment"];
      $attaches[$row_attach['id']]['attachment']['@id'] = $row_attach['id'];
      //$attaches[$row_attach['id']] = array();
      //$row["attach_file_list"][$row_attach['id']]['spec_education'] = $row_attach["education"];
      //$row["attach_file_list"][$row_attach['id']]['approved'] = $row_attach["approved"];
      //$row["attach_file_list"][$row_attach['id']]['comment'] = $row_attach["comment"];

    }
    //$attaches = array('attachments' => $attaches);
    $row['attachments'] = $attaches;
	$id = $row['id'];
    unset($row['id']);
    $files[]['file:id='.$id] = array_map_recursive('win2utf', $row); //$row;

  }

  //$xml2arr = new Array2XML('files', $files);
  $files['count'] = count($files);
  $result = array('files' => $files);
  //echo $xml2arr->__toString($xml);
  }
  if($mode == 'subjects'){
  	if(isset($_POST["subject"])){
  		$DB->Exec("SET FOREIGN_KEY_CHECKS=0;"); 
  		$DB->SetTable("nsau_subjects");
  		$DB->AddValue("name", $_POST["subject"]); 
  		$DB->AddValue("department_id", 0);
  		$DB->Insert();
  		$id = $DB->LastInsertID();  
  	}
  	//else 
  	{
    $DB->SetTable("nsau_subjects","s");
    //$DB->AddTable("nsau_departments", "d");
    $DB->AddField("s.id");
    $DB->AddField("s.name");
    $DB->AddField("s.department_id");
    //$DB->AddField("d.name", "department_name");
    //$DB->AddCondFF("d.id", "=", "s.department_id");
    if(!is_null($name)) {
    	$DB->AddCondFS("s.name", "=", utf2win(trim($name)));
    }
    if(!is_null($id)) {
    	$DB->AddCondFS("s.id", "=", intval(trim($id)));
    }
    $res = $DB->Select();
    $subjects = array();
    while($row = $DB->FetchAssoc($res)) {
      $row['@id'] = $row['id'];
      $row["department_name"] = ""; 
      $DB->SetTable("nsau_departments");
      $DB->AddCondFS("id", "=", $row["department_id"]);
      $res_dep = $DB->Select();
      while($row_dep = $DB->FetchAssoc($res_dep))
      {
      	$row["department_name"] = $row_dep["name"];
      	$row["department_id"] = $row_dep["id"];
      }
      unset($row['id']);
      $subjects[]['subject'] = array_map_recursive('win2utf', $row);//$row;
    }

    //print_r($subjects);
	//$subjects = array('subjects' => $subjects);
    //$xml2arr = new Array2XML('subjects', $subjects);
    $subjects["count"] = count($subjects); 
    $result = array('subjects' => $subjects);
    $result['count'] = $subjects["count"];
  	}
    //echo $xml2arr->__toString($xml);
  }
  if($mode == 'specialities'){
  	$DB->SetTable("nsau_specialities");
	if(!is_null($name)) {
		$DB->AddCondFS("name", "=", utf2win(trim($name)));
	}
	if(!is_null($code)) {
		$DB->AddCondFS("code", "=", trim($code));
	}
	if(!is_null($spec_id)) {
		$DB->AddCondFS("id", "=", trim($spec_id));
	}
	$res = $DB->Select();
    $specs = array();
    while($row = $DB->FetchAssoc($res)) {
      $row['@id'] = $row['id'];
	  $types = array();
	  $DB->SetTable("nsau_spec_type");
	  $DB->AddCondFS("spec_id", "=", $row["id"]);
	  $res_type = $DB->Select();
      while($row_type = $DB->FetchAssoc($res_type)) {
      	$row_type['@id'] = $row_type['id'];
		unset($row_type['id']);
      	$types[]['type'] = $row_type;
      }
	  $row['types'] = $types;
      unset($row['id']);
      $specs[]['speciality'] = array_map_recursive('win2utf', $row);//$row;
    }
    $specs["count"] = count($specs);
	$result = array('specialities' => $specs);
	$result['count'] = $specs["count"];
  }
}
else {
  $ar = array('message' => 'Not authorized');
  $result = array('error' => $ar, '@error' => true);
  //$xml2arr = new Array2XML('error', $ar);
  //echo $xml2arr->__toString($xml);
}

$result2 = array('@error' => 0, '@date' => date('Y-m-d H:i:s'));
$result = array_merge($result2, $result);

$xml2arr = new Array2XML('result', $result);
echo $xml2arr->__toString($xml);