<!---
Module:         update.cfm
Author:         Raymond Camden
Function:       Create a new director entity and save it
--->

<cfset d = entityNew("director")>

<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader")>

<cfset entitySave(d)>

<cfdump var="#d#" label="Director entity after it was saved.">

<cfset d.setFirstName("Todd")>
<cfset d.setLastName("Sharp")>

<cfdump var="#d#" label="Director entity after it was updated.">
