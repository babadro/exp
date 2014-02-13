<html>
<head><title>Check Your Mail</title></head>
<body>

<style>
	body { font-family:sans-serif;font-size:12px}
	th { font-size:12px;background:navy;color:white}
	td { font-size:12px;background:lightgrey;color:navy}
</style>
<h2>Check Your Mail</h2>

<cfif isDefined("url.logout") or isDefined("form.popServer")>
	<cfset structDelete(session, "mail")>
</cfif>

<cfif not isDefined("session.mail")>
	<cfinclude template="checkMailLogin.cfm">
</cfif>

<cfif not isDefined("session.mail.getMessages") or isDefined("url.refresh")>
	<cfflush>
	<cfpop action="GetHeaderOnly" name="session.mail.getMessages" server="#session.mail.popServer#"
	username="#session.mail.username#" password="#session.mail.password#" maxrows="50">
</cfif>

<cfif session.mail.getMessage.recordCount eq 0>
	<p>You have no mail messages at this time.<br>
<cfelse>
	<table border="0" cellSpacing="2" cols="3" width="550">
		<tr>
			<th width="100">Date Sent</th>
			<th width="200">From</th>
			<th width="200">Subject</th>
		</tr>
		<cfoutput query="session.mail.getMessages">
			<cfset msgDate = parseDateTime(date, "pop")>
			<cfset linkURL = "CheckMailMsg.cfm?uid=#urlEncodedFormat(uid)#">
			<tr valign="baseline">
				<td>
					<strong>#dateFormat(msgDate)#</strong><br>#timeFormat(msgDate)# #ReplyTo#
				</td>
				<td>#htmlEditFormat(From)#</td>
				<td><strong><a href="#linkURL#">#Subject#</a></strong></td>
			</tr>
		</cfoutput>
	</table>
</cfif>
<strong><a href="CheckMail.cfm?Refresh=Yes">Refresh Message List</a></strong><br>
<a href="CheckMail.cfm?Logout=Yes">Log Out</a><br>
</body>
</html>