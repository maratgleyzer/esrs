
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
  
  <META NAME="ROBOTS" CONTENT="NOHTMLINDEX"/>
  <head>
  
   <script src="/Style Library/ufo.js" type="text/javascript" /></script> 
   <script type="text/javascript" src="/Student%20Life/Career%20Center/Documents/ufo.js"></script>
   <script type="text/javascript" src="/Academics/Colleges/Business_Unpublished/Documents/bs.js"></script>
   <script type="text/javascript" src="../../scripts/contin.js"></script>
      <script type="text/javascript" src="../../scripts/sifr.js"></script>

                   <script type="text/javascript">

		
		//console.log(para);
		
		
/* "begin" is a wrapper for all functions that drive this program*/
function begin () {

		var contin;	
		contin = prepare();
		
		if (!contin) ;
		else { 
		
		      IEmenuFix();
		      
		       
		     
		      
		      var fire = parseURL ();
		       
		      if (!fire);
		      else {
		 
		             go ();
		            
		             cssAddLink ("/Academics/Colleges/Business/Documents/local.css");
		     
		           }// end else
		           
		           
		           
		           var fire2 = parseURL2 ();
		           
		           if (!fire2);
		      else {
		
		            		             cssAddLink ("/Academics/Colleges/ArchitecturePlanning/Documents/cap_screen.css");
		      
		           }// end else
		           
		           
		       var fire3 = parseURL3 ();
		           
		           if (!fire3);
		      else {
		                         
		            		     begin2();    
		      
		           }// end else



getElementsByClassName("AspNet-Menu-Vertical");
var kw = results[0];


if (kw) {

getElementsByClassName2("AspNet-Menu", kw);
var lw = results[0];



getElementsByClassName2("AspNet-Menu-WithChildren", kw);
if (!results[0]) {

var nw = lw.getElementsByTagName("li");

for (count = 0; count < nw.length; count++) {

nw[count].style.display = "block";
} //end for


                 }//end if

}

		      }// end else
		          }// end begin
			
			

/* 
This function tests to see whther the browser supports advanced DOM functionality
*/				  
function prepare () {
			//DOM check
			var advancedJSSupport;
			if (!document.getElementsByTagName) return false;
			if (!document.getElementById) return false;
			//check for any neccessary elements
			else {
			return true;
			     } //end else
					}	//end prepare
					

/* This function drives the drop-down menues
   by adding a class name to elements when the are moused over.
   This class is rferenced in the CSS making menues move on screen by adjusting the margins 
 */			
function IEmenuFix() {

	getElementsByClassName("AspNet-Menu");
	var fh = results[0];
	
	var sfEls = fh.getElementsByTagName("li");
		for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" sfhover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" sfhover\\b"), " ");
		}
	}

}

								
function getElementsByClassName(className) { 
results = []; 
walkTheDOM(document.body, mw, className); 
 
                                           } 
                                           
function getElementsByClassName2(className, element) { 

results = []; 
walkTheDOM2(element, mw, className); 
 
                                           } //getElementsByClassName				  


//be careful with this function, esp in ff. All noded will be returned, including white space				  
function walkTheDOM(node, func, className) {

   func(node, className); 
   node = node.firstChild; 
     while (node) { 
     walkTheDOM(node, func, className); 
      node = node.nextSibling; 
                  } 
                                            } 
                                            
function walkTheDOM2(node, func, className) {




   func(node, className); 
   node = node.firstChild; 
     while (node) { 
     walkTheDOM2(node, func, className); 
      node = node.nextSibling; 
                  } 
                                            } 

								
								
function mw (node, className) { 
  var a, c = node.className, i; 
        
            if (c) { 
                   a = c.split(' '); 
                   for (i = 0; i < a.length; i += 1) { 
                                                        if (a[i] === className) {results.push(node); 
                                                                                 break; 
                                                                                 } //end if (a[i]
                                                     } //end for
                   } //end if (c)
                   }//end mw
	
		//javascript fires after the DOM has loaded		
		
function parseURL () {

  var regexS = "/Academics/Colleges/Business/";
  regexS = regexS.toLowerCase();
  var regex = new RegExp( regexS );
  var tmpURL = window.location.href;
  tmpURL = tmpURL.toLowerCase();

  var results = regex.exec( tmpURL );
  
  if ( results == null )
    return false;
  else if ( typeof(results[0]) == "string" )
    return true;
  else 
    return false;
                       } //end parseURL
                       
                       		
function parseURL2 () {
  var regexS = "/Academics/Colleges/ArchitecturePlanning/Pages/home.aspx";
  regexS = regexS.toLowerCase();
  var regex = new RegExp( regexS );
  var tmpURL = window.location.href;
  tmpURL = tmpURL.toLowerCase();
  var results = regex.exec( tmpURL );
  
  if ( results == null )
    return false;
  else if ( typeof(results[0]) == "string" )
    return true;
  else 
    return false;
                       } //end parseURL
                       
                       function parseURL3 () {


  var regexS = "/Student%20Life/Career%20Center/";
  regexS = regexS.toLowerCase();
  var regex = new RegExp( regexS );
  var tmpURL = window.location.href;
  tmpURL = tmpURL.toLowerCase();
  var results = regex.exec( tmpURL );
  
  if ( results == null )
    return false;
  else if ( typeof(results[0]) == "string" )
    return true;
  else 
    return false;
                       } //end parseURL





//builds at run-time and inserts it
function cssAddLink (file) {

	
		fileref=document.createElement("link");
		fileref.setAttribute("rel", "stylesheet");
		fileref.setAttribute("type", "text/css");
		fileref.setAttribute("href", file);

	document.getElementsByTagName("head").item(0).appendChild(fileref);
}


function AddOnload(myfunc)
{
if(window.addEventListener)
window.addEventListener('load', myfunc, false);
else if(window.attachEvent)
window.attachEvent('onload', myfunc);
}
 
 
AddOnload(begin);


		
		 
		</script>  
  

 
  
  	<style type="text/css">
#search table {
width:200px;
}

#ctl00_ctl08_S2C1F2767_AdvSearchLink {
display:none;
}

.ms-sbscopes {
margin-right:5px;
}

  	
#contentwrapper {
	clear:both;
}
	/**/

	</style>
	
	<style type="text/css">
	/**/
#ft {font-size:77%;font-family:verdana;clear:both;margin-top:1em;background-color:#fff;border-top:3px solid black;padding-top:1em;}

/**/

#ft ul li{
float:left; display:inline;
position:relative;
padding:0;
margin:0;
}

#ft ul {
padding:0;
margin:0 0 0 45px;
}



#ft ul li a{
border-right:solid 1px #BFC0C1;
padding: 0px 10px 0 10px;
font-weight:bold;
margin:0;
}

#ft p{clear:both;padding:5px 15px 15px 0;margin:0 0 0 53px;} 


#outer_search  {
width:385px;
margin-right:15px;
height:37px;
background: #E6E7E8 url("/images/corner_right.png") no-repeat 100% 10px;/*border:thin green solid;*/
}

#search {
width:385px;
background : url("/images/cornerLsearch.png") no-repeat 0 10px;
/*margin:0 15px 0 0;*/
margin:0;
/*padding:0 0 0 15px;*/
padding:0;
height:37px;
/*border:thin red solid;*/
}

form#search_box {
margin:0;
padding:0;
width:auto;
margin-top:8px;
margin-left:6px;
}

input#search_textBox {
width:80px;
margin:0;
padding:0;
float:left;
}


#search p { 
margin: 10px 5px 5px 5px; 
padding:0; 
float:left;
font-weight:bold;
font-size:90%;
}

/******* STyles for side navigation ****/






#zz8_SiteActionsMenu {
	color:white !important;
}

  #ctl00_PlaceHolderMain_ctl00_TextBox1 {
  float:left;
  display:inline;
   }
   
   #psearch {
display:inline;

}

   #psearch input{
display:inline;
margin-top:10px;
}

#ctl00_ctl07_txtSearch {
display:inline;	
float:left;
}

#zz4_SiteActionsMenu {
	color:white;
}

#ctl00_explitLogout_ExplicitLogin {
font-size:80%;
*font-size:107%;
font-family:verdana,arial,helvetica,clean,sans-serif;
color:blue;
text-decoration:underline;
font-weight:bold;
}

.AspNet-Menu-Vertical .AspNet-Menu li{
display:none;	
}

.AspNet-Menu-Vertical, 
.AspNet-Menu-Vertical a:link,
.AspNet-Menu-Vertical a:visited 
 {
font-size : 80%;margin-bottom : 1em;color : #000000;font-weight:normal; margin:0; padding:0;

} 


	</style>
		
  

    
			<title>
	default
</title>
    <link rel="stylesheet" type="text/css" href="/_layouts/1033/styles/HtmlEditorCustomStyles.css?rev=8SKxtNx33FmoDhbbfB27UA%3D%3D"/>
<link rel="stylesheet" type="text/css" href="/_layouts/1033/styles/HtmlEditorTableFormats.css?rev=guYGdUBUxQit03E2jhSdvA%3D%3D"/>
<link rel="stylesheet" type="text/css" href="/_layouts/1033/styles/core.css?rev=5msmprmeONfN6lJ3wtbAlA%3D%3D"/>
<link rel="stylesheet" type="text/css" href="/Style%20Library/CMS01.css"/>




<!--<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">

</script>

<script type="text/javascript">

_uacct = "UA-584370-4";

urchinTracker();

</script>-->

    
    
    
    
    <script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-4027023-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>

    
    
    
  <title>

</title><style type="text/css">
	.zz1_GlobalNav_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.zz1_GlobalNav_1 { text-decoration:none; }
	.zz1_GlobalNav_2 {  }
	.zz1_GlobalNav_3 { border-style:none; }
	.zz1_GlobalNav_4 {  }
	.zz1_GlobalNav_5 { border-style:none; }
	.zz1_GlobalNav_6 {  }
	.zz1_GlobalNav_7 {  }
	.zz1_GlobalNav_8 { border-style:none; }
	.zz1_GlobalNav_9 {  }
	.zz1_GlobalNav_10 { border-style:none; }
	.zz1_GlobalNav_11 {  }
	.zz1_GlobalNav_12 { border-style:none; }
	.zz1_GlobalNav_13 {  }
	.zz2_CurrentNav_0 { background-color:white;visibility:hidden;display:none;position:absolute;left:0px;top:0px; }
	.zz2_CurrentNav_1 { text-decoration:none; }
	.zz2_CurrentNav_2 {  }
	.zz2_CurrentNav_3 { border-style:none; }
	.zz2_CurrentNav_4 {  }
	.zz2_CurrentNav_5 {  }
	.zz2_CurrentNav_6 { border-style:none; }
	.zz2_CurrentNav_7 {  }
	.zz2_CurrentNav_8 { border-style:none; }
	.zz2_CurrentNav_9 {  }
	.zz2_CurrentNav_10 { border-style:none; }
	.zz2_CurrentNav_11 {  }
	.zz2_CurrentNav_12 { border-style:none; }
	.zz2_CurrentNav_13 {  }
	.zz2_CurrentNav_14 { border-style:none; }
	.zz2_CurrentNav_15 {  }
	.zz2_CurrentNav_16 { border-style:none; }
	.zz2_CurrentNav_17 {  }

