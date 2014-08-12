<cfcomponent hint="OWS movie database access">
	<cffunction name="browse" access="remote" returntype="struct" hint="Browse methos for Ajax grid">
		<cfargument name="page" type="numeric" required="yes">
		<cfargument name="pageSize" type="numeric" required="yes">
		<cfargument name="gridsortcolumn" type="string" default="">
		<cfargument name="gridsortdir" type="string" required="no" default="">
		
		<cfset var movies="">
		
		<cfquery datasource="bont" name="numbers">
			SELECT buyer_company_id, buyer_people_id, consignment_id FROM item
			<cfif ARGUMENTS.gridsortcolumn NEQ "" and ARGUMENTS.gridsortdir NEQ "">
				ORDER BY #ARGUMENTS.gridsortcolumn# #ARGUMENTS.gridsortdir#
			</cfif>
		</cfquery>
		
		<cfreturn QueryConvertForGrid(numbers, ARGUMENTS.page, ARGUMENTS.pageSize)>
	</cffunction>
</cfcomponent>