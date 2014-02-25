<!--- 
 Filename: getraysblog.cfm
 Purpose: Get the index page from coldfusionjedi.com
--->

<cfhttp method="get" url="http://www.coldfusionjedi.com" resolveURL="yes">

<cfoutput>
#cfhttp.filecontent#
</cfoutput>
