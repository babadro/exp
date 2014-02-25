<!--- 
 Filename: ftp1.cfm
 Purpose: Do a simple FTP operation
--->

<cfftp action="open" username="anonymous" password=""
server="ftp.mozilla.org" connection="mozilla" stoponerror="No">

<cfif cfftp.succeeded>

  <cfoutput>
  FTP Operation Successful: #cfftp.succeeded#<br>
  FTP Return Value: <pre>#cfftp.returnValue#</pre>
  </cfoutput>
  <cfftp action="close" connection="mozilla" stoponerror="No">  

<cfelse>

  <cfoutput>
  FTP Error Code: #cfftp.errorCode#<br>
  FTP Error Text: #cfftp.errorText#<br>
  </cfoutput>

</cfif>
