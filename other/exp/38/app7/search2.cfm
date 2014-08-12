<!---
Module:         search2.cfm
Author:         Raymond Camden
Function:       Search directors
--->

<cfparam name="form.search" default="">

<cfoutput>
<form action="search2.cfm" method="post">
<input type="text" name="search" value="#form.search#">
<input type="submit" value="Search">
</form>
</cfoutput>

<cfif len(form.search)>
    <cfset directors =
	ormExecuteQuery("from director where
	                 firstname like '%#form.search#%' or lastname like '%#form.search#%'")>

    <cfdump var="#directors#">
</cfif>