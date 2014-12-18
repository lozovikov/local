<?
class Profile extends Catalog{

function TabsArrat(){
	$sid = session_id();
		if($this->LastZakazDetect()){ 
			$tabs[1] = 'прошлый заказ <br> <div style="font-size:9px;">'.$this->LastZakazDetect().'</div>';
		} 
		
		if(count($_SESSION['ZAK'][$sid])){
			$tabs[2] = 'ваш заказ';
		}
		$tabs[3] = 'сформируйте<br /> <div style="font-size:9px;">случайный заказ</div>';
		
		if(count($_SESSION['ZAK'][$sid]) && $this->SoputDetect($_SESSION['ZAK'][$this->Sid()])){
			$tabs[4] = 'on-line консультант';
		}
		
		$sid = session_id();
		
		return $tabs;
	
	}

function PervajaVkladka(){

	
	
	if(count($_SESSION['ZAK'][$this->Sid()])){
		$keys[] = 2;
		
	} else {
		foreach($this->TabsArrat() as $key=>$val){
		$keys[] = $key;
		}
		
	}
	return $keys;
}

function Sform(){

	return '<div ><a href="?act=GotoLoadset_empty_trash" style="font-size:22px; margin:auto;">Отменить заказ</a></div><br><br><form action="'.$_SERVER['PHP_SELF'].'?act=profile&tab=2" method="POST"><input name="region" type="hidden" value="'.$_SESSION['region'].'"><input name="hunger-level" type="hidden" value="'.$_SESSION['hunger-level'].'">'.$this->ButtonSelector().'</form>';

}
	
function ButtonSelector(){

	$button = array('<input class="random-order-sub enable-button" type="submit" name="generate_trash" value="переформировать" style="font-size:16px;" />','<input class="" type="button" disabled value="сформировать" />');		
	if($_POST['region'] || $_POST['hunger-level']){
		return $button[0];
	} 
}
	
function Tabs(){
	
		foreach($this->urovni_gologa() as $k => $v){
			
			if($_SESSION['hunger-level'] == $v['kkal']){
				$status_opt1[$k] = 'checked="checked"';
				} else {
				$status_opt1[0] = 'checked="checked"';
				}
		
			$prs[] = "<input type=\"radio\" name=\"hunger-level\" id=\"z{$k}\" value=\"{$v['kkal']}\" {$status_opt1[$k]}/><label for=\"z{$k}\">{$v['name']}</label><br />";							
			} 
			
		foreach($this->zones() as $v1){
			if($_SESSION['region'] == $v1['price']){
				$status_opt = 'selected="selected"';
				} else {
				$status_opt = '';
				}
			$prs2[] = "<option value='{$v1['price']}' {$status_opt}>{$v1['name']}</option>";							
			}
	
		$tab[1] = '<div id="tabs-1">
					
					    <div class="order-inset">
						<div class="order-content">
						     '.$this->LoopLastZak().'							
						    <!--    Это полоски между столбцами, их не трогать. А class="order-row" можете удалять и добавлять-->
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    
						    <div class="order-futer-info">
							<h5>Прошлый заказ:</h5>
							<div class="order-futer-title">
							    <p>ваши калории:</p>
							    <p>ваша экономия:</p>
							    <p class="price_p">ваша цена:</p>
							</div>
							<div class="order-futer-price">
							  '.$this->MainZakaz(1).'
						        </div>
						    </div>
					        </div>
					    </div> 
					    <form method="POST" action="">
					    <div id="centred">
					    <div class="approve-order3">
						<input class="enable-button3" type="submit" name="repeat_last_order" value="повторить заказ" style="width:628px;" onclick="return confirm(\'Вы действительно хотите повторить прошлый заказ? Ваша текущая корзина будет очищена\')" />
					    </div>
					    
					    </div>
					    </form>
					
				    </div>';
	
	
	
		$tab[2] = '<div id="tabs-2">
					
					    <div class="order-inset">
						<div class="order-content">
						'.$this->view_zakaz().'
						<!--    Это полоски между столбцами, их не трогать. А class="order-row" можете удалять и добавлять-->
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						
						
					 
						
						
						   <div class="order-futer-button">
							 
							'.$this->Sform().'										    
							
						    </div>
						    <div class="order-futer-info">
							<h5>Ваш заказ:</h5>
							<div class="order-futer-title">
							    <p>Ваши калории:</p>
							    <p>Ваша экономия:</p>
							    <p class="price_p">Ваша цена:</p>
							</div>
							<div class="order-futer-price" id="trach_id_2">
							    '.$this->MainZakaz(2).'
						        </div>
						    </div>
					        </div>
					    </div>
					    <div id="centred">
					    <div class="approve-order">
						<input class="enable-button" type="submit" value="подтвердить заказ" onclick="return false;" />
					    </div>
					    
					    </div>
					
				    </div>';
	
	
	
		$tab[3] = '<div id="tabs-3" class="futer-none">
					<!--<form class="tabs-form" action="" method="">
					    <div class="order-inset">
						<div class="order-content">
						    <div class="order-row">
							<div class="order_image-column">
							    <span class="number"></span>-->
							    <!--     Ширина картинки не должна превышать 180px(но лучше не больше 170px)-->
							    <!--<p>
								<img src="files/order-menu-1.png" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>Роккотсу гюнику</h5>
							    <p>
							        что это ваще за блюдо
							    </p>
							    <a class="del" href="#">убрать</a>
							</div>
							<div class="order_namber-piece"><p>9235р/шт</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" class="del">-</a>
							    <span num="0">0</span>шт
							    <a href="#" class="add">+</a>
							</p></div>
							<div class="order_price-column"><p>467р</p></div>
							<div class="opacyti-order"></div>
						    </div>
						    <div class="order-row order-row-last">
							<div class="order_image-column">
							    <span class="number"></span>-->
							    <!--     Ширина картинки не должна превышать 180px(но лучше не больше 170px)-->
							    <!--<p>
								<img src="files/order-menu-1.png" />
							    <p>
							</div>
							<div class="order_title-column">
							    <h5>Роккотсу гюнику</h5>
							    <p>
							        говяжьи ребра-гриль, тушеные в красном винном соусе. Сервируются маринованными овощами.
							    </p>
							    <a class="del" href="#">убрать</a>
						        </div>
							<div class="order_namber-piece"><p>9235р/шт</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" class="del">-</a>
							    <span num="0">0</span>шт
							    <a href="#" class="add">+</a>
							</p></div>
						        <div class="order_price-column"><p>467р</p></div>
						        <div class="opacyti-order"></div>
						    </div>-->
						    <!--    Это полоски между столбцами, их не трогать. А class="order-row" можете удалять и добавлять-->
						    <!--<div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">-->
							<!-- Пустой класс для не кликабельной кнопки, класс enable-button для кликабельной  
							<input class="" type="button" disabled value="сформировать" />-->
							<!--<input class="enable-button" type="button" value="сформировать" onclick="alert(\'Незнаю че делает, поэтому сделал не submit.\');return false;" />												    
							<a href="#" onclick="alert(\'Переход в 3-ю вкладку с формой случайного заказа\');return false;">
							    вернуться к выбору критериев
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>ВАШ ЗАКАЗ:</h5>
							<div class="order-futer-title">
							    <p>ваши калории:</p>
							    <p>ваша экономия:</p>
							    <p class="price_p">ваша цена:</p>
							</div>
							<div class="order-futer-price">
							    <p class="calorific_value">2046 ккал</p>
							    <p class="economy">124 р</p>
							    <p class="price">4367р</p>
						        </div>
						    </div>
					        </div>
					    </div>
					    <div class="approve-order">
						<input class="enable-button" type="submit" value="подтвердить заказ" onclick="alert(\'Типо что-то происходит\');return false;" />
					    </div>
					</form>-->
					<div class="order-inset">
					    <div id="random-order-form">
						<p>
						    Часто бывает что наши кленты затрудняются в выборе. В помощь
						    мы предлогаем генератор случайных комбинаций.Ответив на пару
						    вопросов вы получите достаточное количество предложений!
						</p>
						<!-- Если класс disabled кнопка не активна, если enable или пустой активна  -->
						<form action="'.$_SERVER['PHP_SELF'].'?act=profile&tab=2" method="POST">
						    <p>насколько вы голодны?</p><br />
						   '.implode($prs).'
						  
						    <p>выберете район доставки:</p>
						   
						    
						     <select id="region" name="region" class="styled">
					              '.implode($prs2).'
						    						   
						    </select>
						    <!-- Если класс disabled-button кнопка не активна, если enable-button или пустой активна  
						    <input class="random-order-sub disabled-button" type="submit" disabled value="сформировать" /> -->
						    <input class="random-order-sub enable-button" type="submit" name="generate_trash" value="сформировать" />
						</form>
					    </div>
					</div>
					<div class="order-futer">
					    <div class="order-futer-content"></div>
					</div>
				    </div>';
	
	
	
	
		$tab[4] = ' <div id="tabs-4" class="futer-none">
					<form class="tabs-form" action="" method="">
					    <div class="order-inset">
						<div class="order-content">
						    '.$this->view_Soput().'
						    <!--    Это полоски между столбцами, их не трогать. А class="order-row" можете удалять и добавлять-->
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							<!-- Пустой класс для не кликабельной кнопки, класс enable-button для кликабельной  
							<input class="" type="button" disabled value="сформировать" />-->
							<input class="enable-button" type="button" value="сформировать" onclick="alert(\'Незнаю че делает, поэтому сделал не submit.\');return false;" />												    
							<a href="#" onclick="alert(\'Переход в 3-ю вкладку с формой случайного заказа\');return false;">
							    вернуться к выбору критериев
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>ВАШ ЗАКАЗ:</h5>
							<div class="order-futer-title">
							    <p>ваши калории:</p>
							    <p>ваша экономия:</p>
							    <p class="price_p">ваша цена:</p>
							</div>
							<div class="order-futer-price">
							    <p class="calorific_value">2046 ккал</p>
							    <p class="economy">124 р</p>
							    <p class="price">4367р</p>
						        </div>
						    </div>
					        </div>
					    </div>
					    <div class="approve-order">
						<input class="" type="submit" disabled value="подтвердить заказ" onclick="return false;" />
					    </div>
					</form>
				    </div>';
	return $tab;
	}
	
