<cfif isDefined("Form.popServer")>
	<cfset SESSION.mail = structNew()>
	<cfset SESSION.mail.popServer = FORM.popServer>
	<cfset SESSION.mail.username = FORM.username>
	<cfset SESSION.mail.password = FORM.password>
	
	<cfset CLIENT.mailServer = FORM.popServer>
	<cfset CLIENT.mailUsername = FORM.username>
<cfelse>
	<cfparam name="CLIENT.mailServer" type="string" default="">
	<cfparam name="CLIENT.mailUsername" type="string" default="">
	
	<cfform action="#CGI.script_name#" method="post">
		<p>Provide data<br>
		
		<p>mail Server:</p>
		<cfinput type="text" name="popServer" value="#CLIENT.mailServer#" required="Yes"
		message="Please provide your mail server.">
		(example: pop.yourcompany.com)<br>
		
		Mailbox Username:<br>
		<cfinput type="text" name="username" value="CLIENT.mailusername" required="Yes"
		message="Please provide you username">
		(yourname@youcompany.com)<br>
		
		Mailbox Password:<br>
		<cfinput type="text" name="password" required="yes"
		message="Please provide your password."><br>
		
		<cfinput type="submit" name="submit" value="Check Mail"><br>
	</cfform>
	
	</body></html>
	<cfabort>
	
</cfif>