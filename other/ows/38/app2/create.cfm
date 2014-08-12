<!--- 
Module:         create.cfm
Author:         Raymond Camden
Function:       Create a new director entity.
--->

<cfset d = entityNew("director")>
<cfdump var="#d#" label="New Director">