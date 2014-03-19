<cfcomponent output="false">
	<cfset THIS.name="ows19">
	
	<cffunction name="onApplicationStart" returntype="boolean" output="false">
		<cfset AppStarted=now()>
		<cfreturn True>
	</cffunction>
	
	<cffunction name="onApplicationEnd" returntype="void" output="false">
		<cfargument name="AppScope" required="true">
		<cflog file="#this.name#" text="App ended after #dateDiff('n', arguments.AppScope.AppStarted, now())# minutes.">
	</cffunction>
	
	<cffunction name="onRequrestStart" returntype="boolean" output="true">
		
	</cffunction>
	
	<cffunction name=>
	
	</cffunction>
	
	<cffunction name=>
	
	</cffunction>
	
	<cffunction name=>
	
	</cffunction>
	
	<cffunction name=>
	
	</cffunction>
	
</cfcomponent>