function getXMLHttpRequest() {
  var client;
  client = getXMLHttpRequestFromIE();
  if (client == null) {
    client = new XMLHttpRequest();
  }
  return client;
}

function getXMLHttpRequestFromIE() {
  var nameprefixes = ["Msxml3","Msxml2","Msxml","Microsoft"];
  for (var i=0;i<nameprefixes.length;i++){
    var name = nameprefixes[i]+".XMLHTTP";
    try {
      return new ActiveXObject(name);
    }catch(e){
    }
  }
  return null;
}