<!--- 
 Filename: filefuncs1.cfm
 Author: Raymond Camden
 Purpose: Demonstrates file functions.
--->

<cfset fileToRead = expandPath("./SimpleFileWrite.cfm")>

<cfset fileOb = fileOpen(fileToRead)>

<cfdump var="#fileOb#">

<cfloop condition="not fileIsEOF(fileOb)">
	<cfset line = fileReadLine(fileOb)>
	<cfoutput>line: #htmlEditFormat(line)#<br /></cfoutput>
</cfloop>

<cfset fileClose(fileOb)>

<cfdump var="#fileOb#">