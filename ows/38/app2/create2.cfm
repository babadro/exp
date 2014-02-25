<!--- 
Module:         create2.cfm
Author:         Raymond Camden
Function:       Create a new director entity and modify it.
--->

<cfset d = entityNew("director")>
<cfdump var="#d#" label="New Director">

<cfset d.setFirstName("Raymond")>
<cfset d.setLastName("Vader")>

<cfdump var="#d#" label="Modified Director">

