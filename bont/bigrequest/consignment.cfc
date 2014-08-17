<cfcomponent>

<cffunction name="getData" access="remote" output="false" >
	<cfargument name="page">
	<cfargument name="pageSize" >
	<cfargument name="gridSortColumn" >
	<cfargument name="gridSortDirection">
	
	<cfset var consignmentQuery = "">
	<cfquery name="consignmentQuery" datasource="bont">
		SELECT 
		  c.id AS id,
		  c.invoice AS invoice,
		  c.fact_arrival AS fact_arrival,
		  c.expect_arrival AS expect_arrival,
		  c.status_id AS status_id, c.note AS note,
		  (SELECT COUNT(*) FROM item WHERE item.consignment_id=c.id) AS item_quantity,
		  s.name_rus AS status_name 
		FROM consignment c
		  JOIN statuses s ON c.status_id=s.id
		<cfif gridsortcolumn neq "" and gridsortdirection neq "">
			order by #gridsortcolumn# #gridsortdirection#
		</cfif>
	</cfquery> 
	<cfreturn QueryConvertForGrid(consignmentQuery, page, pageSize)>
</cffunction> 

</cfcomponent>