	function orderTabs(){
	
		
	
	}

}
$prof = new Profile();
?>
<script src="scripts/gic/tabs2.js" type="text/javascript"></script>
<style type="text/css"> @import "styles/screen.css"; </style><style type="text/css"> @import "styles/my-cabinet.css"; </style><style type="text/css"> @import "styles/form.css"; </style><style type="text/css"> @import "styles/jquery.modalbox.css"; </style><!--[if lte IE 6]><style type="text/css"> @import "styles/ie6-modal-dialog.css"; </style><![endif]--><script type="text/javascript" src="scripts/jquery/jquery-1.4.2.min.js"></script>   <script type="text/javascript" src="scripts/jquery/jquery.corner.js"></script>    <script type="text/javascript" src="scripts/jquery/jquery-ui-1.8.2.custom.min.js"></script>    <script type="text/javascript" src="scripts/jquery/cusel-min-2.2.js"></script>	<script type="text/javascript" src="scripts/jquery/jquery.modalbox-1.0.9.js"></script><script src="scripts/setclass.js" type="text/javascript"></script><script src="scripts/keyscroll.js" type="text/javascript"></script>    <script src="scripts/gic/custom-form-elements.js" type="text/javascript"></script>    <style type="text/css"> @import "styles/modal_dialog.css"; </style>    <!--[if lte IE 7]><style type="text/css"> @import "styles/ie-fix.css"; </style><![endif]-->
<script type="text/javascript">
	coselected_item_id = false; 
