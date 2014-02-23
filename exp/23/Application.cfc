<cfcomponent output="false">
	<cfset this.name="OrangeWhipSite">
	<cfset this.sessionManagement=true>
	
	
	<cffunction name="onApplicationStart" output="false" returnType="boolean">
		<cfset APPLICATION.dataSource = "ows">
		<cfset APPLICATION.companyName = "Orange Whip Studios">
		<cfreturn True>
	</cffunction>
	
	<cffunction name="onRequestStart" output="false" returnType="void">
		<cfinclude template="ForceUserLogin.cfm">
	</cffunction>
</cfcomponent>