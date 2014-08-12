<cfsilent>
	<cfset helpdesk = createObject("Component","cfc.helpdesk")>
	<cfif isDefined("form.submit")>
		<!--- insert new record into database --->
		<cfset rc = helpdesk.submitIssue('#form.subject#','#form.name#','#form.email#','#form.body#')>
	</cfif>
	<cfset qGetIssues = helpdesk.getIssues()>
</cfsilent>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Help Desk System</title>
</head>

<body>
<h1>Help Desk</h1>
<!--- output the status of our helpdesk --->
<cfset helper = getGatewayHelper("Helpdesk")>
<cfset helpDeskStatus=helper.getStatusAsString()>
<cfoutput><p>The helpdesk is currently #helpDeskStatus#.</p></cfoutput>

<h2>Current Helpdesk issues</h2>
<cfform width="500" format="flash" height="200" preloader="true">
	<cfgrid name="grid" query="qGetIssues" appendkey="yes" griddataalign="left" gridlines="yes" rowheaderalign="left" colheaderalign="left" selectmode="browse" enabled="yes" visible="yes" format="flash" autowidth="true" height="180">
		<cfgridcolumn name="Subject" header="Subject">
		<cfgridcolumn name="Status" header="Status">
		<cfgridcolumn name="loggedby" header="Logged By">
		<cfgridcolumn name="DateLogged" header="Date Logged">
		<cfgridcolumn name="name" header="Assigned To">
	</cfgrid>
</cfform>
<h2>Add new issue</h2>
<cfform action="index.cfm?" method="post" name="issueForm" preloader="yes" format="flash" width="500" skin="halogreen" lang="en">
	<cfinput type="text" name="subject" label="Subject" required="yes">
	<cftextarea name="body" label="Description" height="100"></cftextarea>
	<cfinput type="text" name="name" label="Your name Address" required="yes">
	<cfinput type="text" name="email" label="Your Email Address" required="yes" validate="email">
	<cfinput type="submit" name="submit" value="Add" width="125">
</cfform>

</body>
</html>
