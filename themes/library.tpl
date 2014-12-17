<!DOCTYPE HTML>
<!--[if lt IE 7 ]><html class="no-js ie6" lang="ru"><![endif]-->
<!--[if IE 7 ]><html class="no-js ie7" lang="ru"><![endif]-->
<!--[if IE 8 ]><html class="no-js ie8" lang="ru"><![endif]-->
<!--[if IE 9 ]><html class="no-js ie9" lang="ru"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="ru"><!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<title><?php include $EE["theme"] . "_page_title" . TEMPLATE_EXT ?></title>
<!--[if IE]>
		<script>
			document.createElement('header');
			document.createElement('nav');
			document.createElement('section');
			document.createElement('article');
			document.createElement('aside');
			document.createElement('footer');
		</script>
	<![endif]-->
<link href="/themes/styles/library.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/scripts/jquery/jquery-1.5.1.js"></script>
<script type="text/javascript" src="/scripts/no-ie6-lib.js"></script>
<link rel="stylesheet" href="/themes/styles/no-ie6-lib.css" type="text/css" media="screen" />
<?php include $EE["theme"] . "_head_extra" . TEMPLATE_EXT ?>
</head>

<body> 
<!--[if lte IE 7]><div id="no-ie6">
	<div id="no-ie6-img"></div>
	<p>�� ����������� ���������� ������� Internet Explorer <![endif]--><!--[if IE 6]>6<![endif]--><!--[if IE 7]>7<![endif]--><!--[if lte IE 7]>. ��������� ������� <a href="http://www.microsoft.com/rus/windows/internet-explorer/">����������</a>.</p>
	<a id="no-ie6_close" href="#" title="�������">&times;</a>
</div><![endif]-->

<div id="nofooter">
<section id="page-header">
		 <div id="header" class="block-center">
				<a id="logo" href="/">
					<span></span>
				</a>

			<div class="block-center2" >
       	
        <div id="library" >
        	<a  href="/library/">
        </a>
    	</div>
			
		
			
							
		    </div>
	
</section><section id="fon"><div></div></section>
<div id="navi">

<hr class="hr_top">


 <?php
	$NODEGROUP = "submenu";
		if (($EE["modules_data"][$NODEGROUP]))
		    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
?>		

                            
                         
        <div id="login_search">
                           						
						<fieldset>
							
							
							<?php
					$NODEGROUP = "search";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
					?>	
						
						</fieldset>
				                  
</div>
                            
                 
</div>                  
           
        




<div id="content-wrapper">
		<div id="content">

<div class="title_text"><h3><?=$EE['footsteps'][count($EE['footsteps'])-1]['title']?></h3></div>
<div class="title_hr"></div>




<div id="dup_navi" style="margin-bottom: 1em;"><?php include $EE["theme"] . "_library_dup_navi" . TEMPLATE_EXT ?></div>
<?$NODEGROUP = "content";
	if (($EE["modules_data"][$NODEGROUP]))
		include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
?>


  
   
  
</div>
</div>
<div id="extra">
		<hr class="hr_top"><h1>����� ��������</h1>
<aside class="new">


   
   <?php
					$NODEGROUP = "right_top";
					if (($EE["modules_data"][$NODEGROUP])) {
					    include $EE["theme"] . "_nodegroup" . TEMPLATE_EXT;
					}
				?>	
   
</aside>


</div>



<div id="footer-pusher"></div>
		
		</section>
		</div>
		
		<div id="footer">
	<div class="wrapper">
			
			<div id="copyright">
							<p>
&nbsp;&copy;&nbsp;1998 - 2013 ������������� ��������������� �������� �����������. <a href="http://www.mcx.ru/" title="������������ ��������� ��������� ���������� ���������">������������ ��������� ��������� ��</a>.<br />
&nbsp;&nbsp;&nbsp;�� �������� ���������������� ������� ����������� � <a href="/support/">������ ����������� ���������</a>.<br />
&nbsp;&nbsp;&nbsp;������������� � ����������� ��� <a href="http://nsau.edu.ru/images/about/smi_license.jpg" >�� ���77-43853 �� 9 ������� 2011 ����</a>.<br />
&nbsp;&nbsp;&nbsp;������ ����������� ������� �� ������� � ����� �����, �������������� ���������� � �������� ������������ (������������).
</p>
				<div style="display: none"><?php echo $sape->return_links(); ?></div>
			</div>
		</div>

</div>


</body>
</html>
