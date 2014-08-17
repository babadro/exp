<!--- Empty string; the default end of the query SQL. --->
<cfset queryEnd="">
<cfquery name="team" datasource="cfdocexamples">
SELECT Emp_ID, FirstName, EMail
FROM Employees
<cfif sortcol neq "" or sortdir neq "">
order by #sortcol# #sortdir#
</cfif>
</cfquery>
<!--- Format the query so that the bind expression can use it. --->
<cfoutput>#serializeJSON(QueryConvertForGrid(team, page, pageSize))#
</cfoutput>