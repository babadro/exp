<cfset ftpServer = "127.0.0.1">
<cfset username="foo">
<cfset password="moo">

<cfftp action="open" username="#username#" password="#password#"
server="#ftpServer#" connection="mycon" stopOnError="yes">

<!--- The file to put up. --->
<cfset localFile = getDirectoryFromPath(getCurrentTemplatePath()) & 
    getFileFromPath(getCurrentTemplatePath())>
    
<cfoutput><p>Moving up #localFile#</p></cfoutput>

<cfftp action="putfile" stopOnError="yes" connection="mycon" 
  localFile="#localFile#"
  remoteFile="#getFileFromPath(getCurrentTemplatePath())#"
  transfermode="autoDetect">

<cfoutput>
FTP Operation Return Value: #cfftp.returnValue#<br>
FTP Operation Successful: #cfftp.succeeded#<br>
FTP Operation Error Code: #cfftp.errorCode#<br>
FTP Operation Error Message: #cfftp.errorText#<br>
</cfoutput>

<cfftp action="close" connection="mycon" stopOnError="yes">
