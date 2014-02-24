<cflogin>
	<cfif not (isDefined("FORM.userLogin") and isDefined("FORM.userPassword"))>
		<cfinclude template="UserLoginForm.cfm">
		<cfabort>
	<cfelse>
		<cfquery name="getUser" dataSource="#APPLICATION.dataSource#">
			SELECT COntactID, FirstName, rTrim(UserRoleName) as UserRoleName
			FROM Contacts LEFT OUTER JOIN UserRoles
			ON Contacts.UserRoleID = UserROles.UserRoleID
			WHERE UserLogin= '#FORM.UserLogin#'
			AND UserPassword = '#FORM.UserPassword#'
		</cfquery>
		<cfif getUser.recordCount eq 1>
			<cfloginuser name = "#getUser.ContactID#,#getUser.FirstName#" password="#Form.userPassword#" roles="#getUser.userRoleName#">
		<cfelse>
			Password and username are invalid.
			<cfinclude template="UserLoginForm.cfm">
			<cfabort>
		</cfif>
	</cfif>
</cflogin>