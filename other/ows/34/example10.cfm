<!---
Name:        example10.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: PowerPoint support
--->

<cfset htmlversion = expandPath("./htmlversion")>
<cfif not directoryExists(htmlversion)>
	<cfdirectory action="create" directory="#htmlversion#">
</cfif>

<cfpresentation title="PowerPoint Presentation" overwrite="true"
                autoPlay="false" directory="#htmlversion#" format="html">

    <cfpresenter name="Raymond Camden" 
    email="ray@camdenfamily.com"
    title="ColdFusion Jedi Master"
    image="ray.jpg" logo="logo.jpg"
    biography="Raymond likes ColdFusion">

    <cfpresentationslide title="Welcome to Not-PowerPoint">
    <cfoutput>
    <h1>PowerPoint Support</h1>

    <p>
	One of the many new, and cool, features of ColdFusion 9. By the way, 
    here is a bit of randomness just for the heck of it: #randRange(1,1000)#
	</p>
    </cfoutput>
    </cfpresentationslide>

    <cfpresentationslide src="#expandPath('./my.ppt')#" slides="2" 
    presenter="Raymond Camden" />
	
</cfpresentation>

<p>
Done.
</p>