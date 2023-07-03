<?php
//main variables
$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
$user_agent = $_SERVER['HTTP_USER_AGENT'];
mkdir($ip, 0777, true);
$file_path = $ip. "/info.txt";
$file = fopen($file_path, 'a');
fwrite($file, " \r \n " );
//get dname
header('Content-Type: text/html');
$dname = $_GET['dname'];
fwrite($file, $dname . "\n");
//get ip with user agent
fwrite($file, "IP Address: " . $ip . "\n\n");
fwrite($file, "User Agent: " . $user_agent . "\n\n");
fwrite($file, " ############################ " );
fclose($file);
//echo_me
echo "Data written successfully to file.";
?>
//by Ahmad Allam
//my telegram @echo_me