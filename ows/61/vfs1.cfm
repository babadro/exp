<!--- 
 Filename: vfs1.cfm
 Author: Raymond Camden
 Purpose: Demonstrates the virtual file system.
--->

<cfset myFile = "ram:///owsfiles/test.txt">
<cfset myFolder = getDirectoryFromPath(myFile)>

<cfif not directoryExists(myFolder)>
    <cfdirectory action="create" directory="#myFolder#">
</cfif>

<cfif not fileExists(myFile)>
    <cfoutput>
    <p>
	The file, #myFile#, is currently empty.<br/>
	Reload this page!
	</p>
	</cfoutput>
<cfelse>
    <cfset contents = fileRead(myFile)>
	<cfoutput>
	<pre>
	#contents#
	</pre>
    </cfoutput>
</cfif>

<!--- Append a text message to the file --->
<cffile action="append" file="#myFile#" output="Temp stuff written to file on #now()#">