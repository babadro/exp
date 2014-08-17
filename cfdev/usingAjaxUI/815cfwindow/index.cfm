<html>
<head>
<!--- Callback handler puts text in the window.cfm callback div block. --->
<script language="javascript">
var mycallBack = function(){
document.getElementById("callback").innerHTML = "<br><br>
<b>This is printed by the callback handler.</b>";
}
<!--- The error handler pops an alert with the error code and message. --->
var myerrorHandler = function(errorCode,errorMessage){
alert("[In Error Handler]" + "\n\n" + "Error Code: " + errorCode + "\n\n" +
"Error Message: " + errorMessage);
}
</script>
</head>
<body>
<cfpod height="50" width="200" title="The Title" name="theTitle">
This is a cfpod control.
</cfpod><br>
<!--- Clicking the link runs a ColdFusion.navigate function that replaces the second window's
contents with windowsource.cfm. The callback handler then updates the window
contents further. --->
<cfwindow name="w1" title="CF Window 1" initShow=true
x=10 y=200 width="200">
This is a cfwindow control.<br><br>
<a href="javascript:ColdFusion.navigate('windowsource.cfm','w2',
mycallBack,myerrorHandler);">Click</a> to navigate Window 2</a>
</cfwindow>
<cfwindow name="w2" title="CF Window 2" initShow=true
x=250 y=200 width="200">
This is a second cfwindow control.
</cfwindow>
<cfform>
<!--- This button only replaces the second window body with the body of the
windowsrc.cfm page. --->
<cfinput type="button" name="button" value="Simple navigate"
onClick="ColdFusion.navigate('windowsource.cfm','w2');">
<!--- This button replaces the second window body and title content. --->
<cfinput type="button" name="button2" value="Change w2 body & title"
onClick="w2_body.innerHTML='New body inner HTML';w2_title.innerHTML=
'New Title inner HTML'">
<!--- This button puts the second window title in the pod body. --->
<cfinput type="button" name="button3" value="Change pod body"
onClick="theTitle_body.innerHTML=w2_title.innerHTML;">
</cfform>
</body>
</html>