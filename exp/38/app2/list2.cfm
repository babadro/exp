<!--- 
Module:         list2.cfm
Author:         Raymond Camden
Function:       List all directors (nicely!)
--->

<cfset directors = entityLoad("director")>
<cfloop index="director" array="#directors#">
    <cfoutput>
    #director.getLastName()#, #director.getFirstName()#<br/>
	</cfoutput>
</cfloop>