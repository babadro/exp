<!---
Filename: read.cfm
Author: John C. Bland II (jcbii)
Purpose: Reads a pdf and dumps the contents
--->

<!--- Read the PDF file created from createmetapdf.cfm --->
<cfpdf name="doc" action="read" source="pdfs/create-meta.pdf" />
<!--- Dump PDF contents --->
<cfdump var="#doc#" />
