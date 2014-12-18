<?
/*
mail@poganini.ru version 2.1
03.12.2011 
*/
error_reporting(7);

if(!$connect){
	session_start();
header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache"); 
	include_once "connect.class.php";
	include_once "login.class.php";
}                                                                                                                              
class Catalog extends Login{
#Переменные по умолчанию
	var $kal = 'ваши калории';
#Получение текущей сессии
function Sid(){
	return session_id();
}

function getStatusMenuLink()
{		
	$query = "
		SELECT `is_active`
		FROM `nav_items`
		WHERE `strkey` = 'menu'
		LIMIT 1;
		";
	$res = mysql_query($query);
	if ((false !== $res) && (false !== ($row = mysql_fetch_row($res)))) {
		return (bool)$row[0];
	}
	else {
		return NULL;
	}
	
}

function getEvents($passed = false, $limit = NULL, $including_inactive = false)
{
	$conds = array();
	
	if ($passed === false) {
		$conds[] = "(`time` >= NOW())";
	}
	elseif ($passed === true) {
		$conds[] = "(`time` < NOW())";
	}
	
	if (!$including_inactive) {
		$conds[] = "(`is_active`)";
	}
	
	$query = "
		SELECT `id`, `is_active`, `time`, `title`, `short_text`, `text`, `image`
		FROM `events`
		WHERE " . ((count($conds) > 0) ? implode(' AND ', $conds) : '1') . "
		ORDER BY `time` DESC
		" . (is_numeric($limit) ? "LIMIT $limit" : '') . "
		";
	//echo $query;   // Дебагим
		
	$res = mysql_query($query);
	
	$output = array();
	
	while (false !== ($row = mysql_fetch_object($res))) {
		$output[] = array(
			'id'			=> $row->id,
			'is_active'		=> (bool)$row->is_active,
			'time'			=> $row->time,
			'title'			=> $row->title,
			'short_text'	=> $row->short_text,
			'text'			=> $row->text,
			'image'			=> $row->image,
			);
	}
	
	//print_r($output);
	
	return $output;
}


// Информация о событии
function getEventSingle($id)
{
	if (!is_numeric($id) || ($id < 1)) {
		return false;
	}
	
	$query = "
		SELECT `time`, `title`, `short_text`, `text`
		FROM `events`
		WHERE `id` = $id
		LIMIT 1
		";			
	$res = mysql_query($query);
	
	if (($res === false) || (false === ($row = mysql_fetch_assoc($res)))) {
		return false;
	}
	
	return $row;
	
}



#
// Скан директории картинок 
function scan_dir($dirname,$heightsize=false){
	if(!$heightsize){
		$heightsize=104;
	}
	
		$dir = @opendir('files/'.$dirname);
		
		while (($file = @readdir($dir)) !== false){
		
			$file_proverka = 'files/'.$dirname.'/'.$file;
			if(is_file($file_proverka))
			{
			
				$r[] = "files/{$dirname}/{$file}";
			
			
			}
		}
			
			@closedir($dir);
		return $r;
		
	
	}
#Подсчет общей суммы заказов в профиле во вкладках
	function MainZakaz($par){
		if($par == 2){
			$par = $_SESSION['ZAK'][$this->Sid()];
		}
		
		if($par == 1){
			$par = $_SESSION['LAST_ZAK'][$this->Sid()];
		}
		
		$count = count($par);
		
		
		$sumt = 0;
		$kkalt = 0;
		$tnum = 0;
		$eco = 0;
		
		
		if($count){
					
			foreach($par as $key => $val){
			
				$item = $this->ViewItemFromTrach($key);
			
				$sum = $item[1] * $val;
				
				$kkal = $item[2] * $val;
				
				$sumt = $sumt + $sum;
				
				$kkalt = $kkalt + $kkal;
				
				$tnum = $tnum + $val;				
			
			}

		}
		
		
		$z = $sumt/100 * $this->Select_Skidka_Procent_From_Db();
		

	return '<p class="calorific_value">'.$kkalt.' ккал</p><p class="economy">'.$z.' р</p><p class="price">'.($sumt-$z).'р</p>';		
	
	}

#Отображение статических страниц
	function show_static_page($show){
	
		$res = mysql_query("SELECT * FROM `static_data` WHERE `context`='{$show}'");
		if(@mysql_num_rows($res)){
			while($r=mysql_fetch_assoc($res)){
				echo $r['text'];
				
			}
		
		}
	
	}
#Выборка названий из каталога
	function ViewItemsCat(){
	
		$res = mysql_query("select DISTINCT `cat_id` as `cat_id` from `products`");
		if(@mysql_num_rows($res)){
			while($r=mysql_fetch_assoc($res)){
				$cat_id[$r['cat_id']] = $r['cat_id'];
				
			}
		return $cat_id;
		}
	
	}
#Вывод ссылок каталога
	function Cat(){
	global $name_cat;
		$res = mysql_query("SELECT * FROM `catalog` order by position asc");
		$cat_id = $this->ViewItemsCat();
		
		if(@mysql_num_rows($res)){
			while($r=mysql_fetch_assoc($res)){
				$name_cat[$r['id']] = $r['cat_name'];	
				if(isset($cat_id[$r['id']])) {  echo "<li><span><a style='color:{$r['color_link']}' href='?act=view_cat&cat={$r['id']}'>{$r['cat_name']}</a></span></li>";  }
			
			}
		
		}
		return $name_cat;
	}
	
