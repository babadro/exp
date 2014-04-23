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

<cffunction name="editData" access="remote" output="false">
<cfargument name="gridaction">
<cfargument name="gridrow">
<cfargument name="gridchanged">
<cfif isStruct(gridrow) and isStruct(gridchanged)>
<cfif gridaction eq "U">
<cfset colname=structkeylist(gridchanged)>
<cfset value=structfind(gridchanged,#colname#)>
<cfquery name="team" datasource="cfdocexamples">
update employees set <cfoutput>#colname#</cfoutput> =
'<cfoutput>#value#</cfoutput>'
where Emp_ID = <cfoutput>#gridrow.Emp_ID#</cfoutput>
</cfquery>
<cfelse>
<cfquery name="team" datasource="cfdocexamples">
delete from employees where emp_id = <cfoutput>#gridrow.Emp_ID#
</cfoutput>
</cfquery>
</cfif>
</cfif>
</cffunction>
</cfcomponent>