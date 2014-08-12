<!---
Filename: portfolio.cfm
Author: John C. Bland II (jcbii)
Purpose: Creates a PDF portfolio
--->

<!--- Create a PDF portfolio --->
<cfpdf action="merge" overwrite="yes"
       destination="pdfs/portfolio.pdf">
  <cfpdfparam source="samples/MonthlyTimesheet.doc" />
	<cfpdfparam source="samples/watermark.docx" />
	<cfpdfparam source="samples/Sample.html" />
	<cfpdfparam source="samples/title.pdf" />
	<cfpdfparam source="samples/cfkit_en.pdf" />
</cfpdf>