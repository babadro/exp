<!---
Name:        multifile.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Multi-file uploader control.
--->

<form action="multifile.cfm" method="post">
<cffileupload name="files" maxfileselect="5" url="multiupload.cfm">
</form>
