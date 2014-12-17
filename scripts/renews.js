var xmlHttp = createXmlHttpRequestObject();
var renewing_div = 0;

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


function process(skip, cat_id, folder_id, display_limit)
{

if (xmlHttp)
{
  try
  {	
	params = "skip=" + skip + "&news_cat_id=" + cat_id + "&news_folder_id=" + folder_id + "&display_limit=" + display_limit;
	
	renewing_div = "newscat" + cat_id;
    xmlHttp.open("POST", "/renews/", true);
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
			
			//Учим Firefox понимать OuterHTML (хоть чего-то он не умеет!)
			if (typeof(HTMLElement) != "undefined") {
				var _emptyTags = {
				   "IMG": true,
				   "BR": true,
				   "INPUT": true,
				   "META": true,
				   "LINK": true,
				   "PARAM": true,
				   "HR": true
				};
				
				HTMLElement.prototype.__defineGetter__("outerHTML", function () {
				   var attrs = this.attributes;
				   var str = "<" + this.tagName;
				   for (var i = 0; i < attrs.length; i++)
					  str += " " + attrs[ i ].name + "=\"" + attrs[ i ].value + "\"";
				
				   if (_emptyTags[this.tagName])
					  return str + ">";
				
				   return str + ">" + this.innerHTML + "</" + this.tagName + ">";
				});
				
				HTMLElement.prototype.__defineSetter__("outerHTML", function (sHTML) {
				   var r = this.ownerDocument.createRange();
				   r.setStartBefore(this);
				   var df = r.createContextualFragment(sHTML);
				   this.parentNode.replaceChild(df, this);
				});
			}
			
			
			document.getElementById(renewing_div).outerHTML = textResponse;
        }
        else
        {
            alert ('Проблемы при обращении к серверу: ' + xmlHttp.statusText);
        }
    }
}