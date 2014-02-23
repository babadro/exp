<cflogin>
	<cfif not(isDefined("FORM.userLogin") and isDefined("FORM.userPassword"))>
		<cfinclude template="UserLoginForm.cfm">
		<cfabort>
	<cfelse>
		<cfquery name="getUser" datasource="#APPLICATION.dataSource#">
			SELECT ContactID, FirstName, rTrim(UserRoleName) as UserRoleName
			FROM Contacts LEFT OUTER JOIN UserRoles
			ON Contacts.UserRoleID = UserRoles.UserRoleID
			WHERE UserLogin = '#FORM.UserLogin#'
			AND UserPassword = '#FORM.UserPassword#'
		</cfquery>
		
		<cfif getUser.recordCount eq 1>
			<cfloginuser name="#getUser.ContactID#,#getUser.FirstName#"
			password="#FORM.userPassword#"
			roles="#getUser.userRoleName#">
			
		<cfelse>
			Sorry, username and password are invalid.
			<cfinclude template="UserLoginForm.cfm">
			<cfabort>
		</cfif>
	</cfif>
</cflogin>