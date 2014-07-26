<html>
<head></head>
<body>

<cfmenu name="mainHorizontMenu" bgcolor="yellow" selectedfontcolor="black" selecteditemcolor="white">
	<cfmenuitem display="Предстоящие" href="#CGI.script_name#?coming"/>
	<cfmenuitem display="Прошедшие" href="#CGI.script_name#?past"/>
	<cfmenuitem display="Экспертные оценки" href="#CGI.script_name#?expert_assesment"/>
	<cfmenuitem display="и еще...">
		<cfmenuitem display="Авторизация" href="#CGI.script_name#?autorization"/>
		<cfmenuitem display="Концепция" href="#CGI.script_name#?conception"/>
	</cfmenuitem>
</cfmenu>

<body>
<html>