</style></head>
 
  <body class="body" onload="javascript:_spBodyOnLoadWrapper();">

    <form name="aspnetForm" method="post" action="default.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="aspnetForm">
<div>
<input type="hidden" name="__SPSCEditMenu" id="__SPSCEditMenu" value="true" />
<input type="hidden" name="MSOWebPartPage_PostbackSource" id="MSOWebPartPage_PostbackSource" value="" />
<input type="hidden" name="MSOTlPn_SelectedWpId" id="MSOTlPn_SelectedWpId" value="" />
<input type="hidden" name="MSOTlPn_View" id="MSOTlPn_View" value="0" />
<input type="hidden" name="MSOTlPn_ShowSettings" id="MSOTlPn_ShowSettings" value="False" />
<input type="hidden" name="MSOGallery_SelectedLibrary" id="MSOGallery_SelectedLibrary" value="" />
<input type="hidden" name="MSOGallery_FilterString" id="MSOGallery_FilterString" value="" />
<input type="hidden" name="MSOTlPn_Button" id="MSOTlPn_Button" value="none" />
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__REQUESTDIGEST" id="__REQUESTDIGEST" value="0x3D564E14177F94806910094A7DCB5227F499ACAC8A17C29BA4277567C9443DC85F869C82B18EF90E10EC77C6F959CD120A4D07DAB394CD415F43D4853FC1C35F,04 Jan 2009 04:11:08 -0000" />
<input type="hidden" name="MSOAuthoringConsole_FormContext" id="MSOAuthoringConsole_FormContext" value="" />
<input type="hidden" name="MSOAC_EditDuringWorkflow" id="MSOAC_EditDuringWorkflow" value="" />
<input type="hidden" name="MSOSPWebPartManager_DisplayModeName" id="MSOSPWebPartManager_DisplayModeName" value="Browse" />
<input type="hidden" name="MSOWebPartPage_Shared" id="MSOWebPartPage_Shared" value="" />
<input type="hidden" name="MSOLayout_LayoutChanges" id="MSOLayout_LayoutChanges" value="" />
<input type="hidden" name="MSOLayout_InDesignMode" id="MSOLayout_InDesignMode" value="" />
<input type="hidden" name="MSOSPWebPartManager_OldDisplayModeName" id="MSOSPWebPartManager_OldDisplayModeName" value="Browse" />
<input type="hidden" name="MSOSPWebPartManager_StartWebPartEditingName" id="MSOSPWebPartManager_StartWebPartEditingName" value="false" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUBMA9kFgJmD2QWBAIGD2QWAgICD2QWAgIBD2QWAgIBDxYCHhNQcmV2aW91c0NvbnRyb2xNb2RlCymIAU1pY3Jvc29mdC5TaGFyZVBvaW50LldlYkNvbnRyb2xzLlNQQ29udHJvbE1vZGUsIE1pY3Jvc29mdC5TaGFyZVBvaW50LCBWZXJzaW9uPTEyLjAuMC4wLCBDdWx0dXJlPW5ldXRyYWwsIFB1YmxpY0tleVRva2VuPTcxZTliY2UxMTFlOTQyOWMBZAIID2QWDAIBD2QWAgIBDxYCHgdWaXNpYmxlaBYCZg9kFgQCAg9kFgYCAQ8WAh8BaGQCAw8WAh8BaGQCBQ8WAh8BaGQCAw8PFgIeCUFjY2Vzc0tleQUBL2RkAgMPZBYCAgEPDxYCHwFoZBYEAgEPDxYCHwFoZGQCAw8PFgIfAWhkFgICAQ8PFgIfAWdkFgQCAQ8PFgIfAWhkFhwCAQ8PFgIfAWhkZAIDDxYCHwFoZAIFDw8WAh8BaGRkAgcPFgIfAWhkAgkPDxYCHwFoZGQCCw8PFgIfAWhkZAINDw8WAh8BaGRkAg8PDxYEHgdFbmFibGVkaB8BaGRkAhEPDxYCHwFoZGQCEw8PFgQfA2gfAWhkZAIVDw8WAh8BaGRkAhcPFgIfAWhkAhkPFgIfAWhkAhsPDxYCHwFnZGQCAw8PFgIfAWdkFgYCAQ8PFgIfAWdkZAIDDw8WAh8BZ2RkAgUPDxYCHwFnZGQCBQ9kFgJmD2QWAgIBDw9kFgIeBWNsYXNzBRhtcy1zYnRhYmxlIG1zLXNidGFibGUtZXhkAgcQPCsADQIADxYCHgtfIURhdGFCb3VuZGdkDBQrAAkFHzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcUKwACFhAeBFRleHQFCUFjYWRlbWljcx4FVmFsdWUFCUFjYWRlbWljcx4LTmF2aWdhdGVVcmwFHS9BY2FkZW1pY3MvUGFnZXMvZGVmYXVsdC5hc3B4HgdUb29sVGlwBRNBY2FkZW1pY3MgaG9tZSBwYWdlHwNnHgpTZWxlY3RhYmxlZx4IRGF0YVBhdGgFCi9BY2FkZW1pY3MeCURhdGFCb3VuZGcUKwAMBSwwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3LDA6OCwwOjksMDoxMBQrAAIWEB8GBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8HBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8IBTIvQWNhZGVtaWNzL1Byb2dyYW1zIGFuZCBEZWdyZWVzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8DZx8KZx8LBR8vQWNhZGVtaWNzL1Byb2dyYW1zIGFuZCBEZWdyZWVzHwxnZBQrAAIWEB8GBRRTY2hvb2xzIGFuZCBDb2xsZWdlcx8HBRRTY2hvb2xzIGFuZCBDb2xsZWdlcx8IBSYvQWNhZGVtaWNzL0NvbGxlZ2VzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQhDb2xsZWdlcx8DZx8KZx8LBRMvQWNhZGVtaWNzL0NvbGxlZ2VzHwxnZBQrAAIWEB8GBRZDZW50ZXJzIGFuZCBJbnN0aXR1dGVzHwcFFkNlbnRlcnMgYW5kIEluc3RpdHV0ZXMfCAU0L0FjYWRlbWljcy9DZW50ZXJzIGFuZCBJbnN0aXR1dGVzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRZDZW50ZXJzIGFuZCBJbnN0aXR1dGVzHwNnHwpnHwsFIS9BY2FkZW1pY3MvQ2VudGVycyBhbmQgSW5zdGl0dXRlcx8MZ2QUKwACFhAfBgUJQ1UgT25saW5lHwcFCUNVIE9ubGluZR8IBSYvQUNBREVNSUNTL0NVT05MSU5FL1BhZ2VzL2RlZmF1bHQuYXNweB8JBShVbml2ZXJzaXR5IG9mIENvbG9yYWRvIERlbnZlciwgQ1UgT25saW5lHwNnHwpnHwsFEy9BQ0FERU1JQ1MvQ1VPTkxJTkUfDGdkFCsAAhYQHwYFGFN0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8HBRhTdHVkZW50IEFjYWRlbWljIFN1cHBvcnQfCAU2L0FjYWRlbWljcy9TdHVkZW50IEFjYWRlbWljIFN1cHBvcnQvUGFnZXMvZGVmYXVsdC5hc3B4HwkFGFN0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8DZx8KZx8LBSMvQWNhZGVtaWNzL1N0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8MZ2QUKwACFg4fBgUsT2ZmaWNlIG9mIFJlc2VhcmNoIERldmVsb3BtZW50IGFuZCBFZHVjYXRpb24fBwUsT2ZmaWNlIG9mIFJlc2VhcmNoIERldmVsb3BtZW50IGFuZCBFZHVjYXRpb24fCAUjL0FjYWRlbWljcy9SZXNlYXJjaC9QYWdlcy9ob21lLmFzcHgfA2cfCmcfCwUTL0FjYWRlbWljcy9SZXNlYXJjaB8MZ2QUKwACFhAfBgUaQ29udGludWluZy1Qcm9mLiBFZHVjYXRpb24fBwUaQ29udGludWluZy1Qcm9mLiBFZHVjYXRpb24fCAVFL0FjYWRlbWljcy9Db250aW51aW5nIGFuZCBQcm9mZXNzaW9uYWwgRWR1Y2F0aW9uL1BhZ2VzL3JlZGlyZWN0Mi5hc3B4HwkFJUNvbnRpbnVpbmcgYW5kIFByb2Zlc3Npb25hbCBFZHVjYXRpb24fA2cfCmcfCwUwL0FjYWRlbWljcy9Db250aW51aW5nIGFuZCBQcm9mZXNzaW9uYWwgRWR1Y2F0aW9uHwxnZBQrAAIWEB8GBQxDb21tZW5jZW1lbnQfBwUMQ29tbWVuY2VtZW50HwgFKi9BY2FkZW1pY3MvQ29tbWVuY2VtZW50L1BhZ2VzL2RlZmF1bHQuYXNweB8JBQxDb21tZW5jZW1lbnQfA2cfCmcfCwUXL0FjYWRlbWljcy9Db21tZW5jZW1lbnQfDGdkFCsAAhYOHwYFIUNvbnRpbnVpbmcgUHJvZmVzc2lvbmFsIEVkdWNhdGlvbh8HBSFDb250aW51aW5nIFByb2Zlc3Npb25hbCBFZHVjYXRpb24fCAUfL0FjYWRlbWljcy9DUEUvUGFnZXMvaW5kZXguYXNweB8DZx8KZx8LBQ4vQWNhZGVtaWNzL0NQRR8MZ2QUKwACFg4fBgURQ2F0YWxvZyAyMDA4LTIwMDkfBwURQ2F0YWxvZyAyMDA4LTIwMDkfCAUnL0FjYWRlbWljcy9DYXRhbG9nMjAwOS9QYWdlcy9pbmRleC5hc3B4HwNnHwpnHwsFFi9BY2FkZW1pY3MvQ2F0YWxvZzIwMDkfDGdkFCsAAhYOHwYFBHRlc3QfBwUEdGVzdB8IBSIvQWNhZGVtaWNzL3Rlc3QvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFDy9BY2FkZW1pY3MvdGVzdB8MZ2QUKwACFhAfBgUKQWRtaXNzaW9ucx8HBQpBZG1pc3Npb25zHwgFHi9BRE1JU1NJT05TL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQpBZG1pc3Npb25zHwNnHwpnHwsFCy9BRE1JU1NJT05THwxnFCsAGAVoMDowLDA6MSwwOjIsMDozLDA6NCwwOjUsMDo2LDA6NywwOjgsMDo5LDA6MTAsMDoxMSwwOjEyLDA6MTMsMDoxNCwwOjE1LDA6MTYsMDoxNywwOjE4LDA6MTksMDoyMCwwOjIxLDA6MjIUKwACFhAfBgUjV2VsY29tZSB0byBVbmRlcmdyYWR1YXRlIEFkbWlzc2lvbnMfBwUjV2VsY29tZSB0byBVbmRlcmdyYWR1YXRlIEFkbWlzc2lvbnMfCAU3L0FkbWlzc2lvbnMvVW5kZXJncmFkdWF0ZSBBZG1pc3Npb25zL1BhZ2VzL2RlZmF1bHQuYXNweB8JBSJVbmRlcmdyYWR1YXRlIEFkbWlzc2lvbnMgLSBXZWxjb21lHwNnHwpnHwsFJC9BZG1pc3Npb25zL1VuZGVyZ3JhZHVhdGUgQWRtaXNzaW9ucx8MZ2QUKwACFhAfBgUWVW5kZXJncmFkdWF0ZS1GcmVzaG1hbh8HBRZVbmRlcmdyYWR1YXRlLUZyZXNobWFuHwgFLS9BZG1pc3Npb25zL1VuZGVyZ3JhZEZyZXNoL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRZVbmRlcmdyYWR1YXRlLUZyZXNobWFuHwNnHwpnHwsFGi9BZG1pc3Npb25zL1VuZGVyZ3JhZEZyZXNoHwxnZBQrAAIWEB8GBRZVbmRlcmdyYWR1YXRlIFRyYW5zZmVyHwcFFlVuZGVyZ3JhZHVhdGUgVHJhbnNmZXIfCAUnL0FkbWlzc2lvbnMvVHJhbnNmZXIvUGFnZXMvZGVmYXVsdC5hc3B4HwkFCFRyYW5zZmVyHwNnHwpnHwsFFC9BZG1pc3Npb25zL1RyYW5zZmVyHwxnZBQrAAIWEB8GBRNHcmFkdWF0ZSBBZG1pc3Npb25zHwcFE0dyYWR1YXRlIEFkbWlzc2lvbnMfCAUyL0FkbWlzc2lvbnMvR3JhZHVhdGUgQWRtaXNzaW9ucy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUTR3JhZHVhdGUgQWRtaXNzaW9ucx8DZx8KZx8LBR8vQWRtaXNzaW9ucy9HcmFkdWF0ZSBBZG1pc3Npb25zHwxnZBQrAAIWEB8GBRZJbnRlcm5hdGlvbmFsIFN0dWRlbnRzHwcFFkludGVybmF0aW9uYWwgU3R1ZGVudHMfCAU1L0FkbWlzc2lvbnMvSW50ZXJuYXRpb25hbCBTdHVkZW50cy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUWSW50ZXJuYXRpb25hbCBTdHVkZW50cx8DZx8KZx8LBSIvQWRtaXNzaW9ucy9JbnRlcm5hdGlvbmFsIFN0dWRlbnRzHwxnZBQrAAIWEB8GBRVOb24tRGVncmVlIEFkbWlzc2lvbnMfBwUVTm9uLURlZ3JlZSBBZG1pc3Npb25zHwgFNC9BZG1pc3Npb25zL05vbi1EZWdyZWUgQWRtaXNzaW9ucy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUVTm9uLURlZ3JlZSBBZG1pc3Npb25zHwNnHwpnHwsFIS9BZG1pc3Npb25zL05vbi1EZWdyZWUgQWRtaXNzaW9ucx8MZ2QUKwACFg4fBgUPRm9ybWVyIFN0dWRlbnRzHwcFD0Zvcm1lciBTdHVkZW50cx8IBS0vQWRtaXNzaW9ucy9Gb3JtZXJTdHVkZW50cy9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUaL0FkbWlzc2lvbnMvRm9ybWVyU3R1ZGVudHMfDGdkFCsAAhYQHwYFFkZyb20gT3RoZXIgQ1UgQ2FtcHVzZXMfBwUWRnJvbSBPdGhlciBDVSBDYW1wdXNlcx8IBSgvQWRtaXNzaW9ucy9PdGhlckNhbXAvUGFnZXMvZGVmYXVsdC5hc3B4HwkFFkZyb20gT3RoZXIgQ1UgQ2FtcHVzZXMfA2cfCmcfCwUVL0FkbWlzc2lvbnMvT3RoZXJDYW1wHwxnZBQrAAIWEB8GBSJIaWdoIFNjaG9vbCBQb3N0c2Vjb25kYXJ5IFN0dWRlbnRzHwcFIkhpZ2ggU2Nob29sIFBvc3RzZWNvbmRhcnkgU3R1ZGVudHMfCAUzL0FkbWlzc2lvbnMvSGlnaCBTY2hvb2wgU3R1ZGVudHMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFFEhpZ2ggU2Nob29sIFN0dWRlbnRzHwNnHwpnHwsFIC9BZG1pc3Npb25zL0hpZ2ggU2Nob29sIFN0dWRlbnRzHwxnZBQrAAIWEB8GBRpXZXN0ZXJuIFVuZGVyZ3JhZCBFeGNoYW5nZR8HBRpXZXN0ZXJuIFVuZGVyZ3JhZCBFeGNoYW5nZR8IBSIvQWRtaXNzaW9ucy9XVUUvUGFnZXMvZGVmYXVsdC5hc3B4HwkFA1dVRR8DZx8KZx8LBQ8vQWRtaXNzaW9ucy9XVUUfDGdkFCsAAhYQHwYFF1NlbmlvciBDaXRpemVucyBQcm9ncmFtHwcFF1NlbmlvciBDaXRpemVucyBQcm9ncmFtHwgFNi9BZG1pc3Npb25zL1NlbmlvciBDaXRpemVucyBQcm9ncmFtL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRdTZW5pb3IgQ2l0aXplbnMgUHJvZ3JhbR8DZx8KZx8LBSMvQWRtaXNzaW9ucy9TZW5pb3IgQ2l0aXplbnMgUHJvZ3JhbR8MZ2QUKwACFg4fBgUKQVAvQ0xFUC9JQh8HBQpBUC9DTEVQL0lCHwgFJy9BZG1pc3Npb25zL0FQQ0xFUElCL1BhZ2VzL2RlZmF1bHQuYXNweB8DZx8KZx8LBRQvQWRtaXNzaW9ucy9BUENMRVBJQh8MZ2QUKwACFg4fBgUTQ29zdHMgYW5kIEZpbmFuY2luZx8HBRNDb3N0cyBhbmQgRmluYW5jaW5nHwgFNy9BZG1pc3Npb25zL0Nvc3RzRmluYW5jaW5nL1BhZ2VzL0Nvc3RzYW5kRmluYW5jaW5nLmFzcHgfA2cfCmcfCwUaL0FkbWlzc2lvbnMvQ29zdHNGaW5hbmNpbmcfDGdkFCsAAhYOHwYFKEFkbWlzc2lvbnMgQ29udGFjdCBJbmZvcm1hdGlvbiBVQyBEZW52ZXIfBwUoQWRtaXNzaW9ucyBDb250YWN0IEluZm9ybWF0aW9uIFVDIERlbnZlch8IBSEvQWRtaXNzaW9ucy9QYWdlcy9Db250YWN0IFVTLmFzcHgfA2cfCmcfCwUhL0FkbWlzc2lvbnMvUGFnZXMvQ29udGFjdCBVUy5hc3B4HwxnZBQrAAIWDh8GBQ1GaW5hbmNpYWwgQWlkHwcFDUZpbmFuY2lhbCBBaWQfCAVOL0FkbWlzc2lvbnMvQ29zdHNGaW5hbmNpbmcvRG93bnRvd25DYW1wdXMvRmluYW5jaWFsQWlkL1BhZ2VzL0ZpbmFuY2lhbEFpZC5hc3B4HwNnHwpnHwsFTi9BZG1pc3Npb25zL0Nvc3RzRmluYW5jaW5nL0Rvd250b3duQ2FtcHVzL0ZpbmFuY2lhbEFpZC9QYWdlcy9GaW5hbmNpYWxBaWQuYXNweB8MZ2QUKwACFg4fBgUlU3R1ZGVudCBCaWxsaW5nIC0gQnVyc2FyJiMzOTtzIE9mZmljZR8HBSVTdHVkZW50IEJpbGxpbmcgLSBCdXJzYXImIzM5O3MgT2ZmaWNlHwgFUi9BZG1pc3Npb25zL0Nvc3RzRmluYW5jaW5nL0Rvd250b3duQ2FtcHVzL1N0dWRlbnRCaWxsaW5nL1BhZ2VzL1N0dWRlbnRCaWxsaW5nLmFzcHgfA2cfCmcfCwVSL0FkbWlzc2lvbnMvQ29zdHNGaW5hbmNpbmcvRG93bnRvd25DYW1wdXMvU3R1ZGVudEJpbGxpbmcvUGFnZXMvU3R1ZGVudEJpbGxpbmcuYXNweB8MZ2QUKwACFg4fBgUUTG9hbnMgUmVwYXltZW50L0RlYnQfBwUUTG9hbnMgUmVwYXltZW50L0RlYnQfCAVaL0FkbWlzc2lvbnMvQ29zdHNGaW5hbmNpbmcvRG93bnRvd25DYW1wdXMvTG9hbnNSZXBheW1lbnREZWJ0L1BhZ2VzL0xvYW5zUmVwYXltZW50RGVidC5hc3B4HwNnHwpnHwsFWi9BZG1pc3Npb25zL0Nvc3RzRmluYW5jaW5nL0Rvd250b3duQ2FtcHVzL0xvYW5zUmVwYXltZW50RGVidC9QYWdlcy9Mb2Fuc1JlcGF5bWVudERlYnQuYXNweB8MZ2QUKwACFg4fBgUVU2Nob2xhcnNoaXAgUmVzb3VyY2VzHwcFFVNjaG9sYXJzaGlwIFJlc291cmNlcx8IBUovQWRtaXNzaW9ucy9TY2hvbGFyc2hpcCBSZXNvdXJjZXMvUGFnZXMvVUNEU2Nob2xhcnNoaXBzUmVzb3VyY2VPZmZpY2UuYXNweB8DZx8KZx8LBSEvQWRtaXNzaW9ucy9TY2hvbGFyc2hpcCBSZXNvdXJjZXMfDGdkFCsAAhYOHwYFHVdvcmstU3R1ZHkvU3R1ZGVudCBFbXBsb3ltZW50HwcFHVdvcmstU3R1ZHkvU3R1ZGVudCBFbXBsb3ltZW50HwgFjAEvQWRtaXNzaW9ucy9Db3N0c0ZpbmFuY2luZy9Eb3dudG93bkNhbXB1cy9GaW5hbmNpYWxBaWQvRnVuZGluZ1lvdXJFZHVjYXRpb24vV29ya1N0dWR5U3R1ZGVudEVtcGxveW1lbnQvUGFnZXMvV29ya1N0dWR5U3R1ZGVudEVtcGxveW1lbnQuYXNweB8DZx8KZx8LBYwBL0FkbWlzc2lvbnMvQ29zdHNGaW5hbmNpbmcvRG93bnRvd25DYW1wdXMvRmluYW5jaWFsQWlkL0Z1bmRpbmdZb3VyRWR1Y2F0aW9uL1dvcmtTdHVkeVN0dWRlbnRFbXBsb3ltZW50L1BhZ2VzL1dvcmtTdHVkeVN0dWRlbnRFbXBsb3ltZW50LmFzcHgfDGdkFCsAAhYOHwYFJ09mZmljZSBvZiB0aGUgUmVnaXN0cmFyLURvd250b3duIENhbXB1cx8HBSdPZmZpY2Ugb2YgdGhlIFJlZ2lzdHJhci1Eb3dudG93biBDYW1wdXMfCAUoL0FkbWlzc2lvbnMvUmVnaXN0cmFyL1BhZ2VzL2RlZmF1bHQuYXNweB8DZx8KZx8LBRUvQWRtaXNzaW9ucy9SZWdpc3RyYXIfDGdkFCsAAhYQHwYFHU9yaWVudGF0aW9uLVBsYWNlbWVudCBUZXN0aW5nHwcFHU9yaWVudGF0aW9uLVBsYWNlbWVudCBUZXN0aW5nHwgFPC9BZG1pc3Npb25zL09yaWVudGF0aW9uLVBsYWNlbWVudCBUZXN0aW5nL1BhZ2VzL2RlZmF1bHQuYXNweB8JBR1PcmllbnRhdGlvbi1QbGFjZW1lbnQgVGVzdGluZx8DZx8KZx8LBSkvQWRtaXNzaW9ucy9PcmllbnRhdGlvbi1QbGFjZW1lbnQgVGVzdGluZx8MZ2QUKwACFhAfBgUyU3R1ZGVudCBJbmZvcm1hdGlvbiBTeXN0ZW0gUmVwbGFjZW1lbnQgSW5mb3JtYXRpb24fBwUyU3R1ZGVudCBJbmZvcm1hdGlvbiBTeXN0ZW0gUmVwbGFjZW1lbnQgSW5mb3JtYXRpb24fCAU5aHR0cDovL3d3dy51Y2Roc2MuZWR1L2FkbWluL3N0dWRlbnRmaW5hbmNpYWxzZXJ2aWNlcy9zaXMvHwNnHwpnHwsFOWh0dHA6Ly93d3cudWNkaHNjLmVkdS9hZG1pbi9zdHVkZW50ZmluYW5jaWFsc2VydmljZXMvc2lzLx8MZx4GVGFyZ2V0BQZfYmxhbmtkFCsAAhYOHwYFGkFjYWRlbWljIEZyZWVkb20gVUMgRGVudmVyHwcFGkFjYWRlbWljIEZyZWVkb20gVUMgRGVudmVyHwgFJi9BZG1pc3Npb25zL1BhZ2VzL0FjYWRlbWljRnJlZWRvbS5hc3B4HwNnHwpnHwsFJi9BZG1pc3Npb25zL1BhZ2VzL0FjYWRlbWljRnJlZWRvbS5hc3B4HwxnZBQrAAIWEB8GBQxTdHVkZW50IExpZmUfBwUMU3R1ZGVudCBMaWZlHwgFIC9TdHVkZW50IExpZmUvUGFnZXMvZGVmYXVsdC5hc3B4HwkFDFN0dWRlbnQgTGlmZR8DZx8KZx8LBQ0vU3R1ZGVudCBMaWZlHwxnFCsABgUTMDowLDA6MSwwOjIsMDozLDA6NBQrAAIWDh8GBRxFeHBlcmllbnRpYWwgTGVhcm5pbmcgQ2VudGVyHwcFHEV4cGVyaWVudGlhbCBMZWFybmluZyBDZW50ZXIfCAUraHR0cDovL3RodW5kZXIxLmN1ZGVudmVyLmVkdS9leGwvaW5kZXguaHRtbB8DZx8KZx8LBStodHRwOi8vdGh1bmRlcjEuY3VkZW52ZXIuZWR1L2V4bC9pbmRleC5odG1sHwxnZBQrAAIWEB8GBQ1DYXJlZXIgQ2VudGVyHwcFDUNhcmVlciBDZW50ZXIfCAUuL1N0dWRlbnQgTGlmZS9DYXJlZXIgQ2VudGVyL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQ1DYXJlZXIgQ2VudGVyHwNnHwpnHwsFGy9TdHVkZW50IExpZmUvQ2FyZWVyIENlbnRlch8MZ2QUKwACFhAfBgUXU3R1ZGVudCBBZHZvY2FjeSBDZW50ZXIfBwUXU3R1ZGVudCBBZHZvY2FjeSBDZW50ZXIfCAUkL1N0dWRlbnQgTGlmZS9TQUMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFF1N0dWRlbnQgQWR2b2NhY3kgQ2VudGVyHwNnHwpnHwsFES9TdHVkZW50IExpZmUvU0FDHwxnZBQrAAIWDh8GBRdOZXcgU3R1ZGVudCBPcmllbnRhdGlvbh8HBRdOZXcgU3R1ZGVudCBPcmllbnRhdGlvbh8IBSQvU3R1ZGVudCBMaWZlL05TTy9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwURL1N0dWRlbnQgTGlmZS9OU08fDGdkFCsAAhYOHwYFGUVkdWNhdGlvbmFsIE9wcG9ydHVuaXRpZXMfBwUZRWR1Y2F0aW9uYWwgT3Bwb3J0dW5pdGllcx8IBUEvU3R1ZGVudCBMaWZlL0VkdWNhdGlvbmFsT3Bwb3J0dW5pdGllc1Byb2dyYW1zL1BhZ2VzL2RlZmF1bHQuYXNweB8DZx8KZx8LBS4vU3R1ZGVudCBMaWZlL0VkdWNhdGlvbmFsT3Bwb3J0dW5pdGllc1Byb2dyYW1zHwxnZBQrAAIWDh8GBQ1JbnRlcm5hdGlvbmFsHwcFDUludGVybmF0aW9uYWwfCAUhL0ludGVybmF0aW9uYWwvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFDi9JbnRlcm5hdGlvbmFsHwxnFCsAAwUHMDowLDA6MRQrAAIWDh8GBQVDSUJFUh8HBQVDSUJFUh8IBScvSW50ZXJuYXRpb25hbC9DSUJFUi9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUUL0ludGVybmF0aW9uYWwvQ0lCRVIfDGdkFCsAAhYOHwYFF0ludGVybmF0aW9uYWwgRWR1Y2F0aW9uHwcFF0ludGVybmF0aW9uYWwgRWR1Y2F0aW9uHwgFOS9JbnRlcm5hdGlvbmFsL0ludGVybmF0aW9uYWwgRWR1Y2F0aW9uL1BhZ2VzL2RlZmF1bHQuYXNweB8DZx8KZx8LBSYvSW50ZXJuYXRpb25hbC9JbnRlcm5hdGlvbmFsIEVkdWNhdGlvbh8MZ2QUKwACFhAfBgUJUmVzb3VyY2VzHwcFCVJlc291cmNlcx8IBR0vUmVzb3VyY2VzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQlSZXNvdXJjZXMfA2cfCmcfCwUKL1Jlc291cmNlcx8MZxQrAAoFIzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcsMDo4FCsAAhYQHwYFEUNvdW5zZWxpbmcgQ2VudGVyHwcFEUNvdW5zZWxpbmcgQ2VudGVyHwgFLy9SZXNvdXJjZXMvQ291bnNlbGluZyBDZW50ZXIvUGFnZXMvZGVmYXVsdC5hc3B4HwkFEUNvdW5zZWxpbmcgQ2VudGVyHwNnHwpnHwsFHC9SZXNvdXJjZXMvQ291bnNlbGluZyBDZW50ZXIfDGdkFCsAAhYQHwYFD0h1bWFuIFJlc291cmNlcx8HBQ9IdW1hbiBSZXNvdXJjZXMfCAUtL1Jlc291cmNlcy9IdW1hbiBSZXNvdXJjZXMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFD0h1bWFuIFJlc291cmNlcx8DZx8KZx8LBRovUmVzb3VyY2VzL0h1bWFuIFJlc291cmNlcx8MZ2QUKwACFg4fBgUWSW5zdGl0dXRpb25hbCBSZXNlYXJjaB8HBRZJbnN0aXR1dGlvbmFsIFJlc2VhcmNoHwgFNC9SZXNvdXJjZXMvSW5zdGl0dXRpb25hbCBSZXNlYXJjaC9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUhL1Jlc291cmNlcy9JbnN0aXR1dGlvbmFsIFJlc2VhcmNoHwxnZBQrAAIWDh8GBQtJVCBTZXJ2aWNlcx8HBQtJVCBTZXJ2aWNlcx8IBSEvUmVzb3VyY2VzL0lUUy9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUOL1Jlc291cmNlcy9JVFMfDGdkFCsAAhYOHwYFH1VDIERlbnZlciBFZGl0b3JpYWwgU3R5bGUgR3VpZGUfBwUfVUMgRGVudmVyIEVkaXRvcmlhbCBTdHlsZSBHdWlkZR8IBSgvUmVzb3VyY2VzL1N0eWxlR3VpZGUvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFFS9SZXNvdXJjZXMvU3R5bGVHdWlkZR8MZ2QUKwACFhAfBgUTQnJhbmRpbmcgR3VpZGVsaW5lcx8HBRNCcmFuZGluZyBHdWlkZWxpbmVzHwgFMS9SZXNvdXJjZXMvQnJhbmRpbmcgR3VpZGVsaW5lcy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUTQnJhbmRpbmcgR3VpZGVsaW5lcx8DZx8KZx8LBR4vUmVzb3VyY2VzL0JyYW5kaW5nIEd1aWRlbGluZXMfDGdkFCsAAhYOHwYFDU9tYnVkcyBPZmZpY2UfBwUNT21idWRzIE9mZmljZR8IBSsvUmVzb3VyY2VzL09tYnVkcyBPZmZpY2UvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFGC9SZXNvdXJjZXMvT21idWRzIE9mZmljZR8MZ2QUKwACFhAfBgUXUG9saWNpZXMgYW5kIFByb2NlZHVyZXMfBwUXUG9saWNpZXMgYW5kIFByb2NlZHVyZXMfCAU1L1Jlc291cmNlcy9Qb2xpY2llcyBhbmQgUHJvY2VkdXJlcy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUXUG9saWNpZXMgYW5kIFByb2NlZHVyZXMfA2cfCmcfCwUiL1Jlc291cmNlcy9Qb2xpY2llcyBhbmQgUHJvY2VkdXJlcx8MZ2QUKwACFg4fBgUXVW5pdmVyc2l0eSBXZWIgU2VydmljZXMfBwUXVW5pdmVyc2l0eSBXZWIgU2VydmljZXMfCAUsL1Jlc291cmNlcy9XZWJEZXZlbG9wbWVudC9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUZL1Jlc291cmNlcy9XZWJEZXZlbG9wbWVudB8MZ2QUKwACFhAfBgUKVGhlIENhbXB1cx8HBQpUaGUgQ2FtcHVzHwgFGi9DYW1wdXMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFClRoZSBDYW1wdXMfA2cfCmcfCwUHL0NhbXB1cx8MZ2QUKwACFhAfBgUOQWRtaW5pc3RyYXRpb24fBwUOQWRtaW5pc3RyYXRpb24fCAUiL0FkbWluaXN0cmF0aW9uL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQ5BZG1pbmlzdHJhdGlvbh8DZx8KZx8LBQ8vQWRtaW5pc3RyYXRpb24fDGcUKwAHBRcwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NRQrAAIWEB8GBQpDaGFuY2VsbG9yHwcFCkNoYW5jZWxsb3IfCAUtL0FkbWluaXN0cmF0aW9uL0NoYW5jZWxsb3IvUGFnZXMvZGVmYXVsdC5hc3B4HwkFCkNoYW5jZWxsb3IfA2cfCmcfCwUaL0FkbWluaXN0cmF0aW9uL0NoYW5jZWxsb3IfDGdkFCsAAhYOHwYFFU9mZmljZSBvZiB0aGUgUHJvdm9zdB8HBRVPZmZpY2Ugb2YgdGhlIFByb3Zvc3QfCAU4L0FkbWluaXN0cmF0aW9uL09mZmljZSBvZiB0aGUgUHJvdm9zdC9QYWdlcy9kZWZhdWx0LmFzcHgfA2cfCmcfCwUlL0FkbWluaXN0cmF0aW9uL09mZmljZSBvZiB0aGUgUHJvdm9zdB8MZ2QUKwACFg4fBgUaQWRtaW5pc3RyYXRpb24gYW5kIEZpbmFuY2UfBwUaQWRtaW5pc3RyYXRpb24gYW5kIEZpbmFuY2UfCAU9L0FkbWluaXN0cmF0aW9uL0FkbWluaXN0cmF0aW9uIGFuZCBGaW5hbmNlL1BhZ2VzL2RlZmF1bHQuYXNweB8DZx8KZx8LBSovQWRtaW5pc3RyYXRpb24vQWRtaW5pc3RyYXRpb24gYW5kIEZpbmFuY2UfDGdkFCsAAhYQHwYFF0FkbWluaXN0cmF0aXZlIENvbnRhY3RzHwcFF0FkbWluaXN0cmF0aXZlIENvbnRhY3RzHwgFOy9BZG1pbmlzdHJhdGlvbi9DVS1EZW52ZXIgQWRtaW5pc3RyYXRpb24vUGFnZXMvZGVmYXVsdC5hc3B4HwkFGENVLURlbnZlciBBZG1pbmlzdHJhdGlvbh8DZx8KZx8LBSgvQWRtaW5pc3RyYXRpb24vQ1UtRGVudmVyIEFkbWluaXN0cmF0aW9uHwxnZBQrAAIWEB8GBRVPcmdhbml6YXRpb25hbCBDaGFydHMfBwUVT3JnYW5pemF0aW9uYWwgQ2hhcnRzHwgFNy9BZG1pbmlzdHJhdGlvbi9DVS1EZW52ZXIgT3JnIENoYXJ0cy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUfQ1UtRGVudmVyIE9yZ2FuaXphdGlvbmFsIENoYXJ0cx8DZx8KZx8LBSQvQWRtaW5pc3RyYXRpb24vQ1UtRGVudmVyIE9yZyBDaGFydHMfDGdkFCsAAhYOHwYFEEFjYWRlbWljIEZyZWVkb20fBwUQQWNhZGVtaWMgRnJlZWRvbR8IBSovQWRtaW5pc3RyYXRpb24vUGFnZXMvQWNhZGVtaWNGcmVlZG9tLmFzcHgfA2cfCmcfCwUqL0FkbWluaXN0cmF0aW9uL1BhZ2VzL0FjYWRlbWljRnJlZWRvbS5hc3B4HwxnZBQrAAIWEB8GBQhXaG8gQW0gSR8HBQhXaG8gQW0gSR8IBRwvV2hvIEFtIEkvUGFnZXMvZGVmYXVsdC5hc3B4HwkFCFdobyBBbSBJHwNnHwpnHwsFCS9XaG8gQW0gSR8MZxQrAAYFEzA6MCwwOjEsMDoyLDA6MywwOjQUKwACFhAfBgUUUHJvc3BlY3RpdmUgU3R1ZGVudHMfBwUUUHJvc3BlY3RpdmUgU3R1ZGVudHMfCAUxL1dobyBBbSBJL1Byb3NwZWN0aXZlIFN0dWRlbnRzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRRQcm9zcGVjdGl2ZSBTdHVkZW50cx8DZx8KZx8LBR4vV2hvIEFtIEkvUHJvc3BlY3RpdmUgU3R1ZGVudHMfDGdkFCsAAhYQHwYFEEN1cnJlbnQgU3R1ZGVudHMfBwUQQ3VycmVudCBTdHVkZW50cx8IBS0vV2hvIEFtIEkvQ3VycmVudCBTdHVkZW50cy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUQQ3VycmVudCBTdHVkZW50cx8DZx8KZx8LBRovV2hvIEFtIEkvQ3VycmVudCBTdHVkZW50cx8MZ2QUKwACFhAfBgURRmFjdWx0eSBhbmQgU3RhZmYfBwURRmFjdWx0eSBhbmQgU3RhZmYfCAUsL1dobyBBbSBJL0ZhY3VsdHkgYW5kIFN0YWZmL1BhZ2VzL2luZGV4LmFzcHgfCQURRmFjdWx0eSBhbmQgU3RhZmYfA2cfCmcfCwUbL1dobyBBbSBJL0ZhY3VsdHkgYW5kIFN0YWZmHwxnZBQrAAIWEB8GBRJBbHVtbmkgYW5kIEZyaWVuZHMfBwUSQWx1bW5pIGFuZCBGcmllbmRzHwgFLy9XaG8gQW0gSS9BbHVtbmkgYW5kIEZyaWVuZHMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFEkFsdW1uaSBhbmQgRnJpZW5kcx8DZx8KZx8LBRwvV2hvIEFtIEkvQWx1bW5pIGFuZCBGcmllbmRzHwxnZBQrAAIWEB8GBRZCdXNpbmVzcyBhbmQgQ29tbXVuaXR5HwcFFkJ1c2luZXNzIGFuZCBDb21tdW5pdHkfCAUzL1dobyBBbSBJL0J1c2luZXNzIGFuZCBDb21tdW5pdHkvUGFnZXMvZGVmYXVsdC5hc3B4HwkFFkJ1c2luZXNzIGFuZCBDb21tdW5pdHkfA2cfCmcfCwUgL1dobyBBbSBJL0J1c2luZXNzIGFuZCBDb21tdW5pdHkfDGdkZGQCDQ9kFggCARA8KwANAgAPFgIfBWdkDBQrAAkFHzA6MCwwOjEsMDoyLDA6MywwOjQsMDo1LDA6NiwwOjcUKwACFhAfBgUJQWNhZGVtaWNzHwcFCUFjYWRlbWljcx8IBR0vQWNhZGVtaWNzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRNBY2FkZW1pY3MgaG9tZSBwYWdlHwNnHwpnHwsFCi9BY2FkZW1pY3MfDGcUKwAMBSwwOjAsMDoxLDA6MiwwOjMsMDo0LDA6NSwwOjYsMDo3LDA6OCwwOjksMDoxMBQrAAIWEB8GBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8HBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8IBTIvQWNhZGVtaWNzL1Byb2dyYW1zIGFuZCBEZWdyZWVzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRRQcm9ncmFtcyBhbmQgRGVncmVlcx8DZx8KZx8LBR8vQWNhZGVtaWNzL1Byb2dyYW1zIGFuZCBEZWdyZWVzHwxnZBQrAAIWEB8GBRRTY2hvb2xzIGFuZCBDb2xsZWdlcx8HBRRTY2hvb2xzIGFuZCBDb2xsZWdlcx8IBSYvQWNhZGVtaWNzL0NvbGxlZ2VzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQhDb2xsZWdlcx8DZx8KZx8LBRMvQWNhZGVtaWNzL0NvbGxlZ2VzHwxnZBQrAAIWEB8GBRZDZW50ZXJzIGFuZCBJbnN0aXR1dGVzHwcFFkNlbnRlcnMgYW5kIEluc3RpdHV0ZXMfCAU0L0FjYWRlbWljcy9DZW50ZXJzIGFuZCBJbnN0aXR1dGVzL1BhZ2VzL2RlZmF1bHQuYXNweB8JBRZDZW50ZXJzIGFuZCBJbnN0aXR1dGVzHwNnHwpnHwsFIS9BY2FkZW1pY3MvQ2VudGVycyBhbmQgSW5zdGl0dXRlcx8MZ2QUKwACFhAfBgUJQ1UgT25saW5lHwcFCUNVIE9ubGluZR8IBSYvQUNBREVNSUNTL0NVT05MSU5FL1BhZ2VzL2RlZmF1bHQuYXNweB8JBShVbml2ZXJzaXR5IG9mIENvbG9yYWRvIERlbnZlciwgQ1UgT25saW5lHwNnHwpnHwsFEy9BQ0FERU1JQ1MvQ1VPTkxJTkUfDGdkFCsAAhYQHwYFGFN0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8HBRhTdHVkZW50IEFjYWRlbWljIFN1cHBvcnQfCAU2L0FjYWRlbWljcy9TdHVkZW50IEFjYWRlbWljIFN1cHBvcnQvUGFnZXMvZGVmYXVsdC5hc3B4HwkFGFN0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8DZx8KZx8LBSMvQWNhZGVtaWNzL1N0dWRlbnQgQWNhZGVtaWMgU3VwcG9ydB8MZ2QUKwACFg4fBgUsT2ZmaWNlIG9mIFJlc2VhcmNoIERldmVsb3BtZW50IGFuZCBFZHVjYXRpb24fBwUsT2ZmaWNlIG9mIFJlc2VhcmNoIERldmVsb3BtZW50IGFuZCBFZHVjYXRpb24fCAUjL0FjYWRlbWljcy9SZXNlYXJjaC9QYWdlcy9ob21lLmFzcHgfA2cfCmcfCwUTL0FjYWRlbWljcy9SZXNlYXJjaB8MZ2QUKwACFhAfBgUaQ29udGludWluZy1Qcm9mLiBFZHVjYXRpb24fBwUaQ29udGludWluZy1Qcm9mLiBFZHVjYXRpb24fCAVFL0FjYWRlbWljcy9Db250aW51aW5nIGFuZCBQcm9mZXNzaW9uYWwgRWR1Y2F0aW9uL1BhZ2VzL3JlZGlyZWN0Mi5hc3B4HwkFJUNvbnRpbnVpbmcgYW5kIFByb2Zlc3Npb25hbCBFZHVjYXRpb24fA2cfCmcfCwUwL0FjYWRlbWljcy9Db250aW51aW5nIGFuZCBQcm9mZXNzaW9uYWwgRWR1Y2F0aW9uHwxnZBQrAAIWEB8GBQxDb21tZW5jZW1lbnQfBwUMQ29tbWVuY2VtZW50HwgFKi9BY2FkZW1pY3MvQ29tbWVuY2VtZW50L1BhZ2VzL2RlZmF1bHQuYXNweB8JBQxDb21tZW5jZW1lbnQfA2cfCmcfCwUXL0FjYWRlbWljcy9Db21tZW5jZW1lbnQfDGdkFCsAAhYOHwYFIUNvbnRpbnVpbmcgUHJvZmVzc2lvbmFsIEVkdWNhdGlvbh8HBSFDb250aW51aW5nIFByb2Zlc3Npb25hbCBFZHVjYXRpb24fCAUfL0FjYWRlbWljcy9DUEUvUGFnZXMvaW5kZXguYXNweB8DZx8KZx8LBQ4vQWNhZGVtaWNzL0NQRR8MZ2QUKwACFg4fBgURQ2F0YWxvZyAyMDA4LTIwMDkfBwURQ2F0YWxvZyAyMDA4LTIwMDkfCAUnL0FjYWRlbWljcy9DYXRhbG9nMjAwOS9QYWdlcy9pbmRleC5hc3B4HwNnHwpnHwsFFi9BY2FkZW1pY3MvQ2F0YWxvZzIwMDkfDGdkFCsAAhYOHwYFBHRlc3QfBwUEdGVzdB8IBSIvQWNhZGVtaWNzL3Rlc3QvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFDy9BY2FkZW1pY3MvdGVzdB8MZ2QUKwACFhAfBgUKQWRtaXNzaW9ucx8HBQpBZG1pc3Npb25zHwgFHi9BRE1JU1NJT05TL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQpBZG1pc3Npb25zHwNnHwpnHwsFCy9BRE1JU1NJT05THwxnZBQrAAIWEB8GBQxTdHVkZW50IExpZmUfBwUMU3R1ZGVudCBMaWZlHwgFIC9TdHVkZW50IExpZmUvUGFnZXMvZGVmYXVsdC5hc3B4HwkFDFN0dWRlbnQgTGlmZR8DZx8KZx8LBQ0vU3R1ZGVudCBMaWZlHwxnZBQrAAIWDh8GBQ1JbnRlcm5hdGlvbmFsHwcFDUludGVybmF0aW9uYWwfCAUhL0ludGVybmF0aW9uYWwvUGFnZXMvZGVmYXVsdC5hc3B4HwNnHwpnHwsFDi9JbnRlcm5hdGlvbmFsHwxnZBQrAAIWEB8GBQlSZXNvdXJjZXMfBwUJUmVzb3VyY2VzHwgFHS9SZXNvdXJjZXMvUGFnZXMvZGVmYXVsdC5hc3B4HwkFCVJlc291cmNlcx8DZx8KZx8LBQovUmVzb3VyY2VzHwxnZBQrAAIWEB8GBQpUaGUgQ2FtcHVzHwcFClRoZSBDYW1wdXMfCAUaL0NhbXB1cy9QYWdlcy9kZWZhdWx0LmFzcHgfCQUKVGhlIENhbXB1cx8DZx8KZx8LBQcvQ2FtcHVzHwxnZBQrAAIWEB8GBQ5BZG1pbmlzdHJhdGlvbh8HBQ5BZG1pbmlzdHJhdGlvbh8IBSIvQWRtaW5pc3RyYXRpb24vUGFnZXMvZGVmYXVsdC5hc3B4HwkFDkFkbWluaXN0cmF0aW9uHwNnHwpnHwsFDy9BZG1pbmlzdHJhdGlvbh8MZ2QUKwACFhAfBgUIV2hvIEFtIEkfBwUIV2hvIEFtIEkfCAUcL1dobyBBbSBJL1BhZ2VzL2RlZmF1bHQuYXNweB8JBQhXaG8gQW0gSR8DZx8KZx8LBQkvV2hvIEFtIEkfDGdkZGQCBQ8WAh8ACysEAWQCBw8WAh8ACysEAWQCCQ8WAh8ACysEAWQCEQ9kFgICAg8PFgIfAWcWAh4Fc3R5bGUFDmRpc3BsYXk6YmxvY2s7ZGRoPfZ5lulw9v0wSVja2D+nPQZP9A==" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>



