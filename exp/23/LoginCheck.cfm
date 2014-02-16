<cfparam name="FORM.userLogin" type="string">
<cfparam name="FROM.userPassword" type="string">

<cfquery name="getUser" dataSource="#APPLICATION.dataSource#">
	SELECT ContactID, FirstName FROM Contacts
	WHERE UserLogin = '#FORM.UserLogin#' AND UserPassword = '#FORM.UserPassword#'
</cfquery>

<cfif getUser.recordCount eq 1>
	<cfset SESSION.auth = structNew()>
	<cfset SESSION.auth.isLoggedIn = "Yes">
	<cfset SESSION.auth.contactID = getUser.contactID>
	<cfset SESSION.auth.firstName = getUser.firstName>
	
	<cflocation url="#CGI.script_name#?#CGI.query_string#">
</cfif>