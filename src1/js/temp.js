function send(theUrl){
  var xmlHttp = new XMLHttpRequest();
  xmlHttp.open( "GET", theUrl, false );
  xmlHttp.send( null );
  return xmlHttp.responseText;
}
var dname = WURFL.complete_device_name;
sent = send("get_data.php?dname="+dname);

//by Ahmad Allam