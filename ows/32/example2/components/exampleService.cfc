<cfcomponent alias="ows.32.example2.components.exampleService">

	<cffunction name="getData" access="remote" returnType="query">
		<cfset var qData="">
		
		<cfquery name="qData" datasource="ows">
			select ACTORID, NAMEFIRST, NAMELAST, AGE
			from APP.ACTORS
		</cfquery>
		
		<cfreturn qData/>
	</cffunction>
	
	
	<cffunction name="save" access="remote">
		<cfargument name="actor"/>
		<cfset var qData="">
		
		<cfquery name="updateActor" datasource="ows">
			update APP.ACTORS
			set NAMEFIRST = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(actor.NAMEFIRST)#">
			, NAMELAST =  <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(actor.NAMELAST)#">
			, AGE =  <cfqueryparam cfsqltype="cf_sql_numeric"  value="#trim(actor.AGE)#">
			where ACTORID = <cfqueryparam cfsqltype="cf_sql_numeric"  value="#trim(actor.ACTORID)#">
		</cfquery>
	</cffunction>
	
</cfcomponent>