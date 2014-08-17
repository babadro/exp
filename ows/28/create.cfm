<!---
Filename: create.cfm
Author: John C. Bland II (jcbii)
Purpose: Uses cfdocument to create custom content and saves a pdf
--->

<!--- Create a custom in-memory pdf --->
<cfdocument name="cover" format="PDF">
	<h1>PDF created from <i>cfdocument</i></h1>
	<h3><cfoutput>#DateFormat(now(),"mm/dd/yyyy")#</cfoutput></h3>
</cfdocument>

<!--- Write the PDF to disk --->
<cfpdf action="write" source="cover" overwrite="yes"
       destination="pdfs/create.pdf" />
