<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Загрузка файлов</title>
<script src="/scripts/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="/scripts/jqueryFileTree/jqueryFileTree.js" type="text/javascript"></script>
<script src="jquery.uploadify.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="uploadify.css">
<style type="text/css">
body {
	background-color: #eee; font: 13px Arial, Helvetica, Sans-serif;
}
</style>
</head>

<body>
	<h1>Выберите файлы для загрузки</h1>
	<form>
		<div id="queue"></div>
		<input id="file_upload" name="file_upload" type="file" multiple="true">
	</form>
	
	<div id="container_id"></div>

	<script type="text/javascript">
		var folder;
		<?php $timestamp = time();?>
		$(function() { 
			$('#file_upload').uploadify({
				'formData'     : {
					'timestamp' : '<?php echo $timestamp;?>',
					'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
				},
				'swf'      : 'uploadify.swf',
				'uploader' : 'uploadify.php'
			});
		});

		
		$(document).ready(function() {
		    $('#container_id').fileTree({
		        root: '../../images/',
		        script: '/scripts/jqueryFileTree/jqueryFileTree.php',
		        expandSpeed: 1000,
		        collapseSpeed: 1000,
		        multiFolder: false
		    }, function(file) {
		    	folder = file.replace('../..', ''); 
			    
			    $('#file_upload').uploadify({
					'formData'     : {
						'folder': folder,
						'timestamp' : '<?php echo $timestamp;?>',
						'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
					},
					'swf'      : 'uploadify.swf',
					'uploader' : 'uploadify.php'
				});
		    	
		    });
		});
	</script>
	
	
	
</body>
</html>