<cfcomponent>
<cffunction name="getData" access="remote" output="false">
<cfargument name="page">
<cfargument name="pageSize">
<cfargument name="gridsortcolumn">
<cfargument name="gridsortdirection">
<cfquery name="team" datasource="cfdocexamples">
SELECT Emp_ID, FirstName, EMail
FROM Employees
<cfif gridsortcolumn neq "" or gridsortdirection neq "">
order by #gridsortcolumn# #gridsortdirection#
</cfif>
</cfquery>
<cfreturn QueryConvertForGrid(team, page, pageSize)>
</cffunction>
</cfcomponent>