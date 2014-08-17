<!---
Filename: office-convert.cfm
Author: John C. Bland II (jcbii)
Purpose: Converts a Word document to a PDF
--->

<!--- Convert Doc file to PDF and save it --->
<cfdocument format="pdf" overwrite="yes"
            filename="pdfs/MonthlyTimesheet.pdf"
            srcfile="#ExpandPath('samples\MonthlyTimesheet.doc')#" />