<script src="/JavaScript/AdapterUtils.js" type="text/javascript"></script>
<script src="/JavaScript/MenuAdapter.js" type="text/javascript"></script><script> var MSOWebPartPageFormName = 'aspnetForm';</script><script type="text/javascript" language="javascript" src="/_layouts/1033/init.js?rev=ck%2BHdHQ8ABQHif7kr%2Bj7iQ%3D%3D"></script>
<script type="text/javascript" language="javascript" src="/_layouts/1033/init.js?rev=ck%2BHdHQ8ABQHif7kr%2Bj7iQ%3D%3D"></script><script type="text/javascript" language="javascript" src="/_layouts/1033/core.js?rev=S5dt4K8TJGVTYU9HrW6enw%3D%3D" defer></script><script type="text/JavaScript" language="JavaScript">
<!--
var L_Menu_BaseUrl="/Academics";
var L_Menu_LCID="1033";
var L_Menu_SiteTheme="";
//-->
</script><script type="text/javascript" language="javascript" src="/_layouts/1033/ie55up.js?rev=Ni7%2Fj2ZV%2FzCvd09XYSSWvA%3D%3D"></script><SCRIPT LANGUAGE='JavaScript' >
<!--
//-->
</SCRIPT><script type="text/javascript" language="javascript" src="/_layouts/1033/search.js?rev=yqBjpvg%2Foi3KG5XVf%2FStmA%3D%3D" defer></script>
<script type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {
UpdateFormDigest('\u002fAcademics', 1440000);return _spFormOnSubmitWrapper();
return true;
}
//]]>
</script>

     
      