</script>
<div class="center_content">
			    <div class="cn">
				<div id="content-header">
				    <div id="cabinet">
				    	<p>
					    В вашей корзине находятся выбранные вами блюда, список которых вы можете<br />
					    регулировать. Для подтверждения вашего заказа нажмите кнопку &laquo;Подтвердить<br />
					    заказ&raquo;, и в течении 5 мин. с вами свяжется наш специалист. Благодарим за выбор!
					</p>
					<h3><span></span> <?=$fio?></h3>
					<div id="reduction">
					    <p>скидка <span><?=$skidka?>%</span></p>
					</div>
					<!-- удаление reduction-info ни на что не повлияет-->
					<div id="reduction-info">
					    <div id="reduction-title">
						
					    </div>
					    
						<? 
						if($_SESSION['su_id']){
						
						foreach($login->ViewSkidkaList() as $skval){
							$sk_list[] = '<p id="level-'.$skval['id'].'"><span>'.$skval['procent'].'%</span> - '.$skval['price'].'р</p>'; 
						} 
						
						//	echo '<div id="reduction-level"></div><p>общая сумма ваших заказов :<span>'.$login->SkidkaPF().'р</span></p></div>';
							echo '<div id="reduction-level">При заказе блюд с сайта вы имеете скидку 13%<br/>
						Хотите дешевле? на предварительный заказ без доставки - скидка 20%</div>';
						} else {
							echo '<div id="reduction-level">При заказе блюд с сайта вы имеете скидку 13%<br/>
						Хотите дешевле? на предварительный заказ без доставки - скидка 20%</div>';
						}
						?>						
					    
					    
					
				    </div>
				</div>
				<div id="order-tabs">
				    <ul id="order-list"><!--обязательно должны стояль id="first-li" и id="last-li"-->
					<? 
				
					$v_dec = $prof->PervajaVkladka();
					if(!$_GET['tab']){
						$vladka_active = $v_dec[0];
					} else {
						$vladka_active = $_GET['tab'];					
					}
					$num_count_tab = count($prof->TabsArrat());
					$mz = 1;
					foreach($prof->TabsArrat() as $ll=>$bb){
					
					if($mz == 1){
						$idLi= 'first-li';
					} else {
						$idLi= '';
					}
					
					if($mz == 4){
						$idLi= 'last-li';
					}
					
					
					
					
					if($vladka_active == $ll){
					
						$id = 'ui-state-active';
					
					} else {
						
						$id = 'ui-state-default';
						
					}
					
					
									
					
					
					echo '<li id="'.$idLi.'" class="'.$id.'">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="?act=profile&tab='.$ll.'" id="'.$id.'"><p>'.$bb.'</p></a>
						</div>
					    </div>
					</li>';
					$mz++;
					} ?>				
				    </ul>
				    
				    
				    <!-- Когда выводите форму приписывайте класс futer-none чтоб футер стал как бы невидимым(белым)  -->
