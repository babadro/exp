<cfparam name="attributes.roles" type="string" default="">
<cfif thisTag.executionMode EQ "Start">
	<cflogin>
		<cfif thisTag.HasEndTag>
			<cfexit method="ExitTag">
		<cfelse>
			<cflocation url="login/ForceUserLogin.cfm" addtoken="No">
		</cfif>
	</cflogin>
	
	<cfif len(trim(attributes.roles)) GT 0>
		<cfset inRole = "FALSE">
		<cfif isUserInAnyRole(attributes.roles)><cfset inRole = true></cfif>
		<cfif not inRole>
			<cfif thisTag.hasEndTag>
				<cfexit method="ExitTag">
			<cfelse>
				<cfoutput>You need a privileges/</cfoutput>
				<cflocation url="login/ForceUserLogin" addtoken="No">
			</cfif>
		</cfif>
	</cfif>
</cfif>