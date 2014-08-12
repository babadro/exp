<!--- 
 Filename: zipread.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./cfms.zip")>

<cfzip file="#zipFile#" action="read" entrypath="Execute.cfm"
	   variable="data"> 

<cfoutput>#htmlCodeFormat(data)#</cfoutput>