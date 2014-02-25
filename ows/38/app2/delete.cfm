<!---
Module:         delete.cfm
Author:         Raymond Camden
Function:       Creates and then deletes a director
--->

<cfif not structKeyExists(url, "id")>

    <cfset d = entityNew("director")>

	<cfset d.setFirstName("Doomed")>
	<cfset d.setLastName("Man")>

	<cfset entitySave(d)>

	<cfdump var="#d#" label="Director entity after it was saved.">

    <cfoutput>
    <a href="delete.cfm?id=#d.getDirectorId()#">Delete me!</a>
    </cfoutput>

<cfelse>

    <cfset toDie = entityLoadByPk("director", url.id)>
	<cfset entityDelete(toDie)>

	<p>
	Entity Deleted!
	</p>

</cfif>