	function CatParam($id){
		$res = mysql_query("SELECT * FROM `catalog` WHERE `id`='{$id}'"); 
		if(@mysql_num_rows($res)){
			$r = mysql_fetch_assoc($res);
			return $r;
		}	else {
			die('Параметры заданы неверно!');
		}
	}
#отображение или скрытие корзины в зависимости на какой странце находится пользователь	
	function Selector($link){
		if(($link == 'view_cat') || ($link == 'profile')){
			echo $this->view_trashsss($link);
		} else {
			if($_GET['show']){
			$this->show_static_page($_GET['show']);
			}
			
		}
	}
#Обращение к БД	
	function queryRows($query){
		$res=mysql_query($query);	// выполнение запроса
		if (!$res) return false;	// выход при ошибке запроса
		$result=array();			// инициализация пустого массива для результата
		while( $row=mysql_fetch_assoc($res)){	// получение результата _по_строке_ (по одной записи)
			$result[]=$row;						// занесение строки (записи) в массив результата
		}
		return $result;
	}
#Получение значений зоны в Новосибирске из БД
	function zones(){
	
		$query = "SELECT * FROM `zones`"; 
		$result = $this->queryRows($query);
			return $result;
	
	}
#Уровни голода из БД
	function urovni_gologa(){
	
		$query = "SELECT * FROM `urovni_gologa`"; 
		$result = $this->queryRows($query);
			return $result;
	
	}
	
#Отображение товаров в каталоге 
function Standart($r,$param1,$param2){
	
	
	if(filter_var($param2%$param1) == ($param1-1)){
		$ss = 'row-last '.$r['group'];
	} else {
		$ss = $r['group'];
	}
	//if (isset($_GET['act'], $_GET['cat']) && ($_GET['act'] === 'view_cat') && ($_GET['cat'] == 14)) {
	//	$r['foto'] = 'files/2010-1017_90246706.png';
	//}
	$coltoch = substr_count($r['foto'],"/"); // получаем колличество точек в имени файла
	$razfilemas = explode("/",$namepolfile); // разделяем имя файла, как массив, на переменные, которые разделены точками
	$razfile = $razfilemas[$coltoch];
	
	if(isset($_SESSION['ZAK'][$this->Sid()][$r['id']])){
		$rem = '<p class="">добавлено &nbsp<span num="'.$_SESSION['ZAK'][$this->Sid()][$r['id']].'">'.$_SESSION['ZAK'][$this->Sid()][$r['id']].'</span>шт
				<a class="full-del" title="убрать все" href="#"></a>
			</p>
			<p class="">
			<a href="#" class="add">добавить</a><a href="#" class="del">убрать</a></p>
			<p class="add_to_order hide"><a href="#" class="add">добавить блюдо в заказ</a></p>';
	} else {
		$rem = '<p class="hide">добавлено &nbsp<span num="0">0</span>шт <a class="full-del" title="убрать все" href="#"></a>							    </p>
			<p class="hide">
				<a href="#" class="add">добавить</a>
				<a href="#" class="del">убрать</a>
			</p>
			<p class="add_to_order"><a href="#" class="add">добавить блюдо в заказ</a></p>';
	}
	
	$order_clm = 'order';
	
	
		$shablon = '<li class="'.$ss.'">
			<div class="drag-drop">
				<div class="menu-img">
					<div class="vhcenter_1"><div class="vhcenter_2"><div class="vhcenter_3">
						<a href="#" class="ui-widget-content" id="'.$r['id'].'" onclick="return false">
						<img class="" src="'.((strlen($r['foto']) > 0) ? $r['foto'] : 'files/thumbs/_nophoto.png').'" alt="&nbsp;" />
						
						</a>
							</div></div></div>
						    </div>
						    <div class="vhcenter_1"><div class="vhcenter_2"><div class="vhcenter_3">
							<div class="menu-title">
							    <h4>'.$r['name'].'<span class="sign"></span></h4>
							    <div class="menu-title-line"></div>
							    <span>'.$r['opisanie'].'</span>
							    <div class="krug">
								<span class="text_1">'.$r['old_price'].'<em></em></span>
								<span class="text_2">'.$r['kalory'].' kcal</span>
								<span class="text_3">'.$r['price'].'</span>
							    </div>
							</div>
							<div class="order">
							    '.$rem.'
							</div>
						    </div></div></div>
					        </div>
					    </li>';
		if (is_int(strpos($ss, 'row-last')) && ($param1 != 3)) {
			$shablon .= '<li class="clear-li"></li>';
		}
		return $shablon;
	}
	
#Сортировка в каталоге	
	function ItemsToCatalog($id,$ord_param=false){
		
		if(!$ord_param){
			$or = 'ORDER BY `pos` ASC';
		}
		
		if($ord_param == 1){
			$or = 'ORDER BY `price` ASC';
		}
		
		if($ord_param == 2){
			$or = 'ORDER BY `kalory` ASC';
		}
		
		if($ord_param == 3){
			$or = 'ORDER BY `name` ASC';
		}
		
		if($ord_param == 4){
			$or = 'ORDER BY `pos` ASC';
		}
		
		$res = mysql_query("select * from `products` WHERE `cat_id`='{$id}' {$or}");
		if(@mysql_num_rows($res)){
		$param = $this->Columns2($_GET['cat']); //3 //2 // 1
		
		if(!$param){ $param = 3; }
		
		$i = 0;
		echo "<ul>";
			while($r=mysql_fetch_assoc($res)){
			
				$items = $r;
				echo $this->Standart($r,$param,$i);
				//echo $this->BigWhite($r);
				
				$i ++;

			}
			
		echo "</ul>";
		}
	}
# Вывод названия каталога
	function ViewName($id){
		
		$r = $this->CatParam($id);
		return $r['cat_name'];
	}
#Смена стиля каталога
	function changeStyle($id){
		
		$r = $this->CatParam($id);
		if($r['style']){
			$style= '<style type="text/css"> @import "styles/userstyles/'.$r['style'].'"; </style>';
			//echo $r['style'];
		return $style;
		}
		
		
	}
#Кол-во колонок в каталоге
	function Columns($id){
		$arr = array('0'=>'three','1'=>'one','2'=>'two','3'=>'three',);
		$r = $this->CatParam($id);
		return $arr[$r['col']];
	}
#Кол-во колонок в каталоге
	function Columns2($id){
		$arr = array('0'=>'3','1'=>'1','2'=>'2','3'=>'3',);
		$r = $this->CatParam($id);
		return $arr[$r['col']];
	}
#Вывод рекомендуемых блюд
	function ViewRecomBluda(){
		//$res = mysql_query("SELECT * FROM `products` WHERE `rekom`='on'");
		$res = mysql_query("SELECT * FROM `products` WHERE `rekom`='on' ORDER BY RAND()"); // thybzi mod
		if(@mysql_num_rows($res)){
		while($r=mysql_fetch_assoc($res)){
				//echo "<li class=\"current\"><div class=\"drag-drop\"><div class=\"menu-img\"><div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\"><a href=\"#\" class=\"ui-widget-content\" id='{$r['id']}'><img class=\"\" src=\"{$r['foto']}\" width='147' alt=\"1\" /></a></div></div></div></div><div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\"><div class=\"menu-title\"><h4>{$r['name']}</h4><div class=\"menu-title-line\"></div><span>{$r['opisanie']}</span><div class=\"krug\"><span class=\"text_1\">{$r['old_price']}<em></em></span><span class=\"text_2\">{$r['kalory']} kcal</span><span class=\"text_3\">{$r['price']}</span></div></div><div class=\"order\"><span class=\"hide\">добавлено</span> <p class=\"add_to_order\"><a href=\"#\" class=\"add\" onclick=\"add_go('{$r['id']}')\">добавить блюдо в заказ</a></p><!--<span class=\"hide\"><span>добавлено</span> 2шт<br /></span><a href=\"#\" class=\"add\">добавить блюдо в заказ</a>--></div></div></div></div></div></li>";	
				echo "<li class=\"current\">
						<div class=\"drag-drop\">
						    <div class=\"menu-img\">
							<div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\">
							    <a href=\"#\" id=\"{$r['id']}\" class=\"ui-widget-content\">
								<img class=\"\" src=\"" . ((strlen($r['foto']) > 0) ? $r['foto'] : 'files/thumbs/_nophoto.png') . "\" width=\"150\" alt=\"&nbsp;\" />
							    </a>
							</div></div></div>
						    </div>
						    <div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\">
							<div class=\"menu-title\">
							    <h4>{$r['name']}</h4>
							    <div class=\"menu-title-line\"></div>
							    <span>{$r['opisanie']}</span>
							    <div class=\"krug\">
								<span class=\"text_1\">{$r['old_price']}<em></em></span>
								<span class=\"text_2\">{$r['kalory']} kcal</span>
								<span class=\"text_3\">{$r['price']}</span>
							    </div>
							</div>
							<div class=\"order\">
							    <p class=\"hide\">
								добавлено &nbsp<span num=\"0\">0</span>шт
								<a class=\"full-del\" title=\"убрать все\" href=\"#\"></a>
							    </p>
							    <p class=\"hide\">
								<a href=\"#\" class=\"add\">добавить</a>
								<a href=\"#\" class=\"del\">убрать</a>
							    </p>
							    <p class=\"add_to_order\"><a href=\"#\" class=\"add\">добавить блюдо в заказ</a></p>
							</div>
						    </div></div></div>
						</div>
					    </li>";					
		}		
		}	
	}

#Вывод самых популярных блюд
	function ViewPopBluda(){
		$res = $this->queryRows("SELECT zakaz FROM `orders_secsessful` LIMIT 50");
			if(count($res)){
				foreach($res as $value){
				
					foreach($value as $key=>$val){
					
						$items = explode(",", $val);
						
						foreach($items as $key_id=>$value_id){
						
						$id_now = explode(":",$value_id);
							$zak[] = $id_now[0];
						}
						//echo implode(', ',$ids);
						//echo implode($items).'<br>';
						
						//echo $val.'<br>';
						unset($ids);
					
					}
					
					
					
				
				}
				$zak_id = array_unique($zak);
				
			}
		
		$r_products = $this->queryRows("SELECT * FROM `products`");
		
		if(count($r_products)){

			foreach($r_products as $value_pr){
			
				$items_pr[$value_pr['id']] = "<li class=\"current\">
						<div class=\"drag-drop\">
						    <div class=\"menu-img\">
							<div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\">
							    <a href=\"#\" id=\"{$value_pr['id']}\" class=\"ui-widget-content\">
								<img class=\"\" src=\"".((strlen($value_pr['foto']) > 0) ? $value_pr['foto'] : 'files/thumbs/_nophoto.png')."\" width=\"150\" alt=\"&nbsp;\" />
							    </a>
							</div></div></div>
						    </div>
						    <div class=\"vhcenter_1\"><div class=\"vhcenter_2\"><div class=\"vhcenter_3\">
							<div class=\"menu-title\">
							    <h4>{$value_pr['name']}</h4>
							    <div class=\"menu-title-line\"></div>
							    <span>{$value_pr['opisanie']}</span>
							    <div class=\"krug\">
								<span class=\"text_1\">{$value_pr['old_price']}<em></em></span>
								<span class=\"text_2\">{$value_pr['kalory']} kcal</span>
								<span class=\"text_3\">{$value_pr['price']}</span>
							    </div>
							</div>
							<div class=\"order\">
							    <p class=\"hide\">
								добавлено &nbsp<span num=\"0\">0</span>шт
								<a class=\"full-del\" title=\"убрать все\" href=\"#\"></a>
							    </p>
							    <p class=\"hide\">
								<a href=\"#\" class=\"add\">добавить</a>
								<a href=\"#\" class=\"del\">убрать</a>
							    </p>
							    <p class=\"add_to_order\"><a href=\"#\" class=\"add\">добавить блюдо в заказ</a></p>
							</div>
						    </div></div></div>
						</div>
					    </li>";
			}
		
		}
		
		if($zak_id && $items_pr){
		
			foreach($zak_id as $num){
				$i[] = $items_pr[$num];
			}
			return implode($i);
			//return $zak;
		}
}		
		
	
#Определение пользователя
function UserDerector(){
	
		if($_SESSION['su_id']){
			$user = $_SESSION['su_id'];
		} else {
			$user = 'guest';
		}
	
		return $this->Sid();
}
#Добавление товара в корзину
	function add_trach($id,$num,$coselect_id=NULL/*,$all_coselectable=NULL*/){		
		
			// noodles mod begin {{
				
			if (isset($coselect_id/*, $all_coselectable*/)
				//&& !is_null($COSELECTED_ITEM_ID) // not needed, 'cause isset() already returns false for NULL vars ;)
				&& ($id != $coselect_id)
			) {
				//if (!isset($_SESSION['ZAK'][$this->Sid()][$COSELECTED_ITEM_ID]) // adding a new coselected with each product
				//	|| ($_SESSION['ZAK'][$this->Sid()][$COSELECTED_ITEM_ID] == 0)
				//) {
					
					$this->add_trach($coselect_id, 1);
					
					//if (is_array($all_coselectable)) {
					//	foreach ($all_coselectable as $elem) {
					//		if ($elem != $coselect_id) {
					//			unset($_SESSION['ZAK'][$this->Sid()][$elem]);
					//		}
					//	}
					//}
					
				//}
			}
			
			// }} noodles mod end
		
			if($_SESSION['ZAK'][$this->Sid()][$id]){
			
				$numb = $_SESSION['ZAK'][$this->Sid()][$id]+$num;
				
				$zzz = $numb;
		
			
			} else {
					
				$zzz = $num;
					
			}

		$_SESSION['ZAK'][$this->Sid()][$id] = $zzz;
	
	}
	
	
#Получение значений о товаре из БД
	function ViewItemFromTrach($id){
	
		$res = mysql_query("SELECT * FROM `products` WHERE `id`='{$id}'");
		if(@mysql_num_rows($res)){
		while($r=mysql_fetch_assoc($res)){
			$item = array($r['name'],$r['price'],$r['kalory'],$r['foto'],$r['opisanie']);	
		}
		return $item;
		} else {
		return false;
		}
	
	}
#Вывод пользовательских сообщений	
	function send_zakaz(){
	
		echo "Заказ успешно отправлен, наши специалисты свяжутся с Вами в течение 15 минут!";
	
	}
	
#########################################################

#Удаление товаров из корзины

function dnum($id){
$total = $_SESSION['ZAK'][$this->Sid()][$id] - 1;
		if($total  > 0){
			$_SESSION['ZAK'][$this->Sid()][$id] = $total ;
		} else {
			unset($_SESSION['ZAK'][$this->Sid()][$id]);
		}
		
				
					
}
#Вывод корзины drug and Drop

function view_trashsss($link = 'view_cat'){
					
		$sumt = 0;
		$kkalt = 0;
		$tnum = 0;
		$eco = 0;
		
		if(count($_SESSION['ZAK'][$this->Sid()])){
			
			foreach($_SESSION['ZAK'][$this->Sid()] as $key =>$val){
			
			$item = $this->ViewItemFromTrach($key);
			
				$sum = $item[1] * $val;
				$kkal = $item[2] * $val;
				$sumt = $sumt + $sum;
				$kkalt = $kkalt + $kkal;
				$tnum = $tnum + $val;				
			}
			
		}
		
		
		$z = 0/*$sumt/100 * $this->Select_Skidka_Procent_From_Db()*/;
		

	echo '
	
											<div id="border_top"></div>
											<div id="border_left"></div>
											<div id="border_bottom"></div>
											<div id="border_right"></div>
											<div id="corner_top_left"></div>
											<div id="corner_bottom_left"></div>
											<div id="corner_bottom_right"></div>
											<div id="corner_top_right"></div>
											<div id="basket_title">
											    <span id="span_first"><a href="?act=profile">ВАШ ЗАКАЗ:</a></span><br />
											    <span>ваши калории:</span><br />
											    <!--<span>ваша экономия:</span><br />-->
											    <span>ваша цена:</span>
											</div>
											<div id="basket_number">
											    <span id="piece_number"><span>'.$tnum.'</span> шт</span><br />
											    <span id="calorific_value"><span>'.$kkalt.'</span> ккал</span><br />
											    <!--<span id="economy"><span>'.$z.'</span> р</span><br />-->
											    <span id="price"><span>'.($sumt-$z).'</span> р</span>
											</div>
';
	if (!isset($_GET['act']) || (isset($_GET['order']) && ($link !== 'profile'))) {
		echo '
											<div id="basket_steer">
											    <div class="vcenter1">
													<div class="vcenter2">
													    <p>
													        <span>Перетащите </span> в выделенное поле выбранное вами<br />
													        <span>блюдо.</span>
													    </p>
													</div>
											    </div>
											</div>';
	}
	
	echo '
											<div id="order-ok">
											    <h3>Ваш заказ принят!</h3>
											    <p>Наши специалисты свяжутся с вами<br /> в течение 5 минут</p>
											</div>
											<div class="clear"></div>
	';
		
}
	

#Вывод заказа в таблицу профиля в колонку Tabs-2	
function view_zakaz(){
	
		
		
		$sumt = 0;
		$kkalt = 0;
		$tnum = 0;
		$eco = 0;
		
	$count = count($_SESSION['ZAK'][$this->Sid()]);	
	$i = 0;		
	if($count){
	
			foreach($_SESSION['ZAK'][$this->Sid()] as $key=>$val){
			
			if(++$i == $count){
				$class = 'order-row order-row-last';
			} else {
				$class = 'order-row';
			}
			
			$item = $this->ViewItemFromTrach($key); //Получение параметров о товаре из базы
			
				$sum = $item[1] * $val;
				$kkal = $item[2] * $val;
				
					    
			$items[] = '<div class="'.$class.'" id="id_col_'.$key.'">
							<div class="order_image-column">
							    <span class="number">'.$i.'</span>
							    <p>
								<img src="'.((strlen($item[3]) > 0) ? $item[3] : 'files/thumbs/_nophoto.png').'" width="150" alt="&nbsp;" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>'.$item[0].'</h5>
							    <p>
							        '.$item[4].'
							    </p>
							    <a class="del" id="'.$key.'" href="#">убрать</a>
							</div>
							<div class="order_namber-piece"><p>'.$item[1].'р/шт</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" rel="2" class="del" id="'.$key.'">-</a>
							    <span num="'.$val.'">'.$val.'</span>шт
							    <a href="#" rel="2" class="add" id="'.$key.'">+</a>
							</p></div><span id="parce_price_'.$key.'" style="display:none;">'.$item[1].'</span><span id="parce_kcal_'.$key.'" style="display:none;">'.$item[2].'</span>
							<div class="order_price-column"><p><span id="price_'.$key.'">'.$sum.'</span>р</p></div>
							<div class="opacyti-order"></div>
					 </div>';
							
				}
				
			return implode($items);
		
	} else {
		// o_O WTF?!
		global $FLAG;
		if (!isset($FLAG)) {
			echo '<p class="bignote">Ваша корзина пока пуста. Для того, чтобы сделать заказ, добавьте в неё блюда из <a href="?act=view_cat&amp;cat=28&amp;order">нашего каталога</a>.</p>';
			$FLAG = true;
		}
		return false;
	}
}
#Вывод заказа в таблицу профиля в колонку Tabs-1
	function view_lasto_zakaz(){
	
		
		
		$sumt = 0;
		$kkalt = 0;
		$tnum = 0;
		$eco = 0;
		
	$count = count($_SESSION['LAST_ZAK'][$this->Sid()]);	
	$i = 0;		
	if($count){
			foreach($_SESSION['LAST_ZAK'][$this->Sid()] as $key=>$val){
			if($key){
			if($i == $count){
				$class = 'order-row order-row-last';
			} else {
				$class = 'order-row';
			}
			
			$item = $this->ViewItemFromTrach($key);
			
				$sum = $item[1] * $val;
				$kkal = $item[2] * $val;
				
					    
			$items[] = '<div class="'.$class.'" id="id_col_'.$key.'">
							<div class="order_image-column">
							    <span class="number"></span>
							    <p>
								<img src="'.((strlen($item[3]) > 0) ? $item[3] : 'files/thumbs/_nophoto.png').'" width="150" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>'.$item[0].'</h5>
							    <p>
							        '.$item[4].'
							    </p>
							    <a class="del" id="'.$key.'" href="#">убрать</a>
							</div>
							<div class="order_namber-piece"><p>'.$item[1].'р/шт</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" rel="1" class="del" id="'.$key.'">-</a>
							    <span num="'.$val.'">'.$val.'</span>шт
							    <a href="#" rel="1" class="add" id="'.$key.'">+</a>
							</p></div><span id="parce_price_'.$key.'" style="display:none;">'.$item[1].'</span><span id="parce_kcal_'.$key.'" style="display:none;">'.$item[2].'</span>
							<div class="order_price-column"><p><span id="price_'.$key.'">'.$sum.'</span>р</p></div>
							<div class="opacyti-order"></div>
					 </div>';
							
				}
			}
			return @implode($items);
		
	} else {
		return false;
	}
	}
	
function ClassRowSelector($par1, $par2){
	if($par1 == $par2){
		return "order-row order-row-last";
	} else {
		return "order-row";
	}
}
#Вывод рекомендуемых блюд
function view_Soput(){
	if($ids = $this->SoputDetect($_SESSION['ZAK'][$this->Sid()])){
	$ids = explode(",",$ids);	
		
		foreach($ids as $value){
			if($value != 0){
				$r[] = $this->queryRows("SELECT * FROM `products` WHERE `id`= '{$value}'");
			}
		}
	
	$count = count($r);	
	
	$items = array(); // thybzi
	
	$i = 1;
	if (is_array($r)) { // thybzi
	foreach($r as $key=>$val){		
			
		$item = $this->ViewItemFromTrach($val[0]['id']);	//Получение параметров о товаре из базы			
					    
		$items[] = '<div class="'.$this->ClassRowSelector($count,$i).'" id="id_col_'.$key.'">
							<div class="order_image-column">
							    <span class="number"></span>
							    <p>
								<img src="'.((strlen($item[3]) > 0) ? $item[3] : 'files/thumbs/_nophoto.png').'" width="150" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>'.$item[0].'</h5>
							    <p>
							        '.$item[4].'
							    </p>
							    <a class="del" id="'.$key.'" href="#">убрать</a>
							</div>
							<div class="order_namber-piece"><p>'.$item[1].'р/шт</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" rel="2" class="del" id="'.$key.'">-</a>
							    <span num="0">0</span>шт
							    <a href="#" rel="2" class="add" id="'.$key.'">+</a>
							</p></div><span id="parce_price_'.$key.'" style="display:none;">'.$item[1].'</span><span id="parce_kcal_'.$key.'" style="display:none;">'.$item[2].'</span>
							<div class="order_price-column"><p><span id="price_'.$key.'">0</span>р</p></div>
							<div class="opacyti-order"></div>
					 </div>';	
		$i++;
	}
	} // thybzi
			
		return implode($items);
			
	}
	
}	
#Распаковка архива истории товаров из БД
function expZak($zak){
	unset($_SESSION['LAST_ZAK']);		
		$items = explode(",",$zak[0]['zakaz']) ;
		
		foreach($items as $key => $val){
		
		$exp[$key] = explode(":",$val);
		
			//$this->OneRow($exp[$key][0],$exp[$key][1]);
			$_SESSION['LAST_ZAK'][$this->Sid()][$exp[$key][0]] = $exp[$key][1];
			
		}
	}
	
function LoadItemInfo($id){
		$r = $this->queryRows("SELECT * FROM `products` WHERE `id`='{$id}'");
		return $r;
	}
#Смена статуса товара в профиле (При нажатии вернуть \ удалить)	
function StatusChaanger($zakaz_id){
		
		if(isset($_SESSION['LAST_ZAK'][$this->Sid()][$zakaz_id])){
			$_SESSION['temp_last'][$this->Sid()][$zakaz_id] = $_SESSION['LAST_ZAK'][$this->Sid()][$zakaz_id];
			unset($_SESSION['LAST_ZAK'][$this->Sid()][$zakaz_id]);
			echo 'set';
		} else {
			$_SESSION['LAST_ZAK'][$this->Sid()][$zakaz_id] = $_SESSION['temp_last'][$this->Sid()][$zakaz_id];
			unset($_SESSION['temp_last'][$this->Sid()][$zakaz_id]);
			echo 'unset';
		}
		
		if(isset($_SESSION['ZAK'][$this->Sid()][$zakaz_id])){
			$_SESSION['temp_new'][$this->Sid()][$zakaz_id] = $_SESSION['ZAK'][$this->Sid()][$zakaz_id];
			unset($_SESSION['ZAK'][$this->Sid()][$zakaz_id]);
			echo 'set';
		} else {
			$_SESSION['ZAK'][$this->Sid()][$zakaz_id] = $_SESSION['temp_new'][$this->Sid()][$zakaz_id];
			unset($_SESSION['temp_new'][$this->Sid()][$zakaz_id]);
			echo 'unset';
		}
		
	}
	
function OneRow($id,$num){
		
		$r = $this->LoadItemInfo($id);
		
		$item = '<div class="order-row">
			<div class="order_image-column">
			<span class="number"></span>
			<p>
			<img src="'.((strlen($r[0]['foto']) > 0) ? $r[0]['foto'] : 'files/thumbs/_nophoto.png').'" />
			</p>
			</div>
			<div class="order_title-column">
			<h5>'.$r[0]['name'].'</h5>
			<p>
			'.$r[0]['opisanie'].'
			</p>
			<!-- a class="del" href="#">убрать</a -->
			</div>
			<div class="order_namber-piece"><p>'.$r[0]['price'].'р/шт</p></div>
			<div class="order_namber-column"><p>
			<!-- a href="#" class="del">-</a -->
			<span num="0">'.$num.'</span>шт
			<!-- a href="#" class="add">+</a -->
			</p></div>
							<div class="order_price-column"><p>'.$r[0]['price'].'р</p></div>
							<div class="opacyti-order"></div>
						    </div>
						    ';
		return $item;
	}
	
#Получение последнего заказа из базы данных
	
