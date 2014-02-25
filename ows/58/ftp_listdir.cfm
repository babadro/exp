<!--- 
 Filename: ftp_listdir.cfm
 Purpose: Do a simple FTP operation and show the files
--->

<!--- Connect to the Mozilla FTP server --->
<cfftp action="open" username="anonymous" password=""
server="ftp.mozilla.org" connection="moz" stopOnError="yes">

<cfftp connection="moz" action="changeDir" directory="/pub/mozilla.org">

<cfftp connection="moz" action="getCurrentDir" stopOnError="yes">

<cfoutput>
<p>
FTP Directory Listing of the following directory on Mozilla's directory: 
#cfftp.returnvalue#.
</p>
</cfoutput>

<!--- Get a list of files from the directory --->
<cfftp connection="moz" action="ListDir" directory="#cfftp.returnvalue#"
name="dirlist" stopOnError="Yes">
<hr>
<table border>
<tr>
<th>Name</th>
<th>Path</th>
<th>URL</th>
<th>Length</th>
<th>LastModified</th>
<th>Is Directory</th>
</tr>
<tr>
<!--- Output the results of the directory listing --->
<cfoutput query="dirlist">
<td>#dirlist.name#</td>
<td>#dirlist.path#</td>
<td>#dirlist.url#</td>
<td>#dirlist.length#</td>
<td>#dateFormat(dirlist.lastmodified)#</td>
<td>#dirlist.isDirectory#</td>
</tr>
</cfoutput>
</table>

<!--- close connection --->
<cfftp action="close" connection="moz" stopOnError="yes">
