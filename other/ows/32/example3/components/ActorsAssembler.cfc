<cfcomponent output="false">

	<cffunction name="fill" output="no" returntype="ACTORS[]" access="remote">
		<cfargument name="param" type="string" required="no">

		<cfreturn EntityLoad("ACTORS")>
	</cffunction>
	

	<cffunction name="count" output="no" returntype="Numeric" access="remote">
		<cfargument name="param" type="string" required="no">

		<cfset count = ORMExecuteQuery("select count(*) from ACTORS")>
		<cfreturn count>
	</cffunction>
	

	<cffunction name="get" output="no" returnType="ACTORS" access="remote">
		<cfargument name="uid" type="struct" required="yes">
		<cfset key = uid.ACTORID>
		<cfreturn EntityLoad("ACTORS", uid, true)>
	</cffunction>


	<cffunction name="sync" output="no" returnType="array" access="remote">
		<cfargument name="changes" type="array" required="yes">

		<!-- array for the returned changes -->
		<cfset var newchanges=ArrayNew(1)>

		<!-- Loop over the changes and apply them --->
		<cfloop from="1" to="#ArrayLen(changes)#" index="i" >
			<cfset co = changes[i]>
			<cfif co.isCreate() or  co.isUpdate()>
				<cfset co.setNewVersion( ORMGetSession().merge(co.getNewVersion()) )>
				<cfset co.processed()>
			<cfelseif co.isDelete()>
				<cfset EntityDelete(co.getPreviousVersion())>
				<cfset co.processed()>
			</cfif>
			<cfset ArrayAppend(newchanges, co)>
		</cfloop>

		<!-- Return the change objects, as this is how success or failure is indicated --->
		<cfreturn newchanges>
	</cffunction>

</cfcomponent>