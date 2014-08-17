<!---
Name:        example6.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Presentation with presentors
--->

<cfpresentation title="Presenting Presenters!">

  <cfpresenter name="Raymond Camden" 
               email="ray@camdenfamily.com"
               title="ColdFusion Jedi Master"
               image="ray.jpg" logo="logo.jpg"
               biography="Raymond likes ColdFusion">

  <cfpresenter name="Boring Guy" title="Nothing Important"
               biography="This guy hasn't done anything.">
			   
   <cfpresentationslide title="Slide 1" 
   presenter="Raymond Camden">
   <p>
   This is slide one. It is associated with
   Ray.
   </p>
   </cfpresentationslide>

   <cfpresentationslide title="Slide 2" 
   presenter="Boring Guy">
   <p>
   This is slide two. It is associated with
   Boring Guy.
   </p>
   </cfpresentationslide>

   <cfpresentationslide title="Slide 3" 
   presenter="Raymond Camden">
   <p>
   This is slide three. It is associated with
   Ray again.
   </p>
   </cfpresentationslide>

</cfpresentation>