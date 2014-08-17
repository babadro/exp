<!--- 
Module:         listonedirector.cfm
Author:         Raymond Camden
Function:       Create a new director and get it.
--->

<cfset d = entityNew("director")>
<cfset d.setFirstName("Scott")>
<cfset d.setLastName("Stroz")>
<cfset entitySave(d)>

<cfset idtoload = entityLoad("director",d.getDirectorId())>
<cfdump var="#idtoload#">

<cfset idtoload2 = entityLoad("director",d.getDirectorId(),true)>
<cfdump var="#idtoload2#">