<!---
Name:        tooltip1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic tooltip
--->

<form>

<cftooltip tooltip="This will delete the record forever!">
<input type="button" value="delete">
</cftooltip>

<cfsavecontent variable="archivetext">
This will archive the data so that it can be<br />
restored later. This will <b>not</b> delete<br />
the record.
</cfsavecontent>

<cftooltip tooltip="#archivetext#">
<input type="button" value="archive">
</cftooltip>

</form>