	function LoopLastZak(){
	
		$r = $this->queryRows("SELECT * FROM `orders_secsessful` WHERE `user_id`='{$_SESSION['su_id']}' ORDER BY `id` DESC LIMIT 1");
		//print_r($r);
		if(is_array($r)){
			$this->expZak($r);
		
			return $this->view_lasto_zakaz();
		} else {
			return false;
		}
	}
#Получение суммы последнего заказа
	function Ts(){
	$r = $this->queryRows("SELECT * FROM `last_orders_secsessful` WHERE `user_id`='{$_SESSION['su_id']}' ORDER BY `id` DESC LIMIT 1");
	return $r;
	}
	
#Вывод ошибок
function modailBox($error){
	$error = implode(", ",$error);
		return $error;
	
}

#Формирование нового заказа	
function set_zakaz(){
	$count = count($_SESSION['ZAK'][$this->Sid()]);
	$sid = $this->Sid();
	
		
		if(!$_POST['surname']){
			$error[] = 'фамилия';
		}
		
		if(!$_POST['name']){
			$error[] = 'имя';
		}
		
		if(!$_POST['patronymic']){
			$error[] = 'отчество';
		}
		
		if(!$_POST['phone']){
			$error[] = 'телефон';
		}
		
		if(!$_POST['adress']){
			$error[] = 'адрес доставки';
		}
		
		if($count){
		foreach($_SESSION['ZAK'][$this->Sid()] as $key=>$val){
			$arr[] = "{$key}:{$val}";	
		}
		$zak = implode(",",$arr);

		} else {
			$error[] = 'Ваш заказ пуст!';
		}
		$_SESSION['zakaz'] = $this->Sid();
		$user_id = $_SESSION['su_id'];
		if(!$error){
		mysql_query("INSERT INTO `orders_secsessful` (`fio` ,`contacts` ,`zakaz` ,`date`,`session_id`,`user_id`) VALUES ('{$_POST['surname']},{$_POST['name']},{$_POST['patronymic']}','{$_POST['phone']},{$_POST['adress']}', '{$zak}', NOW(), '{$sid}', '{$user_id}')");
		//$this->UnsetZakaz("{$_POST['surname']},{$_POST['name']},{$_POST['patronymic']}","{$_POST['phone']},{$_POST['adress']}","{$zak}",$this->Sid());
		$info = "{$_POST['surname']},{$_POST['name']},{$_POST['patronymic']},{$_POST['phone']},{$_POST['adress']}";
		if($this->SendZakaz($info,$zak)){
			//$mm = 'God';
			} else {
				//$mm = 'No';
			}
		unset($_SESSION['ZAK']);
	$secsess = '
											<div id="border_top"></div>
											<div id="border_left"></div>
											<div id="border_bottom"></div>
											<div id="border_right"></div>
											<div id="corner_top_left"></div>
											<div id="corner_bottom_left"></div>
											<div id="corner_bottom_right"></div>
											<div id="corner_top_right"></div>											
											<div id="order-ok">
											    <h3>Ваш заказ принят!</h3>
											    <p>Наши специалисты свяжутся с вами<br /> в течение 5 минут</p>
											</div>
											<div class="clear"></div>

';

		} else {
		
	$secsess = '
											<div id="border_top"></div>
											<div id="border_left"></div>
											<div id="border_bottom"></div>
											<div id="border_right"></div>
											<div id="corner_top_left"></div>
											<div id="corner_bottom_left"></div>
											<div id="corner_bottom_right"></div>
											<div id="corner_top_right"></div>											
											<div id="order-ok">
											    <h3><b>Ошибка!</b></h3>
											    <p>'.$this->modailBox($error).'</p>
											</div>
											<div class="clear"></div>

';
		
		}
		echo $secsess;
	}
	
