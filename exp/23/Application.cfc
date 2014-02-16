<cfcomponent output="false">
	<cfset this.name="OrangeWhipSite">
	<cfset this.sessionManagement=true>
	<cfset this.datasource="ows">
	
	<cffunction name="onApplicationStart" output="false" returnType="void">
		<cfset application.companyName = "Orange Whip Studios">
	</cffunction>
	<cffunction name="onRequestStart" output="false" returnType="void">
		<cfif not isDefined("session.auth.isLoggedIn")>
			<cfif isDefined("form.UserLogin")>
				<cfinclude template="loqinCheck.cfm">
			</cfif>
			
			<cfinclude template="loginForm.cfm">
			<cfabort>
		</cfif>
	</cffunction>
</cfcomponent>