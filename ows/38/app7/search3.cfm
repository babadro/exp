<!---
Module:         search3.cfm
Author:         Raymond Camden
Function:       Search directors
--->

<cfparam name="form.search" default="">

<cfoutput>
<form action="search3.cfm" method="post">
<input type="text" name="search" value="#form.search#">
<input type="submit" value="Search">
</form>
</cfoutput>

<cfif len(form.search)>
    <cfset term = "%" & form.search & "%">
    <cfset directors =
	ormExecuteQuery("from director where
	                 firstname like ? or lastname like ?",
					 [term,term])>

    <cfdump var="#directors#">
</cfif>