	function SoputDetect($items){
				
	if (is_array($items)) {			
		
		foreach($items as $key=>$value){			
			$res[] = $this->queryRows("SELECT `ids` FROM `products` WHERE `id`='{$key}'");
		}
		if(is_array($res)){	
		foreach($res as $val){
			$array[] = $val[0]['ids'];
		}
		}
		
		if(is_array($array)){
		$array_cuted = explode(",",(implode(',',$array)));
		$array_returned = array_unique($array_cuted);
		$array_r = implode(",",$array_returned);
			if(!$array_r){
				return false;
			} else {
				return $array_r;
			}
		}
		
	} else {
		return false;
		}	
			
	}
	
	
	
#Генератор случайного заказа
	function Gener($num){
	$n = mt_rand(1,$num);	
	if(!$n){
		return $this->Gener($num);
	} else {
	return $n;
	}
	}	
	#Генерируем корзину
	function generate_trash($kkal_set=false){
	
	$_SESSION['region'] = $_POST['region'];
	$_SESSION['hunger-level'] = $_POST['hunger-level'];
	
		unset($_SESSION['ZAK']);
		
		$res2 = mysql_query("SELECT * FROM `products`");
			if(@mysql_num_rows($res2)){
				$counter = mysql_num_rows($res2);
			}		
		$query = "SELECT * FROM products";
			$result = $this->queryRows($query);
		$kal = 0;
			foreach($result as $value){
				$items[$value['id']][] = array($value['id'],$value['kalory']);
				
			}
			
		if(isset($_SESSION['hunger-level'])){
			//echo $_SESSION['hunger-level'];
			
			$zakaz_size = $_SESSION['hunger-level'];
		} else {
			$zakaz_size = 20;
		}

		for($i = 0; $i < $zakaz_size; $i++){
		$arr3[$i] = $items[$this->Gener($counter)];
			if(is_array($arr3[$i])){
				$arr4[] = $arr3[$i];
			}
		}
		foreach($arr4 as $key=>$val){
			
			
			$this->add_trach($val[0][0],1);
			
		}
		
}

#Проверка на пердмет прошлых заказов

function LastZakazDetect(){
if($_SESSION['su_id']){	
		$res = mysql_query("SELECT `date` FROM `orders_secsessful` WHERE `user_id`='{$_SESSION['su_id']}'");
		if(@mysql_num_rows($res)){
			$r = mysql_fetch_assoc($res);
		$date_last_zakaz = $r['date'];
		$d = explode(" ",$r['date']);
		$y = explode("-",$d[0]);
		
			return "<b style='color:black;'>{$y[2]}.{$y[1]}.{$y[0]}</b> {$d[1]}";
		} else {
			return false;
		}
	} else {
	return false;
	}
} 
#Удаление заказов из корзины
function DelSessionItems(){
	
	unset($_SESSION['ZAK'][$this->Sid()]);
		
}
#Добавление кол-во при нажатиее на + в таблице профиля
function add_item_new_zakaz($item,$cat){
		
		if($cat == 2){
			$this->add_trach($item,1);
		}
		if($cat == 1){
			$num = $_SESSION['LAST_ZAK'][$this->Sid()][$item]+1;
			$_SESSION['LAST_ZAK'][$this->Sid()][$item] = $num;
		}
	}
#Удаление кол-во при нажатиее на + в таблице профиля	
function del_item_new_zakaz($item,$cat){
		
		if($cat == 2){
			$this->dnum($item);
		}
		if($cat == 1){
			if($num >0){
			$num = $_SESSION['LAST_ZAK'][$this->Sid()][$item]-1;
			$_SESSION['LAST_ZAK'][$this->Sid()][$item] = $num;
			} else {
			unset($_SESSION['LAST_ZAK'][$this->Sid()][$item]);
			}
		}
	}
#Переадресация на третью вкладку в профиле	
function goTab3(){
//header('Location: ?act=profile#tabs-3');
}
	