<!-- Begin Action Menu Markup -->
<table height=100% class="ms-siteaction" cellpadding=0 cellspacing=0>
	<tr>
					   <td class="ms-siteactionsmenu" id="siteactiontd">
					   
					</td>
	</tr>
</table>
<!-- End Action Menu Markup -->

      
      
      
<!--BEGIN University brand bar and search area -->    
<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table1" bgcolor="#FFFFFF">
  <tr>
    <td width="0"></td>
    <td width="795"><a href="http://www.cudenver.edu/"><img border="0" src="http://www.cudenver.edu/PublishingImages/culogo.gif"style="margin:13px 20px 13px 20px" alt="CU Denver Homepage" /></a></td>
    <td  width="25%" valign="top"><div id="outer_search">
        <div id="search">
         
			
			 <table TOPLEVEL border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td valign="top"><div WebPartID="00000000-0000-0000-0000-000000000000" HasPers="true" id="WebPartWPQ1" width="100%" OnlyForMePart="true" allowDelete="false" style="" ><div id="SRSB"> <div>
			<input name="ctl00$ctl08$ctl00" type="hidden" id="ctl00_ctl08_ctl00" value="http://www.cudenver.edu/Academics" /><table class="ms-sbtable ms-sbtable-ex" border="0">
				<tr class="ms-sbrow">
					<td class="ms-sbscopes ms-sbcell"><select name="ctl00$ctl08$SBScopesDDL" id="ctl00_ctl08_SBScopesDDL" title="Search Scope" class="ms-sbscopes">
						<option value="This Site">This Site: Academics</option>
						<option selected="selected" value="">All UC Denver Sites</option>
						<option value="">Downtown Denver Campus</option>
						<option value="">Anschutz Medical Campus</option>
						<option value="">-------------------------------------------</option>
						<option value="">Architecture and Planning</option>
						<option value="">Arts and Media</option>
						<option value="">Business School</option>
						<option value="">Dental Medicine</option>
						<option value="">Education and Human Dev.</option>
						<option value="">Engineering and Applied Science</option>
						<option value="">Graduate School</option>
						<option value="">Liberal Arts and Sciences</option>
						<option value="">Medicine</option>
						<option value="">Nursing</option>
						<option value="">Pharmacy</option>
						<option value="">Public Affairs</option>
						<option value="">Public Health</option>
						<option value="">--------------------------------------------</option>
						<option value="">Network (University News)</option>

					</select></td><td class="ms-sbcell"><input name="ctl00$ctl08$S2C1F2767_InputKeywords" type="text" maxlength="200" id="ctl00_ctl08_S2C1F2767_InputKeywords" accesskey="S" title="Enter search words" class="ms-sbplain" alt="Enter search words" onkeypress="javascript:return S2C1F2767_OSBEK(event);" style="width:170px;" /></td><td class="ms-sbgo ms-sbcell"><a id="ctl00_ctl08_S2C1F2767_go" title="Go Search" href="javascript:S2C1F2767_Submit()"><img title="Go Search" onmouseover="this.src='/_layouts/images/gosearch.gif'" onmouseout="this.src='/_layouts/images/gosearch.gif'" alt="Go Search" src="/_layouts/images/gosearch.gif" style="border-width:0px;" /></a></td><td class="ms-sbcell ms-sblink"><a id="ctl00_ctl08_S2C1F2767_AdvSearchLink" title="Advanced Search" href="/search/Advanced.aspx">Advanced Search</a></td><td class="ms-sbLastcell"></td>
				</tr>
			</table>
		</div></div></div></td>
	</tr>
