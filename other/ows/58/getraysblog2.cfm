<!--- 
 Filename: getraysblog2.cfm
 Purpose: Get the index page from coldfusionjedi.com and save it
--->

<cfhttp method="get" url="http://www.coldfusionjedi.com" 
 file="raysblogindex.html" path="#expandPath('.')#" resolveurl="YES">

<cffile action="READ" variable="httpfile" 
		file="#expandPath('./raysblogindex.html')#">

<cfoutput>
#httpfile#
</cfoutput>