<?

$pro_tab = $prof->Tabs();
	foreach($prof->Tabs() as $ll=>$bb){
		$pro_tab[$ll] = $bb;
}

switch($_GET['tab']){
	case 1:	
	echo $pro_tab[$_GET['tab']];
	break;
	
	case 2:
	echo $pro_tab[$_GET['tab']];
	break;
	
	case 3:
	echo $pro_tab[$_GET['tab']];
	break;
	
	case 4:
	if(!$prof->SoputDetect($_SESSION['ZAK'][$prof->Sid()])){
		die("<body onload=\"location.href='{$_SERVER['PHP_SELF']}?act=profile'\">");
	}
	echo $pro_tab[$_GET['tab']];
	break;
	
	default:
	$tab_s = $prof->PervajaVkladka();
	echo $pro_tab[$tab_s[0]];
	break;
	
}
/*				    
$pro_tab = $prof->Tabs();
	foreach($prof->TabsArrat() as $ll=>$bb){
		echo $pro_tab[$ll];
} */ ?>
				    <!--   Здесь тоже нету футера..приписываем класс futer-none-->   
				</div>
			    </div>
			     <? //print_r($_SESSION['ZAK'][$prof->Sid()]); ?>	
			     <? //print_r($prof->SoputDetect($_SESSION['ZAK'][$prof->Sid()])); ?>	
			     
			     
			      <? $login->ViewZakazForm(); ?>	
			</div>
			
			<div class="clear-both"></div>
		    </div><!--content-->
		</div>
			 