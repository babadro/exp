<!---
Module:         search1.cfm
Author:         Raymond Camden
Function:       Get all directors
--->

<cfset directors = ormExecuteQuery("from director")>

<cfdump var="#directors#">