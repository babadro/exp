<!---
Name:        tree1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Basic tree
--->

<cfform name="main">
<cftree format="html" name="mytree">
    <cftreeitem display="Products" value="products" 
                expand="false">
        <cftreeitem display="ColdFusion" value="cf" 
                    parent="products" >
        <cftreeitem display="Dreamweaver" value="dw" 
                    parent="products" >
        <cftreeitem display="Flash" value="flash"     
                    parent="products" >
        <cftreeitem display="Other" value="other"
                    expand="false">
        <cftreeitem display="Alpha" value="alpha"
                    parent="other" >
</cftree>

</cfform>