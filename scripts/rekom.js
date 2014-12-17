var xmlHttp = createXmlHttpRequestObject();
var ege_bac_on = 0;
var ege_spec_on = 0;
var ege_mag_on = 0;
var ege_sec_on = 0;

function show_choice(obj, choice, sec)
			{			
				switch (choice) {
					case 'show_form_ed':
						document.getElementById('f_education').style.display = 'block';
						document.getElementById('link12').style.borderBottomStyle = 'none';
						
						
						
					break;
				case 'show_form_ed_zoch':
					document.getElementById('form_ed_zoch').style.display = 'block';
					document.getElementById('form_ed_och').style.display = 'none';
					document.getElementById('link14').style.borderBottomStyle = 'none';
					document.getElementById('link13').style.borderBottomStyle = 'dashed';
					document.getElementById('link14').style.fontWeight = 'bold';
					document.getElementById('link13').style.fontWeight = 'normal';
						
					
					
						
						break;
				case 'show_form_ed_och':
						document.getElementById('form_ed_och').style.display = 'block';
						document.getElementById('form_ed_zoch').style.display = 'none';
						document.getElementById('link13').style.borderBottomStyle = 'none';
						document.getElementById('link14').style.borderBottomStyle = 'dashed';
						document.getElementById('link13').style.fontWeight = 'bold';
						document.getElementById('link14').style.fontWeight = 'normal';
						
						
						
						
					break;
					case 'show_cont_sec':
						document.getElementById('cont_sec').style.display = 'block';
						document.getElementById('magistr').style.display = 'none';
						document.getElementById('pre_level').style.display = 'none';
						document.getElementById('pre_level_second').style.display = 'none';
						document.getElementById('ege_int').style.display = 'none';
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'none';
						document.getElementById('rekom').style.display = 'none';
						document.getElementById('flagdiv').innerText = '';
						
						document.getElementById('link1').style.borderBottomStyle = 'dashed';
						document.getElementById('link2').style.borderBottomStyle = 'dashed';
						document.getElementById('link3').style.borderBottomStyle = 'dashed';
						document.getElementById('link4').style.borderBottomStyle = 'dashed';
						document.getElementById('link5').style.borderBottomStyle = 'dashed';
						document.getElementById('link6').style.borderBottomStyle = 'dashed';
						document.getElementById('link7').style.borderBottomStyle = 'dashed';
						document.getElementById('link8').style.borderBottomStyle = 'dashed';
						document.getElementById('link9').style.borderBottomStyle = 'dashed';
						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
					break;
					case 'show_magistr':
						ege_mag_on = 1;
						document.getElementById('cont_sec').style.display = 'block';
						document.getElementById('magistr').style.display = 'block';
						document.getElementById('pre_level').style.display = 'none';
						document.getElementById('pre_level_second').style.display = 'none';
						document.getElementById('ege_int').style.display = 'none';
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'none';
						document.getElementById('rekom').style.display = 'none';
						
						document.getElementById('link4').style.borderBottomStyle = 'dashed';
						document.getElementById('link5').style.borderBottomStyle = 'dashed';
						document.getElementById('link6').style.borderBottomStyle = 'dashed';
						document.getElementById('link7').style.borderBottomStyle = 'dashed';
						document.getElementById('link8').style.borderBottomStyle = 'dashed';
						document.getElementById('link9').style.borderBottomStyle = 'dashed';
						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
					break;
					case 'show_pre_level':
						document.getElementById('cont_sec').style.display = 'none';
						document.getElementById('magistr').style.display = 'none';
						document.getElementById('pre_level').style.display = 'block';
						document.getElementById('pre_level_second').style.display = 'none';
						document.getElementById('ege_int').style.display = 'none';
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'none';
						document.getElementById('rekom').style.display = 'none';
						document.getElementById('flagdiv').innerText = '';

						document.getElementById('link1').style.borderBottomStyle = 'dashed';
						document.getElementById('link2').style.borderBottomStyle = 'dashed';
						document.getElementById('link3').style.borderBottomStyle = 'dashed';
						document.getElementById('link4').style.borderBottomStyle = 'dashed';
						document.getElementById('link5').style.borderBottomStyle = 'dashed';
						document.getElementById('link6').style.borderBottomStyle = 'dashed';
						document.getElementById('link7').style.borderBottomStyle = 'dashed';
						document.getElementById('link8').style.borderBottomStyle = 'dashed';
						document.getElementById('link9').style.borderBottomStyle = 'dashed';
						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
					break;
					case 'show_pre_level_second':
						ege_sec_on = 1;
						document.getElementById('cont_sec').style.display = 'block';
						document.getElementById('magistr').style.display = 'none';
						document.getElementById('pre_level').style.display = 'none';
						document.getElementById('ege_int').style.display = 'none';
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'none';
						document.getElementById('rekom').style.display = 'none';
						document.getElementById('pre_level_second').style.display = 'block';
						
						document.getElementById('link4').style.borderBottomStyle = 'dashed';
						document.getElementById('link5').style.borderBottomStyle = 'dashed';
						document.getElementById('link6').style.borderBottomStyle = 'dashed';
						document.getElementById('link7').style.borderBottomStyle = 'dashed';
						document.getElementById('link8').style.borderBottomStyle = 'dashed';
						document.getElementById('link9').style.borderBottomStyle = 'dashed';
						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
					break;
					case 'show_ege_int':
						if (obj.id == "link4")
							ege_bac_on = 1;
						else if (obj.id == "link5")
							ege_spec_on = 1;
						document.getElementById('cont_sec').style.display = 'none';
						document.getElementById('magistr').style.display = 'none';
						if (!sec) {
							document.getElementById('pre_level').style.display = 'block';
							document.getElementById('pre_level_second').style.display = 'none';
							document.getElementById('flagdiv').innerText = '';
							
							document.getElementById('link4').style.borderBottomStyle = 'dashed';
							document.getElementById('link5').style.borderBottomStyle = 'dashed';
							document.getElementById('link6').style.borderBottomStyle = 'dashed';
							document.getElementById('link7').style.borderBottomStyle = 'dashed';
							document.getElementById('link8').style.borderBottomStyle = 'dashed';
							document.getElementById('link9').style.borderBottomStyle = 'dashed';
							document.getElementById('link10').style.borderBottomStyle = 'dashed';
							document.getElementById('link11').style.borderBottomStyle = 'dashed';
							}
						else {
							document.getElementById('cont_sec').style.display = 'block';
							document.getElementById('pre_level').style.display = 'none';
							document.getElementById('flagdiv').innerText = ' ';

							document.getElementById('link4').style.borderBottomStyle = 'dashed';
							document.getElementById('link5').style.borderBottomStyle = 'dashed';
							document.getElementById('link8').style.borderBottomStyle = 'dashed';
							document.getElementById('link9').style.borderBottomStyle = 'dashed';
							document.getElementById('link10').style.borderBottomStyle = 'dashed';
							document.getElementById('link11').style.borderBottomStyle = 'dashed';
						}
						document.getElementById('ege_int').style.display = 'block';
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'none';
						document.getElementById('rekom').style.display = 'none';
					break;
					case 'show_ege':
						document.getElementById('ege').style.display = 'block';
						document.getElementById('interests').style.display = 'none';

						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
						//document.getElementById('rekom').innerHTML = '';
						
						elem = document.getElementById('rekom');
						elem.style.display = 'block';
						childs = elem.getElementsByTagName('div');
						for (var child in childs)
							if (child.length == 1)
								childs[child].style.display = 'none';
							
					break;
					case 'show_interests':
						document.getElementById('ege').style.display = 'none';
						document.getElementById('interests').style.display = 'block';
						
						document.getElementById('link10').style.borderBottomStyle = 'dashed';
						document.getElementById('link11').style.borderBottomStyle = 'dashed';
						document.getElementById('divrekoms').innerHTML = '';
					break;
				
					default:
						elem = document.getElementById('rekom');
						elem.style.display = 'block';
						childs = elem.getElementsByTagName('div');
						for (var child in childs)
							if (child.length == 1)
								childs[child].style.display = 'none';
						
						document.getElementById(choice).style.display = 'block';
						
						schs = document.getElementsByClassName('dash sch');
						
						for (var sch in schs)
							if (sch.length == 1)
								schs[sch].style.borderBottomStyle = 'dashed';
					break;
				}
				
				obj.style.borderBottomStyle = 'solid';
			}

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

