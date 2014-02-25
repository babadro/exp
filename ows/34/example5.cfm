<!---
Name:        example5.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Presentation with style
--->

<cfpresentation title="Designed Presentation" 
                autoPlay="false" backGroundColor="green"
                glowColor="red" lightColor="pink" 
                primaryColor="black" shadowColor="gray"
                textColor="blue">

   <cfpresentationslide title="Small Margins" 
   marginleft="50" marginRight="50"
   marginTop="200" marginBottom="200"
   >
<h1>This is why I don't design</h1>

<p>
See how bad these colors go together? This is why I 
don't do design work.
</p>
   </cfpresentationslide>

</cfpresentation>