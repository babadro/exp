<!---
Filename: pdfform-http-post.cfm
Author: John C. Bland II (jcbii)
Purpose: Loads a PDF form and dumps the form post
--->

<!--- Check if the form1 property exists in the form struct --->
<cfif StructKeyExists(form, "form1")>
   <!--- Dump the contents of the form submission --->
   <cfdump var="#form#" />
<cfelse>
   <!--- Prepopulate form data and show in the browser --->
   <cfpdfform action="populate"
              source="samples/Adobe Derby Timesheet - HTTP Post.pdf"
              xmldata="data/pdfform-data.xml" />
</cfif>
