<?php
// version: 2.4.3
// date: 2012-08-13

foreach ($MODULE_DATA["output"]["messages"]["good"] as $data)
{
	echo "<p class=\"message\">$data</p>\n";
}

foreach ($MODULE_DATA["output"]["messages"]["bad"] as $data)
{
	echo "<p class=\"message red\">$data</p>\n";
}

if (ALLOW_AUTH)
{
	switch ($MODULE_DATA["output"]["mode"])
	{
		case "normal":
		case "normal_new":
			if ($MODULE_DATA["output"]["status"])
			{
?>
					<div id="user_login_info">
						<div class="office_link">
							<a href="/office/" title="Личный кабинет">ЛК</a>
							<a id="log_out" href="/office/logout/" title="Выйти">&nbsp;</a>
						</div>
						<h2><?=$MODULE_DATA["output"]["user_displayed_name"]?></h2>
            <?php if($MODULE_DATA["output"]["old_user"]) { $old_user = $MODULE_DATA["output"]["old_user"]; ?><a href="<?=$EE["unqueried_uri"]?>?<?=$NODE_ID?>[relogin]=<?=$old_user["user_id"];?>&<?=$NODE_ID?>[key]=<?=$old_user["key"];?>">Вернуться</a><?php } ?>
					</div>
<?php
			} else {
				if($MODULE_DATA["output"]["mode"] == "normal_new") { ?>
					<form id="login_form" action="<?=$EE["unqueried_uri"]?>" method="post">
						<fieldset class="retrieve">
							<a href="/remember/">Вспомнить</a>
							<br />
							<a href="/support/registration/">Регистрация</a>
						</fieldset>
						<fieldset>
							<div>
								<input name="<?=$NODE_ID?>[login][username]" type="text" title="логин" placeholder="логин" />
								<div>&nbsp;</div>
							</div>
							<div>
								<input name="<?=$NODE_ID?>[login][password]" type="password" title="пароль" placeholder="пароль" />
								<div>&nbsp;</div>
							</div>
							<input class="submit" type="submit" value="Login" />
						</fieldset>
					</form>
<?php			} else {
?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<h2>Авторизация пользователя</h2>
	<p style="width: 17em; text-align: right"><strong>Имя</strong>: <input type="text" name="<?=$NODE_ID?>[login][username]" value="" maxlength="255" style="width: 9em" /></p>
	<p style="width: 17em; text-align: right"><strong>Пароль</strong>: <input type="password" name="<?=$NODE_ID?>[login][password]" value="" maxlength="255" style="width: 9em" /></p>
	<p><input type="submit" value="Войти в систему" /> <input type="reset" value="Сброс" /></p>
</form>
<?php
				}
			}
			break;

		case "logout":
		if (!$MODULE_DATA["output"]["status"])
			{
?>
<p class="message red">Доступ запрещён.</p>
<?php
			}
			break;
			
		case "remember":
?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<h2>Восстановление пароля</h2>
	<p>Введите логин или e-mail<br>
	<input type="text" size="30" name="<?=$NODE_ID?>[remember][login_email]"></p>
	<p><input type="submit" value="Дальше &rarr;"></p>
<?php
			break;
			
		case "passchange":
?>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<h2>Изменение пароля</h2>
	<p>Введите новый пароль:<br>
	<input type="password" size="30" name="<?=$NODE_ID?>[remember][new_password]"></p>
	<p>Повторите пароль:<br>
	<input type="password" size="30" name="<?=$NODE_ID?>[remember][confirm_password]"></p>
	<input type="hidden" name="<?=$NODE_ID?>[remember][code]" value="<?=$MODULE_DATA["output"]["remember_code"]?>">
	<p><input type="submit" value="Отправить"></p>
<?php
			break;
			
		case "message":
		
			break;
			
		case "edit_params":
?>
<br /><fieldset><legend>Редактирование пользовательских параметров</legend>
<form action="<?=$EE["unqueried_uri"]?>" method="post">
	<?
	foreach ($MODULE_DATA["output"]["userparams"] as $param) {
	?>
	<p><?=$param["title"]?>:<br>
	<input type="text" size="30" name="<?=$NODE_ID?>[params][<?=$param["name"]?>]" value="<?=$param["value"]?>"></p>
	<? } ?>
	<p><input type="submit" value="Сохранить"></p></fieldset>
<?php
			break;
			
		case "show_saveurl_icon": ?>
		<div id="save_url_href" style="float:left"><img  style="cursor:pointer"  title="Ваши закладки"  src="/themes/images/save_url.jpg" /></div> 
			
		<?php
			$savedUrlsHTML = '<table id="saved_urls">';
			if (isset($MODULE_OUTPUT['user_saved_urls']) && !empty($MODULE_OUTPUT['user_saved_urls'])) {
				foreach($MODULE_OUTPUT['user_saved_urls'] as $ind=>$urlInfo) {
					$savedUrlsHTML .= '<tr><td style="text-align:left"><span class="urlHrefInd">'.($ind+1).'</span>. <a title="'.$urlInfo['descr'].'" href="'.$urlInfo['uri'].'">'.$urlInfo['title'].'</a>  <img style="cursor:pointer" data-url="'.$urlInfo['id'].'" class="delUrlHref" title="Удалить адрес этой страницы из закладок" src="/themes/images/delete.png"/></td></tr>';
				}
			} else { 
				$savedUrlsHTML .= '<tr><td>У вас нет сохраненных закладок</td></tr>';
			}
			$savedUrlsHTML .= '</table>';			
		?>
		<script>

		(function($){
		
			$(document).ready(function () {

				userSavingsManager = function (options) {
					var defaults = {
						'savingsFormId': 'saved_urls',
						'delSavingsHrefClass' : 'delUrlHref',
						'savingsHrefIndexClass' : 'urlHrefInd',
						'savingsFormCallerId': 'save_url_href',
						'formTemplateCss' : '/themes/styles/test.css'
					};
					
					this.settings = $.extend(defaults, options);
					this.ajaxFormHandler = null;
					this.formTemplate = '<div><table style="width:100%"><tr><td><hr /><?=$savedUrlsHTML?> <hr /></td></tr><tr><td><input style="width:90%" type="text" value="<?=$_SERVER["HTTP_HOST"].$EE["unqueried_uri"]?>" disabled/></td></tr><tr><td><label>Имя закладки (по умолчанию - название страницы)</lable><input id="urlName" type="text" value="" /></td></tr><tr><td style="text-align:right; padding-right:5px"><input type="submit" title="Сохранить адрес этой страницы в Ваших закладках" value="Сохранить" /></td></tr></table></div>';

					this.init();
				}

				userSavingsManager.prototype = {
					init: function() {
					
						this.ajaxFormHandler = $('#'+this.settings.savingsFormCallerId).createAjaxForm(
							{'withReset': true, 'position': 'Center', 'template': this.formTemplate, 'css': this.settings.formTemplateCss, 'title': 'Ваши закладки', 'id': 'testForm','feedbackModuleId': <?=$MODULE_OUTPUT['feedback_module_id']?>, 
							'ajaxUrl': '<?=AJAX_URL?>', 'ajaxData': {'params': 'test', 'saved_url': '<?=$EE["unqueried_uri"]?>', 'url_name': function() { return $('#urlName').val()}}, 
							'afterSend': {'getAjaxResult': true, 'funcs': [this.refreshSavedUrlsTable], 'params':[[]]},
							
						});
							
						
						self = this;
						$('.'+this.settings.delSavingsHrefClass).live('click', function() {
							var request = {'module': <?=$MODULE_OUTPUT['feedback_module_id']?>,  'params': 'del_saved_url', 'data': {'urlId': $(this).data('url')} };
							var caller = this;
							$.ajax({
								type: 'POST',
								url: <?=AJAX_URL?>, 
								data: request,
								error : function(jqXHR, data, error) {
								},
								success: function(data) {
									if (data) {
										$('.'+self.settings.savingsHrefIndexClass).each(function(ind) {
											if (ind > $(caller).closest('tr').index()) {
												$(this).text(Number($(this).text())-1);
											}
											
										});

										
										if ($('.'+self.settings.savingsHrefIndexClass).size() == 1) {
											$('#'+self.settings.savingsFormId).find('tr').eq(0).find('td').text('У вас нет сохраненных закладок');
											//self.ajaxFormHandler.resize();
										} 
										$(caller).closest('tr').remove();
										
										
										
									}
								}
							});
						});
						
					},
					
					refreshSavedUrlsTable: function(updateDataStr) {
						var updateData = $.parseJSON(updateDataStr);
						if (!$('.'+self.settings.savingsHrefIndexClass).size())
							$('#saved_urls').find('tr').eq(0).find('td').text('');
						$('<tr><td style="text-align:left"><span class="urlHrefInd">'+($('.urlHrefInd').size()+1)+'</span>. <a title="'+updateData['descr']+'" href="'+updateData['url']+'">'+updateData['title']+'</a>  <img style="cursor:pointer" data-url="'+updateData['folderId']+'" class="delUrlHref" title="Удалить адрес этой страницы из закладок" src="/themes/images/delete.png"/></td></tr>').appendTo($('#saved_urls'));
						return 1;
					}		
				}

				uSManager = new userSavingsManager;
				
			});
		})(jQuery);
		</script>
<?php 		break;
	}
}

?>
