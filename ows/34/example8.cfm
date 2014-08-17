<!---
Name:        example8.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: PowerPoint support
--->

<cfpresentation title="PowerPoint Presentation" 
                autoPlay="false">

	<cfpresentationslide src="#expandPath('./my.ppt')#" />
	
</cfpresentation>