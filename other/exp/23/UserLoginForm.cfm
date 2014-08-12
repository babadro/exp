<cfinclude template="VarPassingFunctions.cfm">

<html>
<head><title>Please Log In</title></head>
<body onLoad="document.loginForm.userLogin.focus();">

<cfform action="#CGI.script_name#?#PassUrlVars()#" name="loginForm" method="post" preservedata="yes">
	<cfdump var="#form#">
	<cfdump var="#URL#">
	<cfoutput>#passFormVars("UserLogin,UserPassword")#</cfoutput>
	<input type="hidden" name="userLogin_required">
	<input type="hidden" name="userPassword_required">
	<table border="0">
		<tr><th colspan="2" bgcolor="silver">Please Log In</th></tr>
		<tr>
			<th>Username:</th>
			<td>
				<cfinput type="text" name="userLogin" size="20" value="" maxlength="100" required="yes" message="Please type your Username first.">
			</td>
		</tr>
		<tr>
			<th>Password:</th>
			<td>
				<cfinput type="password" name="userPassword" size="12" value="" maxlength="100" required="yes" message="Please type your Password first.">
				<input type="submit" value="Enter">
			</td>
		</tr>
	</table>
</cfform>


<body>
</html>