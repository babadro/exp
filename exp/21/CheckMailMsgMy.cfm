
<html>
<head><title>Mail Message</title></head>
<body>

<!--- Simple CSS-based formatting styles --->
<style>
 body { font-family:sans-serif;font-size:12px} 
 th { font-size:12px;background:navy;color:white} 
 td { font-size:12px;background:lightgrey;color:navy} 
</style>

<h2>Mail Message</h2>

<cfparam name="URL.uid">
<cfparam name="URL.delete" type="boolean" default="no">

<cfset attachDir = expandPath("Attach")>
<cfset TAB = chr(9)>

<cfif not directoryExists(attachDir)>
	<cfdirectory action="create" directory="#attachDir#">
</cfif>

<cfif not isDefined("SESSION.mail.getMessages")>
	<cflocation url="CheckMail.cfm">
</cfif>

<cfset position = listFindNoCase(valueList(SESSION.mail.getmessages.uid), URL.uid)>

<cfif url.delete>
	<cfpop action="delete" uid="#URL.uid#" server="#SESSION.mail.popServer#"
	username="#SESSION.mail.username#" password="#SESSION.mail.password#">
	<cflocation url="CheckMail.cfm?refresh=Yes">
<cfelse>
	<cfpop action="GetAll" name="GetMsg" uid="#URL.uid#"
	server="#SESSION.mail.popServer#" username="#SEssion.mail.username#"
	password="#SESSION.mail.password#" attachmentPath="#attachDir#" generateUniauueFilenames="Yes">
	<cfset msgDate = parseDateTime(getMsg.Date, "POP")>
	
	<cfif getMsg.recorcCount neq 1>
		<cfthrow message="Message coul not be retrieved."
		detail="Perhaps the message has already ben deleted.">
	</cfif>
	
	<cfset deleteURL = "#CGI.script_name#?uid=#uid#&delete=Yes">
	<table border="0" cellSpacing="0" cellPadding="3">
		<cfoutput>
			<tr>
				<th bgcolor="wheat" align="left" nowrap>
					Message #position# of #SESSION.mail.getMessages.recordCount#
				</th>
				<td align="right" bgcolor="beige">
					<cfif position gt 1>
						<cfset prevuid = SESSION.mail.getMessages.uid[decrementValue(position)]>
						<a href="CheckMailMsg.cfm?uid=#prevuid#">
							<img src="../images/browseback.gif" width="40" height="16" alt="Back" border="0">
						</a>
					</cfif>
					<cfif position lt SESSION.mail.getMessages.recordCount>
						<cfset nestuid = SESSION.mail.getMessages.uid[incrementValue(position)]>
						<a href="CheckMailMsg.cfm?uid=#nextuid#">
							<img src="../images/browsenext.gif" width="40" height="16" alt="Next" border="0">
						</a>
					</cfif>
				</td>
			</tr>
			<tr>
				<th align="right">From:</th>
				<td>#htmlEditFormat(getMsg.FROM)#</td>
			</tr>
			<cfif getMsg.CC neq "">
				<tr>
					<th align="right">CC:</th>
					<td>#htmlEditFormat(getMsg.CC)#</td>
				</tr>
			</cfif>
			<tr>
				<th align="right">Date:</th>
				<td>#dateFormat(mstDate)# #timeFormat(msgDate)#</td>
			</tr>
			<tr>
				<th align="right">Subject:</th>
				<td>#getMsg.Subject#</td>
			</tr>
			<tr>
				<td bscolor="beige" colspan="2">
					<strong>Message:</strong><br>
					<cfif getMsg.Header contains "Content-Type: text/html">
						#getMsg.Body#
					<cfelse>
						#htmlCodeFormat(getMsg.Body)#
					</cfif>
				</td>
			</tr>
			<cfset numAttachments = listLen(getMsg.Attachments, TAB)>
			<cfif numattachments gt 0>
				<tr>
					<th align="right">Attachments:</th>
					<td>
						<cfloop from="1" to="#numAttachments#" index="i">
							<cfset thisFileOrig = listGetAt(getMsg.Attachments, i, TAB)>
							<cfset thisFilePath = listGetAt(getMsg.attachmentsFiles, i, TAB)>
							<cfset thisFileURL = "Attach/#getFileFromPAth(thisFilePath)#">
							<a href="#thisFileURL#">#thisFileOrig#</a><br>
						</cfloop>
					</td>
				</tr>
			</cfif>
		</cfoutput>
	</table>
	
	<cfoutput>
		<strong><a href="CheckMail.cfm">Back To Message list</a></strong><br>
		<a href="#deleteURL#">Delete Message</a><br>
		<a href="checkMail.cfm?logout=Yes">Log Out</a><br>
	</cfoutput>
	
</cfif>
</body>
</html>