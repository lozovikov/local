 <style type="text/css"> @import "styles/screen.css"; </style>
    <style type="text/css"> @import "styles/my-cabinet.css"; </style>
    <style type="text/css"> @import "styles/form.css"; </style>
    
    <style type="text/css"> @import "styles/jquery.modalbox.css"; </style>
    <!--[if lte IE 6]><style type="text/css"> @import "styles/ie6-modal-dialog.css"; </style><![endif]-->
	
    <script type="text/javascript" src="scripts/jquery/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery.corner.js"></script>
    <script type="text/javascript" src="scripts/jquery/jquery-ui-1.8.2.custom.min.js"></script>
    <script type="text/javascript" src="scripts/jquery/cusel-min-2.2.js"></script>
	
    <script type="text/javascript" src="scripts/jquery/jquery.modalbox-1.0.9.js"></script>
    
    
    <script src="scripts/setclass.js" type="text/javascript"></script>
    <script src="scripts/gic/tabs.js" type="text/javascript"></script>
    <script src="scripts/keyscroll.js" type="text/javascript"></script>
    <script src="scripts/gic/custom-form-elements.js" type="text/javascript"></script>

    <style type="text/css"> @import "styles/modal_dialog.css"; </style>
<div class="center_content">
			    <div class="cn">
				<? require_once('disigen/content-header-profile.php');?>
				<div id="order-tabs">
				    <ul id="order-list"><!--����������� ������ ������ id="first-li" � id="last-li"-->
					<li id="first-li">
					    <div class="choice-outer">
						<div class="corner"><!--�������������� ������ ������ ��������� disabled-->
						    <a href="#tabs-1"><p>������� �����</p></a>
						</div>
					    </div>
					</li>
					<li id="" class="">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-2"><p>��� �����</p></a>
						</div>
					    </div>
					</li>
					<li id="choice_3" class="">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-3"><p>�����������<br /> ��������� �����</p></a>
						</div>
					    </div>
					</li>
					<li id="last-li">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-4"><p>on-line �����������</p></a>
						</div>
					    </div>
					</li>
				    </ul>
				    <div id="tabs-1">
					<form class="tabs-form" action="" method="">
					    <div class="order-inset">
						<div class="order-content">
						    <div class="order-row">
							<div class="order_image-column">
							    <span class="number"></span>
							    <!--     ������ �������� �� ������ ��������� 150px-->
							    <p>
								<img src="files/order-menu-1.png" />
							    <p>
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
							    <span class="number"></span>
							    <!--     ������ �������� �� ������ ��������� 180px(�� ����� �� ������ 170px)-->
							    <p>
								<img src="files/order-menu-1.png" />
							    </p>
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
						    </div>						    
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    
						    <div class="order-futer-info">
							<h5>���� �����:</h5>
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
						<input class="enable-button" type="submit" value="����������� �����" onclick="alert('���� ���-�� ����������');return false;" />
					    </div>
					</form>
				    </div>
				    <div id="tabs-2">
					<form class="tabs-form" action="" method="">
					    <div class="order-inset">
						<div class="order-content">
						    <div class="order-row">
							<div class="order_image-column">
							    <span class="number"></span>
							   
							    <p>
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
							    <span class="number"></span>
							    
							    <p>
								<img src="files/order-menu-1.png" />
							    </p>
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
						    </div>
						   
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							
							<input class="enable-button" type="button" value="������������" onclick="alert('������ �� ������, ������� ������ �� submit.');return false;" />												    
							<a href="#" onclick="alert('������� � 3-� ������� � ������ ���������� ������');return false;">
							    ��������� � ������ ���������
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>���� �����:</h5>
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
						<input class="enable-button" type="submit" value="����������� �����" onclick="alert('���� ���-�� ����������');return false;" />
					    </div>
					</form>
				    </div>
				   
				    <div id="tabs-3" class="futer-none">
					
					<div class="order-inset">
					    <div id="random-order-form">
						<p>
						    ����� ������ ��� ���� ������ ������������ � ������. � ������
						    �� ���������� ��������� ��������� ����������.������� �� ����
						    �������� �� �������� ����������� ���������� �����������!
						</p>
						
						<form action="" method="">
						    <p>��������� �� �������?</p><br />
						    <input type="radio" name="hunger-level" value="���� ����������" />
						    <label>���� ����������</label><br />
						    <input type="radio" name="hunger-level" value="�� ��������� �� ��������" />
						    <label>�� ��������� �� ��������</label><br />
						    <input type="radio" name="hunger-level" value="���������� �������" />
						    <label>���������� �������</label><br />
						    <input type="radio" name="hunger-level" value="���� ���� ��� ����" />
						    <label>���� ���� ��� ����</label><br />
						    <input type="radio" name="hunger-level" value="��� ��������� ��������" />
						    <label>��� ��������� ��������</label><br />
						    <input type="radio" name="hunger-level" value="��� �������� ��������" />
						    <label>��� �������� ��������</label><br />
						    <input type="radio" name="hunger-level" value="��� ����� �����" />
						    <label>��� ����� �����</label><br />
						    <p>�������� ����� ��������:</p>
						    <select id="region" name="fb[region]" class="styled">
					                <option value="�����������" selected="selected">����������� �����</option>
					                <option value="���������������">��������������� �����</option>
					                <option value="���������">��������� �����</option>
					                <option value="�����������">����������� �����</option>
							<option value="�����������">����������� �����</option>
							<option value="���������">��������� �����</option>
							<option value="�����������">����������� �����</option>
							<option value="������������">������������ �����</option>
							<option value="������������">������������ �����</option>
							<option value="���������">��������� �����</option>
							<option value="���">���</option>
						    </select>
						  
						    <input class="random-order-sub enable-button" type="submit" value="������������" />
						</form>
					    </div>
					</div>
					<div class="order-futer">
					    <div class="order-futer-content"></div>
					</div>
				    </div>
				  
				    <div id="tabs-4" class="futer-none">
					<form class="tabs-form" action="" method="">
					    <div class="order-inset">
						<div class="order-content">
						    <div class="order-row order-row-last">
							<div class="order_image-column">
							    <span class="number"></span>
							    
							    <p>
								<img src="files/order-menu-1.png" />
							    </p>
							</div>
							<div class="order_title-column">
							    <h5>�������� ������</h5>
							    <p>
							        ������� �����-�����, ������� � ������� ������ �����. ����������� ������������� �������.
							    </p>
							    <a class="add-order" href="#">�������� � �����</a>
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
						  
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							
							<input class="enable-button" type="button" value="������������" onclick="alert('������ �� ������, ������� ������ �� submit.');return false;" />												    
							<a href="#" onclick="alert('������� � 3-� ������� � ������ ���������� ������');return false;">
							    ��������� � ������ ���������
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>���� �����:</h5>
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
						<input class="" type="submit" disabled value="����������� �����" onclick="alert('���� ���-�� ����������');return false;" />
					    </div>
					</form>
				    </div>
				</div>
			    </div>
			    <div id="modal-dialog-block">
				<div class="modal_dialog">
				    <h3>����������� ���� ���������� ������</h3>
				    <form>
				        <input type="text" name="surname" value="������" /><br />
				        <input type="text" name="name" value="�������"  /><br />
				        <input id="last-input" type="text" name="patronymic" value="���������"  /><br />
				        <select name="modal[phone]"  class="styled">
					    <option>+7913 923 98 74</option>
				        </select><br />
				        <select name="modal[address]" class="styled">
					    <option>��.�������� 12, �������� 27</option>
					</select><br />
					<input id="modal-sub" class="enable" type="submit" name="submit" value="���������"  /><br />
					<input id="modal-cansel" class="enable" type="button" name="cancel" value="��������" onclick="jQuery.fn.modalBox.close();"  />
				    </form>				   
				</div>
			    </div>	
			</div>
			
			<div class="clear-both"></div>
		    </div>