<!---
Filename: pdfform-read.cfm
Author: John C. Bland II (jcbii)
Purpose: Loads a pdf form and dumps the contents
--->

<!--- Loads a pdf into result var --->
<cfpdfform result="result" action="read"
           source="samples/Adobe Derby Timesheet.pdf" />
<!--- Dumps the pdf form contents --->
<cfdump var="#result#" />
