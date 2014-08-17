<!--- 
 Filename: unzip.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./cfms.zip")>
<cfset destination = expandPath("./extract")>

<cfif not directoryExists(destination)>
	<cfdirectory action="create" directory="#destination#">
</cfif>

<cfzip file="#zipFile#" action="unzip" destination="#destination#"> 