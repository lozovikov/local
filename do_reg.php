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
				   
				 <? if (!$secsessful){ ?> <h1>�����������</h1>   <p>
					����������������� ������������ ����� ������������� � ��������� ������ ������<!--��������� ����� ��������-->,
					� ����� �������� ������ �� ��������� ������ � ��������.<br />
<!--					��� ��� ���� �����������,
					�� � ������ ��� �������� �� �������� ���� ����� ��� ��� �� ���� �������� ����� ���� ���� ������� ������������!-->
				    </p>
				</div>
				<? if($error) { echo "<p style='color:red' style='margin-top:50px; font-size:20px;' align=center>� ���� ����������� ��������� ������: ".implode(", ",$error)."!</p>"; } ?>
				<form method="POST" action="<?=$_SERVER['PHP_SELF']?>?act=do_reg" id="registration-form">
				    <fieldset id="grup1">
					<span>*</span><input type="text" onblur="hous_nof(this,'���')" onfocus="hous_f(this)" value="<? if(isset($_POST['name'])){ echo $_POST['name']; } else { echo "���"; } ?>" name="name"><br>
					<span>*</span><input type="text" onblur="hous_nof(this,'�������')" onfocus="hous_f(this)" value="<? if(isset($_POST['surname'])){ echo $_POST['surname']; } else { echo "�������"; } ?>" name="surname"><br>
					<input type="text" onblur="hous_nof(this,'��������')" onfocus="hous_f(this)" value="<? if(isset($_POST['patronymic'])){ echo $_POST['patronymic']; } else { echo "��������"; } ?>" name="patronymic">
				    </fieldset>
				    <fieldset id="grup2">
					<div class="form-help">
					  <span>*</span>  <input type="text" onblur="hous_nof(this,'�����')" onfocus="hous_f(this)" value="<? if(isset($_POST['login'])){ echo $_POST['login']; } else { echo "�����"; } ?>" name="login">
					    <label>
						����� � ������ ����� ��� ����� ������������ � ����� � ��� ������ �������.
					    </label><br>
					</div>
					<span>*</span><input type="password" onblur="hous_nof(this,'������')" onfocus="hous_f(this)" value="������" name="pass" class="pass">
					<span>*</span><input type="password" onblur="hous_nof(this,'������ ��� ���')" onfocus="hous_f(this)" value="������ ��� ���" name="pass_repeat" class="pass">
				    </fieldset>
				    <fieldset id="grup3">
					<div class="form-help">
					<span>*</span>    <input type="text" onblur="hous_nof(this,'�����')" onfocus="hous_f(this)" value="<? if(isset($_POST['address'])){ echo $_POST['address']; } else { echo "�����"; } ?>" name="address">
					    <label>
						���� ����������� ����� ����������� � ���� �� ����� ������
					    </label><br>
					</div>
					<div class="form-help">
					 <span>*</span>   <input type="text" onblur="hous_nof(this,'���������� �������')" onfocus="hous_f(this)" value="<? if(isset($_POST['phone'])){ echo $_POST['phone']; } else { echo "���������� �������"; } ?>" name="phone">
					    <label>
						������� �����, ����� ����,<br> �������, ��������.
					    </label><br>
					</div>
					<span>*</span><input type="text" onblur="hous_nof(this,'e-mail')" onfocus="hous_f(this)" value="<? if(isset($_POST['mail'])){ echo $_POST['mail']; } else { echo "e-mail"; } ?>" name="mail"><br>
					<textarea onblur="hous_nof(this,'�������������� ���������� ������')" onfocus="hous_f(this)" name="contacts_info"><? if(isset($_POST['contacts_info'])){ echo $_POST['contacts_info']; } else { echo "�������������� ���������� ������"; } ?></textarea>
				    </fieldset>
				    <!--������������ ������ ��������� ����� enable-button. � �� ������������ ��� ������-->
				    <input type="submit" value="������������������" name='reg_set' id="submit" class="enable-button">
				</form><? } else { echo $secsessful; } ?>
			    </div>
			</div>
			<div class="clear-both"></div>
