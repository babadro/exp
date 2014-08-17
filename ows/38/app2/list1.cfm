<!--- 
Module:         list1.cfm
Author:         Raymond Camden
Function:       List all directors
--->

<cfset directors = entityLoad("director")>
<cfdump var="#directors#">