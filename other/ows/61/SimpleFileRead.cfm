<!--- 
 Filename: SimpleFileRead.cfm
 Edited By: Nate Weiss (NMW)
 Purpose: Exhibits how to read and display the contents of a text file
--->

<!--- What is this file? --->
<cfset thisFile = expandPath(cgi.script_name)>
<!--- Read the contents of this file into a string variable --->
<cffile action="read" file="#thisFile#" variable="thisFileContent">
 
<!--- Display the value ---> 
<cfoutput>
The first 1000 characters of this file are:
<p/>
#htmlCodeFormat(left(thisFileContent, 1000))#
</cfoutput> 
