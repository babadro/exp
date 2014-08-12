<!---
Name:        example3.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Dynamic presentation, self run
--->

<cfquery name="getMovies">
select  f.movietitle, f.pitchtext, f.amountbudgeted, 
        f.summary, f.imagename, f.dateintheaters,
        r.rating
from    films f, filmsratings r
where   f.ratingid = r.ratingid
</cfquery>

<cfpresentation title="Orange Whip Studios - Films" 
                autoPlay="true" loop="true" 
                control="brief">
   <cfpresentationslide title="Welcome to Orange Whip Studios">
<h1>Welcome to Orange Whip Studios</h1>

<p>
Here is the latest gallery of our films.
</p>
   </cfpresentationslide>

   <cfloop query="getMovies">
      <cfpresentationslide title="#movietitle#">

<cfoutput>
<h2>#movietitle#</h2>

<p>
<cfif len(trim(imagename))>
<img src="../images/#imagename#" align="right">
</cfif>
<b>Rating:</b> #rating#<br />
<b>Budget:</b> #dollarFormat(amountbudgeted)#<br />
<b>Date:</b> 
#dateFormat(dateintheaters,"mmmm d, yyyy")#<br />
<b>Pitch:</b> #pitchtext#
</p>

<p>
<b>Summary:</b> #summary#
</p>
</cfoutput>
		
      </cfpresentationslide>

   </cfloop>

</cfpresentation>
