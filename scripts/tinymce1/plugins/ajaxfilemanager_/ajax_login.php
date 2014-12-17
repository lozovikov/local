<?php
	/**
	 * access control login form
	 * @author Logan Cai (cailongqun [at] yahoo [dot] com [dot] cn)
	 * @link www.phpletter.com
	 * @since 22/April/2007
	 *
	 */
require_once(dirname(__FILE__) . DIRECTORY_SEPARATOR . "inc" . DIRECTORY_SEPARATOR . "config.php");
//Code added to adjust for local admin rights.
if(!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] === false) {
	
	if(isset($_POST['username']))
	{
		if($auth->login())
		{
			header('Location: ' . appendQueryString(CONFIG_URL_HOME, makeQueryString()));
			exit;
		}
	}
}else{
	$_SESSION['ajax_user'] = true;
	header('Location: ' . appendQueryString(CONFIG_URL_HOME, makeQueryString()));
	exit;
}
?>
