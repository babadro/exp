<!---
Name:        multiupload.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Handle multiple uploads.
--->

<cffile action="uploadAll" destination="#getTempDirectory()#" />
<cflog file="ows" 
    text="Uploaded #cffile.serverdirectory#/#cffile.serverfile#">
