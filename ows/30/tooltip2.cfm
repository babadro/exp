<!---
Name:        tooltip2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: tooltip ajax example
--->

<cfloop index="x" from="1" to="5">

<cftooltip sourceForTooltip="tooltipcontent.cfm?id=#x#">
<cfoutput>
<p>
This is paragraph #x#. Mouse over the paragraph to get
interesting information about it.
</p>
</cfoutput>
</cftooltip>

</cfloop>