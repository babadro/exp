<!--- 
 Filename: zip.cfm
 Edited By: Raymond Camden
--->

<cfset zipFile = expandPath("./cfms.zip")>
<cfset source = expandPath(".")>

<cfzip file="#zipFile#" action="zip" source="#source#" filter="*.cfm"> 