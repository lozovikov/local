<?
@header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
@header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); // always modified
@header("Cache-Control: no-store, no-cache, must-revalidate"); // HTTP/1.1
@header("Cache-Control: post-check=0, pre-check=0", false);
@header("Pragma: no-cache");
?>
<style type="text/css"> @import "styles/registration.css"; </style>
   
    
    <div class="center_content">
			    <div class="cn">
				<div id="content-header">
				   
				 <? if (!$secsessful){ ?> <h1>–егистраци€</h1>   <p>
					«арегистрированые пользователи могут просматривать и повтор€ть старые заказы<!--управл€ть своим балансом-->,
					а также получать заказы на указанные адреса и телефоны.<br />
<!--					“ут еше куча приемуществ,
					но € незнаю что написать но полюбому нада чтобы тут что то было написано чтобы всем были пон€тны приемущества!-->
				    </p>
				</div>
				<? if($error) { echo "<p style='color:red' style='margin-top:50px; font-size:20px;' align=center>¬ ходе регистрации произошла ошибка: ".implode(", ",$error)."!</p>"; } ?>
				<form method="POST" action="<?=$_SERVER['PHP_SELF']?>?act=do_reg" id="registration-form">
				    <fieldset id="grup1">
					<span>*</span><input type="text" onblur="hous_nof(this,'им€')" onfocus="hous_f(this)" value="<? if(isset($_POST['name'])){ echo $_POST['name']; } else { echo "им€"; } ?>" name="name"><br>
					<span>*</span><input type="text" onblur="hous_nof(this,'фамили€')" onfocus="hous_f(this)" value="<? if(isset($_POST['surname'])){ echo $_POST['surname']; } else { echo "фамили€"; } ?>" name="surname"><br>
					<input type="text" onblur="hous_nof(this,'отчество')" onfocus="hous_f(this)" value="<? if(isset($_POST['patronymic'])){ echo $_POST['patronymic']; } else { echo "отчество"; } ?>" name="patronymic">
				    </fieldset>
				    <fieldset id="grup2">
					<div class="form-help">
					  <span>*</span>  <input type="text" onblur="hous_nof(this,'логин')" onfocus="hous_f(this)" value="<? if(isset($_POST['login'])){ echo $_POST['login']; } else { echo "логин"; } ?>" name="login">
					    <label>
						логин и пароль нужны дл€ вашей апвторизации и входа в ваш личный кабинет.
					    </label><br>
					</div>
					<span>*</span><input type="password" onblur="hous_nof(this,'пароль')" onfocus="hous_f(this)" value="пароль" name="pass" class="pass">
					<span>*</span><input type="password" onblur="hous_nof(this,'пароль еще раз')" onfocus="hous_f(this)" value="пароль еще раз" name="pass_repeat" class="pass">
				    </fieldset>
				    <fieldset id="grup3">
					<div class="form-help">
					<span>*</span>    <input type="text" onblur="hous_nof(this,'адрес')" onfocus="hous_f(this)" value="<? if(isset($_POST['address'])){ echo $_POST['address']; } else { echo "адрес"; } ?>" name="address">
					    <label>
						наши специалисты будут св€зыватьс€ с вами по этому номеру
					    </label><br>
					</div>
					<div class="form-help">
					 <span>*</span>   <input type="text" onblur="hous_nof(this,'контактный телефон')" onfocus="hous_f(this)" value="<? if(isset($_POST['phone'])){ echo $_POST['phone']; } else { echo "контактный телефон"; } ?>" name="phone">
					    <label>
						ввидите улицу, номер дома,<br> подьезд, квартиру.
					    </label><br>
					</div>
					<span>*</span><input type="text" onblur="hous_nof(this,'e-mail')" onfocus="hous_f(this)" value="<? if(isset($_POST['mail'])){ echo $_POST['mail']; } else { echo "e-mail"; } ?>" name="mail"><br>
					<textarea onblur="hous_nof(this,'дополнительные контактные данные')" onfocus="hous_f(this)" name="contacts_info"><? if(isset($_POST['contacts_info'])){ echo $_POST['contacts_info']; } else { echo "дополнительные контактные данные"; } ?></textarea>
				    </fieldset>
				    <!-- ликабельной кнопке присвоить класс enable-button. ” не кликабельной нет класса-->
				    <input type="submit" value="зарегистрироватьс€" name='reg_set' id="submit" class="enable-button">
				</form><? } else { echo $secsessful; } ?>
			    </div>
			</div>
			<div class="clear-both"></div>
