<!--- 
 Filename: ftp_getfile.cfm
 Purpose: Do a simple FTP operation and get a file
--->

<cfftp action="open" username="anonymous" password=""
server="ftp.mozilla.org" connection="moz" stopOnError="yes">

<cfftp connection="moz" action="changeDir" directory="/pub/mozilla.org">

<cfftp connection="moz" action="GetFile"
 localfile= "#getDirectoryFromPath(getCurrentTemplatePath())#/welcome.txt"
 remotefile="README" stopOnError="No"
 transfermode="BINARY" failIfExists="No">

<cfoutput>
FTP Operation Return Value: #cfftp.returnValue#<br>
FTP Operation Successful: #cfftp.succeeded#<br>
FTP Operation Error Code: #cfftp.errorCode#<br>
FTP Operation Error Message: #cfftp.errorText#<br>
</cfoutput>
