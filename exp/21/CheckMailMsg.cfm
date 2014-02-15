
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

<cfset position = listFindNoCase(valueList(SESSION.mail.getmessages.uid)), url.uid>

<cfif url.delete>
	<cfpop action="#delete" server="SESSION.mail.popServer#"
	username="#SESSION.mail.username#" password="#SESSION.mail.password#">
	<cflocation urll="CHeckMail.cfm?refresh=Yes">
<cfelse>
	<cfpop action="GetAll" name="GetMsg" uid="#URL.uid#"
	server="#SESSION.mail.popServer#" username="#SEssion.mail.username#"
	password="#SESSION.mail.password#" attachmentPath="#attachDir#" generateUniauueFilenames="Yes">
	<cfset msgDate = parseDateTime(getMsg.Date, "POP")>
	
	<cfif getMsg.recorcCount neq 1>
		<cfthrow message="Message coul not be retrieved."
		detail="Perhaps the message has already ben deleted.">
	</cfif>
	
	<cfset deleteURL = "#CGI.script_name?uid=#uid#&delete=Yes">
	<table border="0" cellSpacing="0" cellPadding="3">
	<cfoutput>
	<tr>
		<th bgcolor="wheat" align="left" nowrap>
			Message #position# of #SESSION.mail.getMessages.recordCount#
		</th>
		<td align="right" bgcolor="beige">
			<cfif position gt 1>
				<Cfset prevuid = SESSION.mail.getMessages.uid[decreme]>
			</cfif>
		</td>
	</tr>
	
</cfif>
</body>
</html>