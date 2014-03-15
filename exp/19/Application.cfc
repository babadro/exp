<cfcomponent output="false">

	<cfset THIS.name = "OWS19">
	
	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfset APPLICATION.appStarted = now()>
	</cffunction>
	
	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="appScope" required="true">
		<cflog file="#THIS.name#" text="Application ended after #dateDiff('n', arguments.appScope.appStarted, now())# minutes.">
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="boolean" output="true">
		
	</cffunction>
	
	<cffunction name="onRequestEnd" returnType="void" output="true">
	
	</cffunction>
	
	<cffunction name="onRequest" returnType="void" output="true">
	
	</cffunction>
	
	<cffunction name="onMissionTemplate" returnType="boolean" output="false">
		
	</cffunction>
</cfcomponent>