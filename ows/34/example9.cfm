<!---
Name:        example9.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: PowerPoint support
--->

<cfpresentation title="PowerPoint Presentation" 
                autoPlay="false">

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