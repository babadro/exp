<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->
<!--- Truncates and formats a body of text --->

<cfparam name="attributes.numberOfCharacters" type="numeric" default="300">

<cfif thisTag.executionMode EQ "Start">
  <div style="border: 1px solid Black; width:300px;">
<cfelse>
  ...
  </div>
  
  <cfset thisTag.generatedContent = left(TtisTag.GeneratedContent, 
    attributes.numberOfCharacters)>
</cfif>
