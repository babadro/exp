<!--- 
 Filename: SimpleFileRename.cfm
 Edited By: Nate Weiss (NMW)
 Purpose:  Exhibits how to rename a file on the server's drive
--->

<!--- Create a file we can move --->
<cfset newFile = expandPath("./tempFileToRename.txt")>

<!--- Write it, even though it will be empty --->
<cffile action="write" file="#newFile#" output="">

<!--- renamed file name we will use --->
<cfset renamedFile = expandPath("./tempFileRenamed.txt")>

<!--- Rename a file on the server's drive --->
<cffile action="rename" source="#newFile#" destination="#renamedFile#">
<cfoutput>The file (#newFile#) has been renamed (#renamedFile#).</cfoutput>
