<!---
Module:         search4.cfm
Author:         Raymond Camden
Function:       Search directors
--->

<cfparam name="form.search" default="">

<cfoutput>
<form action="search4.cfm" method="post">
<input type="text" name="search" value="#form.search#">
<input type="submit" value="Search">
</form>
</cfoutput>

<cfif len(form.search)>
    <cfset term = "%" & form.search & "%">
    <cfset directors =
    ormExecuteQuery("from director where
                     firstname like :name or lastname like :name",
                     {name=term})>

    <cfdump var="#directors#">
</cfif>