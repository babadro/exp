<!--- 
 Filename: cfloopfile.cfm
 Author: Raymond Camden
 Purpose: Demonstrates file functions.
--->

<cfset theFile = expandPath("./filefuncs1.cfm")>

<!--- Loop over by line --->
<cfloop file="#theFile#" index="line">
	<cfoutput>#htmlEditFormat(line)#<br /></cfoutput>
</cfloop>

<p>
<hr/>
</p>

<!--- Loop over by chars --->
<cfloop file="#theFile#" index="block" characters="10">
	<cfoutput>#htmlEditFormat(block)#<br /></cfoutput>
</cfloop>
