<cfcomponent output="false">
	
	<cfset this.name="OrangeWhipSite">
	<cfset this.sessionmanagement=true>
	
	<cffunction name="onApplicationStart" returnType="void" output="false">
		<cfset APPLICATION.companyName="Orange Whip Studios">
		<cfset APPLICATION.dataSource="ows">
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="void" output="false">
		<cfinclude template="ForceUserLogin.cfm">
	</cffunction>
	
</cfcomponent>