</table>
          
          <!--
          <form id="search_box" name="seek1" method="GET" action="http://search.uchsc.edu/query.html">
            <a id="j-search" name="j-search"></a>
            <input type="text" id="search_textBox" tabindex="1" name="qt" />
            <input type="submit" value="Go" tabindex="2" />
            <input type="hidden" name="RecordsPerPage" value="25" />
            <input type="hidden" name="Order" value="Rank" />
          </form>
          -->
        </div>
      </div></td>
  </tr>
  <tr >
    <td colspan="3" width="100%" height="10px" bgcolor="#B89417"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="3" width="100%" height="3px"></td>
  </tr>
  <tr>
    <td colspan="3" width="100%" height="3px" bgcolor="#000"></td>
  </tr>
</table>
<!--END University brand bar and search area -->      
	
	
	
	
<div id="mainwrapper">


<div class="AspNet-Menu-Horizontal">
	<ul class="AspNet-Menu">
		<li class="AspNet-Menu-WithChildren">
			<a href="/Academics/Pages/default.aspx" class="AspNet-Menu-Link" title="Academics home page">
				Academics
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Programs and Degrees/Pages/default.aspx" class="AspNet-Menu-Link" title="Programs and Degrees">
						Programs and Degrees
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Colleges/Pages/default.aspx" class="AspNet-Menu-Link" title="Colleges">
						Schools and Colleges
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Centers and Institutes/Pages/default.aspx" class="AspNet-Menu-Link" title="Centers and Institutes">
						Centers and Institutes
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/ACADEMICS/CUONLINE/Pages/default.aspx" class="AspNet-Menu-Link" title="University of Colorado Denver, CU Online">
						CU Online
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Student Academic Support/Pages/default.aspx" class="AspNet-Menu-Link" title="Student Academic Support">
						Student Academic Support
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Research/Pages/home.aspx" class="AspNet-Menu-Link">
						Office of Research Development and Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Continuing and Professional Education/Pages/redirect2.aspx" class="AspNet-Menu-Link" title="Continuing and Professional Education">
						Continuing-Prof. Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Commencement/Pages/default.aspx" class="AspNet-Menu-Link" title="Commencement">
						Commencement
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/CPE/Pages/index.aspx" class="AspNet-Menu-Link">
						Continuing Professional Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Catalog2009/Pages/index.aspx" class="AspNet-Menu-Link">
						Catalog 2008-2009
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/test/Pages/default.aspx" class="AspNet-Menu-Link">
						test
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/ADMISSIONS/Pages/default.aspx" class="AspNet-Menu-Link" title="Admissions">
				Admissions
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Undergraduate Admissions/Pages/default.aspx" class="AspNet-Menu-Link" title="Undergraduate Admissions - Welcome">
						Welcome to Undergraduate Admissions
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/UndergradFresh/Pages/default.aspx" class="AspNet-Menu-Link" title="Undergraduate-Freshman">
						Undergraduate-Freshman
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Transfer/Pages/default.aspx" class="AspNet-Menu-Link" title="Transfer">
						Undergraduate Transfer
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Graduate Admissions/Pages/default.aspx" class="AspNet-Menu-Link" title="Graduate Admissions">
						Graduate Admissions
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/International Students/Pages/default.aspx" class="AspNet-Menu-Link" title="International Students">
						International Students
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Non-Degree Admissions/Pages/default.aspx" class="AspNet-Menu-Link" title="Non-Degree Admissions">
						Non-Degree Admissions
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/FormerStudents/Pages/default.aspx" class="AspNet-Menu-Link">
						Former Students
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/OtherCamp/Pages/default.aspx" class="AspNet-Menu-Link" title="From Other CU Campuses">
						From Other CU Campuses
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/High School Students/Pages/default.aspx" class="AspNet-Menu-Link" title="High School Students">
						High School Postsecondary Students
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/WUE/Pages/default.aspx" class="AspNet-Menu-Link" title="WUE">
						Western Undergrad Exchange
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Senior Citizens Program/Pages/default.aspx" class="AspNet-Menu-Link" title="Senior Citizens Program">
						Senior Citizens Program
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/APCLEPIB/Pages/default.aspx" class="AspNet-Menu-Link">
						AP/CLEP/IB
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/CostsFinancing/Pages/CostsandFinancing.aspx" class="AspNet-Menu-Link">
						Costs and Financing
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Pages/Contact US.aspx" class="AspNet-Menu-Link">
						Admissions Contact Information UC Denver
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/CostsFinancing/DowntownCampus/FinancialAid/Pages/FinancialAid.aspx" class="AspNet-Menu-Link">
						Financial Aid
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/CostsFinancing/DowntownCampus/StudentBilling/Pages/StudentBilling.aspx" class="AspNet-Menu-Link">
						Student Billing - Bursar&#39;s Office
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/CostsFinancing/DowntownCampus/LoansRepaymentDebt/Pages/LoansRepaymentDebt.aspx" class="AspNet-Menu-Link">
						Loans Repayment/Debt
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Scholarship Resources/Pages/UCDScholarshipsResourceOffice.aspx" class="AspNet-Menu-Link">
						Scholarship Resources
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/CostsFinancing/DowntownCampus/FinancialAid/FundingYourEducation/WorkStudyStudentEmployment/Pages/WorkStudyStudentEmployment.aspx" class="AspNet-Menu-Link">
						Work-Study/Student Employment
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Registrar/Pages/default.aspx" class="AspNet-Menu-Link">
						Office of the Registrar-Downtown Campus
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Orientation-Placement Testing/Pages/default.aspx" class="AspNet-Menu-Link" title="Orientation-Placement Testing">
						Orientation-Placement Testing
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="http://www.ucdhsc.edu/admin/studentfinancialservices/sis/" class="AspNet-Menu-Link" onclick="window.open(this.href, '_blank', ''); return false;" onkeypress="window.open(this.href, '_blank', ''); return false;">
						Student Information System Replacement Information
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Admissions/Pages/AcademicFreedom.aspx" class="AspNet-Menu-Link">
						Academic Freedom UC Denver
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/Student Life/Pages/default.aspx" class="AspNet-Menu-Link" title="Student Life">
				Student Life
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="http://thunder1.cudenver.edu/exl/index.html" class="AspNet-Menu-Link">
						Experiential Learning Center
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Student Life/Career Center/Pages/default.aspx" class="AspNet-Menu-Link" title="Career Center">
						Career Center
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Student Life/SAC/Pages/default.aspx" class="AspNet-Menu-Link" title="Student Advocacy Center">
						Student Advocacy Center
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Student Life/NSO/Pages/default.aspx" class="AspNet-Menu-Link">
						New Student Orientation
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Student Life/EducationalOpportunitiesPrograms/Pages/default.aspx" class="AspNet-Menu-Link">
						Educational Opportunities
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/International/Pages/default.aspx" class="AspNet-Menu-Link">
				International
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/International/CIBER/Pages/default.aspx" class="AspNet-Menu-Link">
						CIBER
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/International/International Education/Pages/default.aspx" class="AspNet-Menu-Link">
						International Education
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/Resources/Pages/default.aspx" class="AspNet-Menu-Link" title="Resources">
				Resources
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Counseling Center/Pages/default.aspx" class="AspNet-Menu-Link" title="Counseling Center">
						Counseling Center
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Human Resources/Pages/default.aspx" class="AspNet-Menu-Link" title="Human Resources">
						Human Resources
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Institutional Research/Pages/default.aspx" class="AspNet-Menu-Link">
						Institutional Research
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/ITS/Pages/default.aspx" class="AspNet-Menu-Link">
						IT Services
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/StyleGuide/Pages/default.aspx" class="AspNet-Menu-Link">
						UC Denver Editorial Style Guide
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Branding Guidelines/Pages/default.aspx" class="AspNet-Menu-Link" title="Branding Guidelines">
						Branding Guidelines
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Ombuds Office/Pages/default.aspx" class="AspNet-Menu-Link">
						Ombuds Office
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/Policies and Procedures/Pages/default.aspx" class="AspNet-Menu-Link" title="Policies and Procedures">
						Policies and Procedures
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Resources/WebDevelopment/Pages/default.aspx" class="AspNet-Menu-Link">
						University Web Services
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Campus/Pages/default.aspx" class="AspNet-Menu-Link" title="The Campus">
				The Campus
			</a>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/Administration/Pages/default.aspx" class="AspNet-Menu-Link" title="Administration">
				Administration
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/Chancellor/Pages/default.aspx" class="AspNet-Menu-Link" title="Chancellor">
						Chancellor
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/Office of the Provost/Pages/default.aspx" class="AspNet-Menu-Link">
						Office of the Provost
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/Administration and Finance/Pages/default.aspx" class="AspNet-Menu-Link">
						Administration and Finance
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/CU-Denver Administration/Pages/default.aspx" class="AspNet-Menu-Link" title="CU-Denver Administration">
						Administrative Contacts
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/CU-Denver Org Charts/Pages/default.aspx" class="AspNet-Menu-Link" title="CU-Denver Organizational Charts">
						Organizational Charts
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Administration/Pages/AcademicFreedom.aspx" class="AspNet-Menu-Link">
						Academic Freedom
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-WithChildren">
			<a href="/Who Am I/Pages/default.aspx" class="AspNet-Menu-Link" title="Who Am I">
				Who Am I
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Who Am I/Prospective Students/Pages/default.aspx" class="AspNet-Menu-Link" title="Prospective Students">
						Prospective Students
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Who Am I/Current Students/Pages/default.aspx" class="AspNet-Menu-Link" title="Current Students">
						Current Students
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Who Am I/Faculty and Staff/Pages/index.aspx" class="AspNet-Menu-Link" title="Faculty and Staff">
						Faculty and Staff
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Who Am I/Alumni and Friends/Pages/default.aspx" class="AspNet-Menu-Link" title="Alumni and Friends">
						Alumni and Friends
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Who Am I/Business and Community/Pages/default.aspx" class="AspNet-Menu-Link" title="Business and Community">
						Business and Community
					</a>
				</li>
			</ul>
		</li>
	</ul>
