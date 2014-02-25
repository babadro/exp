<!--- 
 Filename: ziplist.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./cfms.zip")>

<cfzip file="#zipFile#" action="list" name="files"> 

<cfdump var="#files#">