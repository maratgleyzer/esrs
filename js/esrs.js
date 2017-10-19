
function $()
{
	var elements = new Array();
	for (var i = 0; i < arguments.length; i++)
	{
		var element = arguments[i];
		if (typeof element == 'string')
			element = document.getElementById(element);
		if (arguments.length == 1)
			return element;
		elements.push(element);
	}
	return elements;
}


function getHTTPReq(url, query, destinationid)
{
	url = url+'?'+query;
	if (window.XMLHttpRequest) { xmlhttp=new XMLHttpRequest(); }
	else if (window.ActiveXObject) { xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); }
	if (xmlhttp)
	{
		xmlhttp.open("GET",url,true);
		xmlhttp.onreadystatechange = function()
		{ 
			if (xmlhttp.readyState==4)
			{
				if (xmlhttp.status==200) { $(destinationid).innerHTML = xmlhttp.responseText; }
				else { $(destinationid).innerHTML = 'Fail'; }
			}
		}
		if (window.XMLHttpRequest) {
			xmlhttp.setRequestHeader("If-Modified-Since", new Date(0));
			xmlhttp.send(null);
		}
		else if (window.ActiveXObject) {
			xmlhttp.setRequestHeader("If-Modified-Since", new Date(0));
			xmlhttp.send();
		}
	}
}


function postHTTPReq(url,query,destinationid)
{
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
		if (xmlhttp.overrideMimeType) { xmlhttp.overrideMimeType('text/html'); }
	}
	else if (window.ActiveXObject)
	{
		try
		{
			xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                } 
                catch (e)
		{
			try { xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); } 
			catch (e) {}
		}
	}
	if (xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if (xmlhttp.readyState==4)
			{
				if (xmlhttp.status==200) { $(destinationid).innerHTML = xmlhttp.responseText; }
				else { $(destinationid).innerHTML = 'Fail'; }
			}
		}
		xmlhttp.open("POST",url,true)
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.setRequestHeader("Content-length", query.length);
		xmlhttp.setRequestHeader("Connection", "close");
		xmlhttp.send(query);
	}
}


function esrs_ajax(f,q,e)
{

	if ($(e).innerHTML == "")
	{
		getHTTPReq(f, encodeURI(q), e);
	}
	else
	{
		$(e).innerHTML = "";
	}

}


function esrs_pop_600( f,n )
{

	var popup = window.open( f,n,"toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=0,channelmode=0,directories=0,left=100,top=100,scrennX=200,screenY=200,width=600,height=200" );
	popup.focus();
	return true;

}

function esrs_pop_800( f,n )
{

	var popup = window.open( f,n,"toolbar=0,location=0,status=0,menubar=0,scrollbars=1,resizable=0,channelmode=0,directories=0,left=100,top=100,scrennX=200,screenY=200,width=800,height=200" );
	popup.focus();
	return true;

}


function esrs_set( f,e,v )
{

	document.cookie = e+"="+v+";";
	document.forms[f].submit();
	return true;

}


function esrs_clear_cooks()
{

	var a_all_cookies = document.cookie.split( ';' );
	var a_temp_cookie = '';	var cookie_name = '';
	var word_array = ['sortorder','disable','enable','default','edit','jump_menu','rsvp'];

	for ( i = 0; i < a_all_cookies.length; i++ )
	{
	//now we'll split apart each name=value pair
		a_temp_cookie = a_all_cookies[i].split( '=' );
	//and trim left/right whitespace while we're at it
		cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
	//if the extracted name matches passed check_name
		for ( j = 0; j < word_array.length; j++ )
		{
			if ( cookie_name.indexOf(word_array[j]) )
				document.cookie = cookie_name+
			    "=0;expires=Thu, 01-Jan-1970 00:00:01 GMT;";
		}
	}
	return true;

}


function esrs_display_per_page(f, v)
{
	for (i = 0; i < f.length; ++i)
	{
		if (f.elements[i].name == 'esrs_select_limit')
		{
			f.elements[i].value = v;}}
			f.esrs_page_limit.value = v;
			f.submit();
		}
	}
}


function esrs_go_to_page(f, v)
{
	for (i = 0; i < f.length; ++i) 
	{
		if (f.elements[i].name == 'esrs_select_start')
		{
			f.elements[i].value = v;}}
			f.esrs_page_start.value = v;
			f.submit();
		}
	}
}

esrs_clear_cooks();