</div>

								
									

      
<div id="contentwrapper">
<div id="block_1">




</div>


<div id="block_2">


		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr align="left" valign="top">
				<td colspan="3" align="right">
					<!-- end new global nav -->
				</td>
			</tr>
			<tr>
				<td width="15%" align="left" valign="top"><br>
					<table width="160" border="0" cellspacing="0" cellpadding="0">
						<!--new ucd: replace hard coded left nav with include-->
						<!--new left nav -->
						<tr>
							<td width="15%" align="right" valign="top"><br>
								<div align="left"><br>



<div class="AspNet-Menu-Vertical">
	<ul class="AspNet-Menu">
		<li class="AspNet-Menu-WithChildren">
			<a href="/Academics/Pages/default.aspx" class="AspNet-Menu-Link" title="Academics home page">
				Academics
			</a>
			<ul>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Programs and Degrees/Pages/default.aspx" class="AspNet-Menu-Link" title="Programs and Degrees">
						Programs and Degrees
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Colleges/Pages/default.aspx" class="AspNet-Menu-Link" title="Colleges">
						Schools and Colleges
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Centers and Institutes/Pages/default.aspx" class="AspNet-Menu-Link" title="Centers and Institutes">
						Centers and Institutes
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/ACADEMICS/CUONLINE/Pages/default.aspx" class="AspNet-Menu-Link" title="University of Colorado Denver, CU Online">
						CU Online
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Student Academic Support/Pages/default.aspx" class="AspNet-Menu-Link" title="Student Academic Support">
						Student Academic Support
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Research/Pages/home.aspx" class="AspNet-Menu-Link">
						Office of Research Development and Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Continuing and Professional Education/Pages/redirect2.aspx" class="AspNet-Menu-Link" title="Continuing and Professional Education">
						Continuing-Prof. Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Commencement/Pages/default.aspx" class="AspNet-Menu-Link" title="Commencement">
						Commencement
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/CPE/Pages/index.aspx" class="AspNet-Menu-Link">
						Continuing Professional Education
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/Catalog2009/Pages/index.aspx" class="AspNet-Menu-Link">
						Catalog 2008-2009
					</a>
				</li>
				<li class="AspNet-Menu-Leaf">
					<a href="/Academics/test/Pages/default.aspx" class="AspNet-Menu-Link">
						test
					</a>
				</li>
			</ul>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/ADMISSIONS/Pages/default.aspx" class="AspNet-Menu-Link" title="Admissions">
				Admissions
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Student Life/Pages/default.aspx" class="AspNet-Menu-Link" title="Student Life">
				Student Life
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/International/Pages/default.aspx" class="AspNet-Menu-Link">
				International
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Resources/Pages/default.aspx" class="AspNet-Menu-Link" title="Resources">
				Resources
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Campus/Pages/default.aspx" class="AspNet-Menu-Link" title="The Campus">
				The Campus
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Administration/Pages/default.aspx" class="AspNet-Menu-Link" title="Administration">
				Administration
			</a>
		</li>
		<li class="AspNet-Menu-Leaf">
			<a href="/Who Am I/Pages/default.aspx" class="AspNet-Menu-Link" title="Who Am I">
				Who Am I
			</a>
		</li>
	</ul>
