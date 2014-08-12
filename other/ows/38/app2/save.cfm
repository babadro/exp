<!--- 
Module:         save.cfm
Author:         Raymond Camden
Function:       Create a new director entity and save it
--->

<cfset d = entityNew("director")>

<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader")>

<cfdump var="#d#" label="Modified Director">

<cfset entitySave(d)>

<cfdump var="#d#" label="Director entity after it was saved.">
