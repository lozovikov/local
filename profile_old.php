<?
class Profile extends Catalog{

function TabsArrat(){
	$sid = session_id();
		if($this->LastZakazDetect()){ 
			$tabs[1] = '������� ����� <br> <div style="font-size:9px;">'.$this->LastZakazDetect().'</div>';
		} 
		
		if(count($_SESSION['ZAK'][$sid])){
			$tabs[2] = '��� �����';
		}
		$tabs[3] = '�����������<br /> <div style="font-size:9px;">��������� �����</div>';
		
		if(count($_SESSION['ZAK'][$sid]) && $this->SoputDetect($_SESSION['ZAK'][$this->Sid()])){
			$tabs[4] = 'on-line �����������';
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

	return '<div ><a href="?act=GotoLoadset_empty_trash" style="font-size:22px; margin:auto;">�������� �����</a></div><br><br><form action="'.$_SERVER['PHP_SELF'].'?act=profile&tab=2" method="POST"><input name="region" type="hidden" value="'.$_SESSION['region'].'"><input name="hunger-level" type="hidden" value="'.$_SESSION['hunger-level'].'">'.$this->ButtonSelector().'</form>';

}
	
function ButtonSelector(){

	$button = array('<input class="random-order-sub enable-button" type="submit" name="generate_trash" value="���������������" style="font-size:16px;" />','<input class="" type="button" disabled value="������������" />');		
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
						    <!--    ��� ������� ����� ���������, �� �� �������. � class="order-row" ������ ������� � ���������-->
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    
						    <div class="order-futer-info">
							<h5>������� �����:</h5>
							<div class="order-futer-title">
							    <p>���� �������:</p>
							    <p>���� ��������:</p>
							    <p class="price_p">���� ����:</p>
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
						<input class="enable-button3" type="submit" name="repeat_last_order" value="��������� �����" style="width:628px;" onclick="return confirm(\'�� ������������� ������ ��������� ������� �����? ���� ������� ������� ����� �������\')" />
					    </div>
					    
					    </div>
					    </form>
					
				    </div>';
	
	
	
		$tab[2] = '<div id="tabs-2">
					
					    <div class="order-inset">
						<div class="order-content">
						'.$this->view_zakaz().'
						<!--    ��� ������� ����� ���������, �� �� �������. � class="order-row" ������ ������� � ���������-->
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
							<h5>��� �����:</h5>
							<div class="order-futer-title">
							    <p>���� �������:</p>
							    <p>���� ��������:</p>
							    <p class="price_p">���� ����:</p>
							</div>
							<div class="order-futer-price" id="trach_id_2">
							    '.$this->MainZakaz(2).'
						        </div>
						    </div>
					        </div>
					    </div>
					    <div id="centred">
					    <div class="approve-order">
						<input class="enable-button" type="submit" value="����������� �����" onclick="return false;" />
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
							    <!--     ������ �������� �� ������ ��������� 180px(�� ����� �� ������ 170px)-->
							    <!--<p>
								<img src="files/order-menu-1.png" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>�������� ������</h5>
							    <p>
							        ��� ��� ���� �� �����
							    </p>
							    <a class="del" href="#">������</a>
							</div>
							<div class="order_namber-piece"><p>9235�/��</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" class="del">-</a>
							    <span num="0">0</span>��
							    <a href="#" class="add">+</a>
							</p></div>
							<div class="order_price-column"><p>467�</p></div>
							<div class="opacyti-order"></div>
						    </div>
						    <div class="order-row order-row-last">
							<div class="order_image-column">
							    <span class="number"></span>-->
							    <!--     ������ �������� �� ������ ��������� 180px(�� ����� �� ������ 170px)-->
							    <!--<p>
								<img src="files/order-menu-1.png" />
							    <p>
							</div>
							<div class="order_title-column">
							    <h5>�������� ������</h5>
							    <p>
							        ������� �����-�����, ������� � ������� ������ �����. ����������� ������������� �������.
							    </p>
							    <a class="del" href="#">������</a>
						        </div>
							<div class="order_namber-piece"><p>9235�/��</p></div>
							<div class="order_namber-column"><p>
							    <a href="#" class="del">-</a>
							    <span num="0">0</span>��
							    <a href="#" class="add">+</a>
							</p></div>
						        <div class="order_price-column"><p>467�</p></div>
						        <div class="opacyti-order"></div>
						    </div>-->
						    <!--    ��� ������� ����� ���������, �� �� �������. � class="order-row" ������ ������� � ���������-->
						    <!--<div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">-->
							<!-- ������ ����� ��� �� ������������ ������, ����� enable-button ��� ������������  
							<input class="" type="button" disabled value="������������" />-->
							<!--<input class="enable-button" type="button" value="������������" onclick="alert(\'������ �� ������, ������� ������ �� submit.\');return false;" />												    
							<a href="#" onclick="alert(\'������� � 3-� ������� � ������ ���������� ������\');return false;">
							    ��������� � ������ ���������
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>��� �����:</h5>
							<div class="order-futer-title">
							    <p>���� �������:</p>
							    <p>���� ��������:</p>
							    <p class="price_p">���� ����:</p>
							</div>
							<div class="order-futer-price">
							    <p class="calorific_value">2046 ����</p>
							    <p class="economy">124 �</p>
							    <p class="price">4367�</p>
						        </div>
						    </div>
					        </div>
					    </div>
					    <div class="approve-order">
						<input class="enable-button" type="submit" value="����������� �����" onclick="alert(\'���� ���-�� ����������\');return false;" />
					    </div>
					</form>-->
					<div class="order-inset">
					    <div id="random-order-form">
						<p>
						    ����� ������ ��� ���� ������ ������������ � ������. � ������
						    �� ���������� ��������� ��������� ����������.������� �� ����
						    �������� �� �������� ����������� ���������� �����������!
						</p>
						<!-- ���� ����� disabled ������ �� �������, ���� enable ��� ������ �������  -->
						<form action="'.$_SERVER['PHP_SELF'].'?act=profile&tab=2" method="POST">
						    <p>��������� �� �������?</p><br />
						   '.implode($prs).'
						  
						    <p>�������� ����� ��������:</p>
						   
						    
						     <select id="region" name="region" class="styled">
					              '.implode($prs2).'
						    						   
						    </select>
						    <!-- ���� ����� disabled-button ������ �� �������, ���� enable-button ��� ������ �������  
						    <input class="random-order-sub disabled-button" type="submit" disabled value="������������" /> -->
						    <input class="random-order-sub enable-button" type="submit" name="generate_trash" value="������������" />
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
						    <!--    ��� ������� ����� ���������, �� �� �������. � class="order-row" ������ ������� � ���������-->
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							<!-- ������ ����� ��� �� ������������ ������, ����� enable-button ��� ������������  
							<input class="" type="button" disabled value="������������" />-->
							<input class="enable-button" type="button" value="������������" onclick="alert(\'������ �� ������, ������� ������ �� submit.\');return false;" />												    
							<a href="#" onclick="alert(\'������� � 3-� ������� � ������ ���������� ������\');return false;">
							    ��������� � ������ ���������
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>��� �����:</h5>
							<div class="order-futer-title">
							    <p>���� �������:</p>
							    <p>���� ��������:</p>
							    <p class="price_p">���� ����:</p>
							</div>
							<div class="order-futer-price">
							    <p class="calorific_value">2046 ����</p>
							    <p class="economy">124 �</p>
							    <p class="price">4367�</p>
						        </div>
						    </div>
					        </div>
					    </div>
					    <div class="approve-order">
						<input class="" type="submit" disabled value="����������� �����" onclick="return false;" />
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
					    � ����� ������� ��������� ��������� ���� �����, ������ ������� �� ������<br />
					    ������������. ��� ������������� ������ ������ ������� ������ &laquo;�����������<br />
					    �����&raquo;, � � ������� 5 ���. � ���� �������� ��� ����������. ���������� �� �����!
					</p>
					<h3><span></span> <?=$fio?></h3>
					<div id="reduction">
					    <p>������ <span><?=$skidka?>%</span></p>
					</div>
					<!-- �������� reduction-info �� �� ��� �� ��������-->
					<div id="reduction-info">
					    <div id="reduction-title">
						
					    </div>
					    
						<? 
						if($_SESSION['su_id']){
						
						foreach($login->ViewSkidkaList() as $skval){
							$sk_list[] = '<p id="level-'.$skval['id'].'"><span>'.$skval['procent'].'%</span> - '.$skval['price'].'�</p>'; 
						} 
						
						//	echo '<div id="reduction-level"></div><p>����� ����� ����� ������� :<span>'.$login->SkidkaPF().'�</span></p></div>';
							echo '<div id="reduction-level">��� ������ ���� � ����� �� ������ ������ 13%<br/>
						������ �������? �� ��������������� ����� ��� �������� - ������ 20%</div>';
						} else {
							echo '<div id="reduction-level">��� ������ ���� � ����� �� ������ ������ 13%<br/>
						������ �������? �� ��������������� ����� ��� �������� - ������ 20%</div>';
						}
						?>						
					    
					    
					
				    </div>
				</div>
				<div id="order-tabs">
				    <ul id="order-list"><!--����������� ������ ������ id="first-li" � id="last-li"-->
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
				    
				    
				    <!-- ����� �������� ����� ������������ ����� futer-none ���� ����� ���� ��� �� ���������(�����)  -->
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
				    <!--   ����� ���� ���� ������..����������� ����� futer-none-->   
				</div>
			    </div>
			     <? //print_r($_SESSION['ZAK'][$prof->Sid()]); ?>	
			     <? //print_r($prof->SoputDetect($_SESSION['ZAK'][$prof->Sid()])); ?>	
			     
			     
			      <? $login->ViewZakazForm(); ?>	
			</div>
			
			<div class="clear-both"></div>
		    </div><!--content-->
		</div>
			 