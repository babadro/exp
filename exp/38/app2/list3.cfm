<!--- 
Module:         list3.cfm
Author:         Raymond Camden
Function:       Find all the Vaders!
--->

<cfset vaderpeeps = entityLoad("director", {lastname='Vader'})>
<cfdump var="#vaderpeeps#">