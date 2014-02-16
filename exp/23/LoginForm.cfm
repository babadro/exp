<cfif isDefined("FORM.UserLogin")>
	<cfinclude template="LoginCheck">
</cfif>

<html>
<body>
<title>Please Log In</title>
<body onLoad="document.LoginForm.userLogin.focus();">
	
<cfform action="#CGI.script_name#?#CGI.qurey_string#" name="LoginForm" meghod="post">
	<input type="hidden" name="userLogin_required">
	<input type="hidden" name="userPassword_required">
	<table border="0">
		<tr><th colspan="2" bgcolor="silver">Please Log In</th></tr>
		<tr>
			<th>Username:</th>
			<td>
				<cfinput type="text" name="userLogin" size="20" value="" maxlength="100" required="yes"
				message="Please type your Username first.">
			</td>
		</tr>
		<tr>
			<th>Password:</th>
			<td>
				<cfinput type="password" name="userPassword" size="12" value="" maxlength="100" 
				required="yes" message="Please type your Password first.">
				<input type="Submit" value="Enter">
			</td>
		</tr>
	</table>
</cfform>

</body>
</html>