<!---
Name:        example4.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Presentation with external content
--->

<cfpresentation title="Embedding Stuff!" showNotes="false"
                showSearch="false">

   <cfpresentationslide title="A Flash Slide" 
   src="SimpleSearchMovie.swf" />

   <cfpresentationslide title="A CFM Slide" 
   src="slide.cfm" />

   <cfpresentationslide title="An external URL" 
   src="http://127.0.0.1/ows/34/slide2.cfm" />

</cfpresentation>