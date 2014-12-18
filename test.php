<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
$h1 = mysql_connect("192.168.30.14", "nsau", "3tU2a2Xd", 3306, true);
echo mysql_errno().":".mysql_error();
?>