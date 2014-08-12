<html>
<head></head>
<body>

<cfmenu name="mainHorizontMenu" bgcolor="yellow" selectedfontcolor="black" selecteditemcolor="white">
	<cfmenuitem display="Предстоящие" href="#CGI.script_name#?coming"/>
	<cfmenuitem display="Прошедшие" href="#CGI.script_name#?past"/>
	<cfmenuitem display="Концепция" href="#CGI.script_name#?conception"/>
	<cfmenuitem display="Авторизация" href="admin/index.cfm"/>
</cfmenu>

<cfoutput>#hash("baba_dro", "SHA-512")#</cfoutput>

<body>
<html>