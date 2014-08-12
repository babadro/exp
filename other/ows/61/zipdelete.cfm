<!--- 
 Filename: zipdelete.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./cfms.zip")>

<cfzip file="#zipFile#" action="list" name="files"> 

<cfdump var="#files#" label="Before Delete">

<cfzip file="#zipFile#" action="delete" entrypath="Execute.cfm"> 

<cfzip file="#zipFile#" action="list" name="files"> 

<cfdump var="#files#" label="After Delete">