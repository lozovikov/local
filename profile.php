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
				    <ul id="order-list"><!--обязательно должны стояль id="first-li" и id="last-li"-->
					<li id="first-li">
					    <div class="choice-outer">
						<div class="corner"><!--Некликабельная ссылка просто приписать disabled-->
						    <a href="#tabs-1"><p>прошлый заказ</p></a>
						</div>
					    </div>
					</li>
					<li id="" class="">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-2"><p>ваш заказ</p></a>
						</div>
					    </div>
					</li>
					<li id="choice_3" class="">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-3"><p>сформируйте<br /> случайный заказ</p></a>
						</div>
					    </div>
					</li>
					<li id="last-li">
					    <div class="choice-outer">
						<div class="corner">
						    <a href="#tabs-4"><p>on-line консультант</p></a>
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
							    <!--     Ширина картинки не должна превышать 150px-->
							    <p>
								<img src="files/order-menu-1.png" />
							    <p>
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
							    <span class="number"></span>
							    <!--     Ширина картинки не должна превышать 180px(но лучше не больше 170px)-->
							    <p>
								<img src="files/order-menu-1.png" />
							    </p>
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
						    </div>						    
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    
						    <div class="order-futer-info">
							<h5>ВАША ЗАКАЗ:</h5>
							<div class="order-futer-title">
							    <p>ваши колории:</p>
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
						<input class="enable-button" type="submit" value="подтвердить заказ" onclick="alert('Типо что-то происходит');return false;" />
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
							    <span class="number"></span>
							    
							    <p>
								<img src="files/order-menu-1.png" />
							    </p>
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
						    </div>
						   
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							
							<input class="enable-button" type="button" value="сформировать" onclick="alert('Незнаю че делает, поэтому сделал не submit.');return false;" />												    
							<a href="#" onclick="alert('Переход в 3-ю вкладку с формой случайного заказа');return false;">
							    вернуться к выбору критериев
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>ВАША ЗАКАЗ:</h5>
							<div class="order-futer-title">
							    <p>ваши колории:</p>
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
						<input class="enable-button" type="submit" value="подтвердить заказ" onclick="alert('Типо что-то происходит');return false;" />
					    </div>
					</form>
				    </div>
				   
				    <div id="tabs-3" class="futer-none">
					
					<div class="order-inset">
					    <div id="random-order-form">
						<p>
						    Часто бывает что наши кленты затрудняются в выборе. В помощь
						    мы предлогаем генератор случайных комбинаций.Ответив на пару
						    вопросов вы получите достаточное количество предложений!
						</p>
						
						<form action="" method="">
						    <p>насколько вы голодны?</p><br />
						    <input type="radio" name="hunger-level" value="хочу перекусить" />
						    <label>хочу перекусить</label><br />
						    <input type="radio" name="hunger-level" value="не отказался бы покушать" />
						    <label>не отказался бы покушать</label><br />
						    <input type="radio" name="hunger-level" value="достаточно голоден" />
						    <label>достаточно голоден</label><br />
						    <input type="radio" name="hunger-level" value="хочу есть как слон" />
						    <label>хочу есть как слон</label><br />
						    <input type="radio" name="hunger-level" value="нас небольшая компанию" />
						    <label>нас небольшая компанию</label><br />
						    <input type="radio" name="hunger-level" value="нас огромная компанию" />
						    <label>нас огромная компанию</label><br />
						    <input type="radio" name="hunger-level" value="нас целый взвод" />
						    <label>нас целый взвод</label><br />
						    <p>выберете район доставки:</p>
						    <select id="region" name="fb[region]" class="styled">
					                <option value="Центральный" selected="selected">Центральный район</option>
					                <option value="Железнодорожный">Железнодорожный район</option>
					                <option value="Ленинский">Ленинский район</option>
					                <option value="Дзержинский">Дзержинский район</option>
							<option value="Октябрьский">Октябрьский район</option>
							<option value="Кировский">Кировский район</option>
							<option value="Калининский">Калининский район</option>
							<option value="Первомайский">Первомайский район</option>
							<option value="Заельцовский">Заельцовский район</option>
							<option value="Советский">Советский район</option>
							<option value="НСО">НСО</option>
						    </select>
						  
						    <input class="random-order-sub enable-button" type="submit" value="сформировать" />
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
							    <h5>Роккотсу гюнику</h5>
							    <p>
							        говяжьи ребра-гриль, тушеные в красном винном соусе. Сервируются маринованными овощами.
							    </p>
							    <a class="add-order" href="#">добавить в заказ</a>
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
						  
						    <div class="order-row-border_1"></div>
						    <div class="order-row-border_2"></div>
						</div>
					    </div>
					    <div class="order-futer">
						<div class="order-futer-content">
						    <div class="order-futer-button">
							
							<input class="enable-button" type="button" value="сформировать" onclick="alert('Незнаю че делает, поэтому сделал не submit.');return false;" />												    
							<a href="#" onclick="alert('Переход в 3-ю вкладку с формой случайного заказа');return false;">
							    вернуться к выбору критериев
						        </a>
						    </div>
						    <div class="order-futer-info">
							<h5>ВАША ЗАКАЗ:</h5>
							<div class="order-futer-title">
							    <p>ваши колории:</p>
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
						<input class="" type="submit" disabled value="подтвердить заказ" onclick="alert('Типо что-то происходит');return false;" />
					    </div>
					</form>
				    </div>
				</div>
			    </div>
			    <div id="modal-dialog-block">
				<div class="modal_dialog">
				    <h3>Подтвердите ваши контактные данные</h3>
				    <form>
				        <input type="text" name="surname" value="Иванов" /><br />
				        <input type="text" name="name" value="Николай"  /><br />
				        <input id="last-input" type="text" name="patronymic" value="Андреевич"  /><br />
				        <select name="modal[phone]"  class="styled">
					    <option>+7913 923 98 74</option>
				        </select><br />
				        <select name="modal[address]" class="styled">
					    <option>Ул.Горького 12, квартира 27</option>
					</select><br />
					<input id="modal-sub" class="enable" type="submit" name="submit" value="Отправить"  /><br />
					<input id="modal-cansel" class="enable" type="button" name="cancel" value="Отменить" onclick="jQuery.fn.modalBox.close();"  />
				    </form>				   
				</div>
			    </div>	
			</div>
			
			<div class="clear-both"></div>
		    </div>