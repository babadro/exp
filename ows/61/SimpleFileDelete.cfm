<!--- 
 Filename: SimpleFileDelete.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Exhibits how to make a remove a file from the server's drive
--->

<!--- Create a file we can delete --->
<cfset newFile = expandPath("./tempFileToDelete.txt")>

<!--- Write it, even though it will be empty --->
<cffile action="write" file="#newFile#" output="">

<!--- Delete a file from the server's drive --->
<cffile action="delete" file="#newFile#">
<cfoutput>The file (#newFile#) has been deleted.</cfoutput>  