	function TrashSelector($par){
		if($par == 1){
		
		}
		
		if($par == 2){
			echo $this->MainZakaz($par);
		}
	}
	
}
	
$catalog  =  new Catalog();
if(isset($_GET['tid'])){
	$catalog->add_trach($_GET['tid'],1);
}
if(isset($_GET['did'])){
	$catalog->delet_zakaz($_GET['did']);
}
if(isset($_GET['delfromtrash'])){
	$catalog->delet_zakaz($_GET['delfromtrash']);
}
#######################################

if($_GET['dnum']){
	$catalog->dnum($_GET['dnum']);
}
if($_GET['pnum']){
	$catalog->pnum($_GET['pnum']);
}

if(isset($_GET['viewcat'])){
	$catalog->view_trash1();
}

if($_GET['add_zakaz']){
@header("Content-Type: text/html; charset=windows-1251");

	if (isset($_GET['coselect_id']/*, $_GET['all_coselectable']*/)
		&& is_numeric($_GET['coselect_id'])
		//&& (strlen($_GET['all_coselectable']) > 0)
	) {
		$coselect_id = $_GET['coselect_id'];
		//$all_coselectable = explode(',', $_GET['all_coselecable']);
	}
	else {
		$coselect_id = NULL;
		//$all_coselectable = NULL;
	}

	$catalog->add_trach($_GET['add_zakaz'],1, $coselect_id/*, $all_coselectable*/);
	$catalog->view_trashsss();
	
}
if($_GET['delzakaz']){
@header("Content-Type: text/html; charset=windows-1251");

	$catalog->dnum($_GET['delzakaz']);
	$catalog->view_trashsss();
	
}