</div>


						

</div>
								<h2>
								</h2>
							</td>
						</tr>
						<!-- end new left nav -->
					</table>
				</td>
				<!-- put in some space between left nav and content placeholder -->
				<td>
					&nbsp; &nbsp; &nbsp;
				</td>
				<td align="left" valign="top" class="body"><br>
					<!-- header -->
					<p>&nbsp;
					
					<h2>&nbsp;<div id="ctl00_PlaceHolderMain__migidPageTitle__ControlWrapper_RichHtmlField" style="display:inline"><h2>Academics</h2></div></h2></p>					
						
					
						<!-- content -->
						
						<div id="ctl00_PlaceHolderMain__migidBody1__ControlWrapper_RichHtmlField" style="display:inline"><div>The academic programs at the University of Colorado Denver Downtown Campus represent a rigorous, exciting, demanding, and enlightening exploration of higher education, tailored to fit the needs of anyone, anywhere. UC Denver has earned a reputation as an innovative leader in higher education, and is committed to becoming the nation's premier urban university. At the heart of that mission is, and always will be, quality academics.</div>
<div> </div>
<div>UC Denver offers more than 80 excellent degree programs, spanning a broad range of disciplines and fields, at the bachelor's, master's and doctoral levels. With a foundation in top-notch classroom instruction led by some of America's most respected educators - matched by extensive experiential learning components - students gain the insight and hands-on training they need to impact the 21st century workplace. Courses are offered online, on a full- or part-time basis, and during the days, evenings and weekends.</div>
<div> </div>
<div>The programs at the Downtown Campus are administered through seven colleges and schools: the College of Architecture and Planning; the College of Arts &amp; Media; the Business School; the College of Engineering and Applied Science; the College of Liberal Arts and Sciences; the Graduate School of Public Affairs; and the School of Education.</div>
<div> </div>
<div>Supporting student academic success are campus resources such as the Auraria Library, that offers traditional university library services and connectivity to an extensive number of online databases.</div></div>
					<P>&nbsp;</P>
					<!--footer-->
					<div id="ctl00_PlaceHolderMain__migidHTMLEditControl56__ControlWrapper_RichHtmlField" style="display:inline"></div>
				</td>
				<!-- force a margin on the right side of the page -->
				<td width="60"></td>
			</tr>
		</table>

