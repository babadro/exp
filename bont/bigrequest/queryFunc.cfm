<cffunction name="makeListColumnValues" description="make list of values for any column of any table" >
	<cfargument name="colName" required="true" default="id">
	<cfargument name="tableName" required="true">
	<cfargument name="orderColumn" required="false">
	<!---
	<cfif isDefined("orderColumn")>
		<cfset var result = orderColumn>
	<cfelse>
		<cfset var result = "noOrderColumn">
	</cfif>
	---->
	
	<cfset var myQuery = "">
	<cfquery name="myQuery" datasource="bont">
		SELECT #colName# AS col FROM #tableName#
		<cfif isDefined("orderColumn")>ORDER BY #orderColumn#</cfif>
	</cfquery>
	
	<cfreturn valueList(myQuery.col)>
</cffunction>


<cfset listColorID = makeListColumnValues("id", "color", "id")>
<cfoutput>#listColorID#</cfoutput>
