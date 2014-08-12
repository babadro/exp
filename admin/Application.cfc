<cfcomponent output="false">
	<cfset this.name = "SayFuture">
	<cfset this.sessionManagement = true>
	<cffunction name="onApplicationStart" output="false" returnType="void">
		<cfset APPLICATION.dataSource = "sayfuturedb">
	</cffunction>
	<cffunction name="onRequestStart" output="false" returnType="void">
		<cfinclude template="ForceUserLogin.cfm">
	</cffunction>
</cfcomponent>