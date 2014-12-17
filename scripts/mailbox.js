var xmlHttp = createXmlHttpRequestObject();

function createXmlHttpRequestObject()
{
var xmlHttp;

try 
{
  xmlHttp = new XMLHttpRequest();
}

catch (e)
{
  var XmlHttpVersions = new Array ("MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.5.0","MSXML2.XMLHTTP.4.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP");
  for (var i=0; i<XmlHttpVersions.length && !xmlHttp; i++)
  {
    try
    {
      xmlHttp = new ActiveXObject(XmlHttpVersions[i]);
    }
    catch (e) {}
  }
}

if (!xmlHttp) alert ("Ошибка создания объекта XMLHttpRequest.");
else return xmlHttp;
}


function process()
{

if (xmlHttp)
{
  try
  {
    var mailbox_name = document.getElementById("username").value;
	var oldname = document.getElementById("username_double").innerHTML;
	
	params = "username=" + mailbox_name + "&oldname=" + oldname;
    xmlHttp.open("POST", "/mailbox_check/", true);
	//xmlHttp.overrideMimeType('text/xml');
    xmlHttp.onreadystatechange = handleRequestStateChange;
    xmlHttp.setRequestHeader ("Content-Type", "application/x-www-form-urlencoded");
    xmlHttp.send(params);
  }

  catch (e)
  {
    alert ("Невозможно соединиться с сервером:\n" + e.toString());
  }
}
}


function handleRequestStateChange()
{
if(xmlHttp.readyState == 4)
{
  if (xmlHttp.status == 200)
  {
    try
    {
      handleServerResponse();
    }
    catch (e)
    {
      alert ("Ошибка чтения ответа: " + e.toString());
    }
  }
  else
  {
    alert ("Возникли проблемы во время получения данных: \n" + xmlHttp.statusText);
  }
}
}

function handleServerResponse()
{
    if (xmlHttp.readyState == 4)
    {
        if (xmlHttp.status == 200)
        {
			textResponse = xmlHttp.responseText;

			document.getElementById('exists').innerHTML = '';
			document.getElementById('exists_short').innerHTML = '';

			if (textResponse == "1") {
				document.getElementById('exists').innerHTML = '<img src="/themes/images/delete.png"><small><font color="red">имя занято</font></small>';
				document.getElementById('exists_short').innerHTML = 'occ';
			}
			else {
				document.getElementById('exists').innerHTML = '<img src="/themes/images/ok.png"><small><font color="green">имя свободно</font></small>';
				document.getElementById('exists_short').innerHTML = 'free';
			}
        }
        else
        {
            alert ('Проблемы при обращении к серверу: ' + xmlHttp.statusText);
        }
    }
}