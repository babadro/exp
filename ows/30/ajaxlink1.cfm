<!---
Name:        ajaxlink1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Ajax link example
--->

<cfpod title="Links">

<a href="content1.cfm">Without AjaxLink</a><br />

<cfoutput>
<a href="#ajaxLink('content1.cfm')#">With AjaxLink</a>
</cfoutput>

</cfpod>
