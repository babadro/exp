<!--- 
 Filename: fileinfo.cfm
 Author: Raymond Camden
 Purpose: Demonstrates fileInfo.
--->

<cfset info = getFileInfo(expandPath("./filefuncs1.cfm"))>

<table border="1">
	<tr>
		<th>Property</th>
		<th>Value</th>
	</tr>
	<cfloop item="key" collection="#info#">
	<tr>
		<cfoutput>
		<td>#key#</td>
		<td>#info[key]#</td>
		</cfoutput>
	</tr>
	</cfloop>
</table>