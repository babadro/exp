<!--- 
 Filename: SimpleFileMove.cfm
 Edited By: Nate Weiss (NMW)
 Purpose: Exhibits how to move a file from one 
       location to another on the server's drives
--->

<!--- Create a file we can move --->
<cfset newFile = expandPath("./tempFileToMove.txt")>

<!--- Write it, even though it will be empty --->
<cffile action="write" file="#newFile#" output="">

<!--- Get the dir one up --->
<cfset newLocation = expandPath("../")>

<!--- Move a file from one location to another --->
<cffile action="move" source="#newFile#" destination="#newLocation#">
<cfoutput>The file (#newFile#) has been moved (#newLocation#).</cfoutput>  