if (!document.getElementById('ege_rus').value)
{
	alert ("Не указаны баллы по русскому языку");
	document.getElementById('ege_rus').focus();
	return false;
}

if (!document.getElementById('ege_math').value)
{
	alert ("Не указаны баллы по математике");
	document.getElementById('ege_math').focus();
	return false;
}

if (xmlHttp)
{
  try
  {
    var ege_rus_on = document.getElementById("ege_rus_on").checked;
    var ege_math_on = document.getElementById("ege_math_on").checked;
	var ege_inf_on = document.getElementById("ege_inf_on").checked;
	var ege_hist_on = document.getElementById("ege_hist_on").checked;
	var ege_phys_on = document.getElementById("ege_phys_on").checked;
	var ege_biol_on = document.getElementById("ege_biol_on").checked;
	//var ege_chem_on = document.getElementById("ege_chem_on").checked;
	//var ege_geo_on = document.getElementById("ege_geo_on").checked;
	var ege_lang_on = document.getElementById("ege_lang_on").checked;
	var ege_soc_on = document.getElementById("ege_soc_on").checked;
	
	var ege_rus = document.getElementById("ege_rus").value;
    var ege_math = document.getElementById("ege_math").value;
	var ege_inf = document.getElementById("ege_inf").value;
	var ege_hist = document.getElementById("ege_hist").value;
	var ege_phys = document.getElementById("ege_phys").value;
	var ege_biol = document.getElementById("ege_biol").value;
	//var ege_chem = document.getElementById("ege_chem").value;
	//var ege_geo = document.getElementById("ege_geo").value;
	var ege_lang = document.getElementById("ege_lang").value;
	var ege_soc = document.getElementById("ege_soc").value;
	
	params = "ege_bac_on=" + ege_bac_on + "&ege_spec_on=" + ege_spec_on + "&ege_rus_on=" + ege_rus_on + "&ege_math_on=" + ege_math_on + "&ege_inf_on=" + ege_inf_on + "&ege_hist_on=" + ege_hist_on + "&ege_phys_on=" + ege_phys_on + "&ege_biol_on=" + ege_biol_on + "&ege_lang_on=" + ege_lang_on + "&ege_soc_on=" + ege_soc_on + "&ege_rus=" + ege_rus + "&ege_math=" + ege_math + "&ege_inf=" + ege_inf + "&ege_hist=" + ege_hist + "&ege_phys=" + ege_phys + "&ege_biol=" + ege_biol + "&ege_lang=" + ege_lang + "&ege_soc=" + ege_soc; //"&ege_chem_on=" + ege_chem_on + "&ege_geo_on=" + ege_geo_on +  + "&ege_chem=" + ege_chem + "&ege_geo=" + ege_geo 

    xmlHttp.open("POST", "/rekom/", true);
	xmlHttp.overrideMimeType('text/xml');
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

function htmlspecialchars(string) {
    string = string.toString();
    string = string.replace(/&lt;/g, '<');
	string = string.replace(/&gt;/g, '>');  
    return string;
}

function handleServerResponse()
{
    if (xmlHttp.readyState == 4)
    {
        if (xmlHttp.status == 200)
        {
            //xmlResponse = xmlHttp.responseXML;
			textResponse = xmlHttp.responseText;
            //var rekoms = xmlResponse.getElementsByTagName('rekom');
			document.getElementById('divrekoms').innerHTML = '';
			//alert ((textResponse.replace(/&lt;/g, '<')).replace(/&gt;/g, '>'));
			if (textResponse.length) {
				document.getElementById('divrekoms').innerHTML = '<h3>Рекомендуем специальности:</h3><ul>';
				document.getElementById('divrekoms').innerHTML += (((textResponse.replace(/&lt;/g, '<')).replace(/&gt;/g, '>')).replace(/a>/g, 'a></li>')).replace(/<a/g, '<li><a');
				//document.getElementById('divrekoms').innerHTML += '</ul>';
			}
			/*if (rekoms.length) {
				document.getElementById('divrekoms').innerHTML = '<h3>Рекомендуем специальности:</h3>';
				for (n=0; n<rekoms.length; n++)
					document.getElementById('divrekoms').innerHTML += rekoms[n].firstChild.nodeValue + '<br />';
			}*/
			else
				document.getElementById('divrekoms').innerHTML = '<br />К сожалению, указанные Вами баллы не соответствуют условиям приёма на какую-либо специальность.';
        }
        else
        {
            alert ('Проблемы при обращении к серверу: ' + xmlHttp.statusText);
        }
    }
}