<!---
Filename: pdfform-pdf-post.cfm
Author: John C. Bland II (jcbii)
Purpose: Loads and populates a PDF form with xml data and handles
         the submission
--->

<!--- Check if the PDF scope exists --->
<cfif isDefined("PDF")>
   <!--- Read the PDF contents into a variable --->
   <cfpdfform action="read" source="#PDF.content#" result="timesheet" />
   <!--- Dump the contents of the PDF variable --->
   <cfdump var="#timesheet#" />
<cfelse>
   <!--- Prepopulate form data and display --->
   <cfpdfform action="populate"
              source="samples/Adobe Derby Timesheet - PDF Post.pdf"
              xmldata="data/pdfform-data.xml" />
</cfif>