<table id="MSO_ContentTable" cellpadding="4" cellspacing="0" border="0" width="100%">
</table>

</div>

<div id="block_3">

</div>
</div>

</div>

<div id="ft">
  <ul id="ftnav">
    <li><a href="http://redesign.cudenver.edu/ddcFeedbackForm.aspx" style="*font-size:small;*font:x-small;font-size:77%;font-family:verdana,arial,helvetica,clean,sans-serif;color:blue;text-decoration:underline;font-weight:bold;">Contact the Webmaster</a></li>
    <li><a href="http://www.ucdhsc.edu/privacystmt.htm" style="*font-size:small;*font:x-small;font-size:77%;font-family:verdana,arial,helvetica,clean,sans-serif;color:blue;text-decoration:underline;font-weight:bold;">Privacy Statement</a></li>
    <li><a href="http://www.cu.edu/ums/cof/faq.html" style="*font-size:small;*font:x-small;font-size:77%;font-family:verdana,arial,helvetica,clean,sans-serif;color:blue;text-decoration:underline;font-weight:bold;">College Opportunity Fund</a></li>
    <li><a href="https://www.cu.edu/" style="*font-size:small;*font:x-small;font-size:77%;font-family:verdana,arial,helvetica,clean,sans-serif;color:blue;text-decoration:underline;font-weight:bold;" class="lastchild">CU System</a></li>
  	<li> <span style="*font-size:small;*font:x-small;font-size:77%;font-family:verdana,arial,helvetica,clean,sans-serif;color:blue;text-decoration:underline;font-weight:bold;" class="lastchild">
	
<a id="ctl00_explitLogout_ExplicitLogin" href="http://www.cudenver.edu/Academics/_layouts/Authenticate.aspx?Source=%2FAcademics%2FPages%2Fdefault%2Easpx" style="display:block;">Sign In</a>
</span></li>
  </ul>
  <p style="font-size:80%">&copy;2006 <a href="http://www.cu.edu/regents" style="font-size:100%;font-family:verdana;color:blue;">The Regents of the University of Colorado</a>, a body corporate. 
    All rights reserved. All trademarks are registered property of the University. Used by permission only.</p>
  <!-- end: your content here -->
</div>
							
      
      
      
    
<div>

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWFwKezvDLAQKL64L0BwLY0tyEDAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAKs4P+TCAL87cbADfU+snZw2ibUC8+0J14sTa51pkdl" />
</div>

<script type="text/javascript">
//<![CDATA[
var __wpmExportWarning='This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.';var __wpmCloseProviderWarning='You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.';var __wpmDeleteWarning='You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.';//]]>
</script>
<script type="text/javascript" language="JavaScript" defer>
<!--
function S2C1F2767_Submit() {GoSearch(null,'ctl00_ctl08_S2C1F2767_InputKeywords',null,true,true,'ctl00_ctl08_SBScopesDDL','ctl00_ctl08_ctl00',null,null,'\u002fsearch\u002fResults.aspx', 'This Site','This List', 'This Folder', 'Related Sites', '\u002fAcademics\u002f_layouts\u002fOSSSearchResults.aspx');}
// -->
</script><script type="text/javascript" language="JavaScript" >
// append an onload event handler
var S2C1F2767__onload= document.body.onload;
if(typeof document.body.onload == 'function')
{
 document.body.onload = function()
 {
S2C1F2767__onload();        
  document.getElementById('ctl00_ctl08_S2C1F2767_InputKeywords').name = 'InputKeywords';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S2C1F2767__onload);        
  document.getElementById('ctl00_ctl08_S2C1F2767_InputKeywords').name = 'InputKeywords';
 }
}

function S2C1F2767_OSBEK(event1) { 
var kCode = String.fromCharCode(event1.keyCode);
if(kCode == "\n" || kCode == "\r")
{   
S2C1F2767_Submit();
}
}
// -->
</script><SCRIPT LANGUAGE='JavaScript' >
<!--
WPSC.Init(document);
var varPartWPQ1 = WPSC.WebPartPage.Parts.Register('WPQ1','00000000-0000-0000-0000-000000000000',document.all.item('WebPartWPQ1'));
WPSC.WebPartPage.WebURL = 'http:\u002f\u002fwww.cudenver.edu\u002fAcademics';
WPSC.WebPartPage.WebServerRelativeURL = '\u002fAcademics';

//-->
</SCRIPT></form>
	<script type="text/javascript" src="/javaScript Library/MOSSBugFixes/custom_activex_override.js"></script>
	

  </body>
</html>