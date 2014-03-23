<cfcomponent output="false">
	
	<cfset this.name="OrangeWhipSite">
	<cfset this.sessionManagement=true>
	
	<cffunction name="onApplicationStart" output="false" returnType="void">
		<cfset APPLICATION.dataSource = "ows">
		<cfset APPLICATION.companyName = "Orange Whip Studios">
	</cffunction>
	
	<cffunction name="onRequestStart" output="false" returnType="void">
		<cfinclude template="ForceUserLogin.cfm">
	</cffunction>
	
</cfcomponent>