##Таблица в профиле###
if(isset($_POST['add_profile_item'])){
	$catalog->add_item_pf($_POST['add_profile_item']);
	
}
if(isset($_POST['del_profile_item'])){
	$catalog->del_item_pf($_POST['del_profile_item']);
	
}
if(isset($_GET['set_profile_item'])){
	$catalog->set_profile_item($_GET['set_profile_item']);
	
}

if(isset($_GET['loadsum'])){
@header("Content-Type: text/html; charset=windows-1251");
	$catalog->view_trashsss2();
	
}
if(isset($_POST['generate_trash'])){
	//$catalog->generate_trash($_POST['hunger-level']);
	require_once(dirname(__FILE__) . '/random.php');
	generateRandomOrderForSite();
}
if(isset($_POST['select_status'])){
	$catalog->StatusChaanger($_POST['select_status']);
}
if($_GET['act'] == 'GotoLoadset_empty_trash'){
	$catalog->DelSessionItems();
}

if($_POST['add_item_new_zakaz'] && $_POST['category']){
@header("Content-Type: text/html; charset=windows-1251");
	if (isset($_POST['coselect_id']/*, $_POST['all_coselectable']*/)
		&& is_numeric($_POST['coselect_id'])
		//&& (strlen($_POST['all_coselectable']) > 0)
	) {
		$coselect_id = $_POST['coselect_id'];
		//$all_coselectable = explode(',', $_POST['all_coselecable']);
	}
	else {
		$coselect_id = NULL;
		//$all_coselectable = NULL;
	}
	$catalog->add_item_new_zakaz($_POST['add_item_new_zakaz'],$_POST['category'], $coselect_id/*, $all_coselectable*/);
}
if($_POST['del_item_new_zakaz'] && $_POST['category']){
@header("Content-Type: text/html; charset=windows-1251");
	$catalog->del_item_new_zakaz($_POST['del_item_new_zakaz'],$_POST['category']);
}
if($_GET['act'] == 'move_tab3'){
	$catalog->goTab3();
}
if($_GET['trash_update']){
@header("Content-Type: text/html; charset=windows-1251");
	$catalog->TrashSelector($_GET['trash_update']);
}