<!---
Filename: watermark-pdf.cfm
Author: John C. Bland II (jcbii)
Purpose: Adds a watermark from a pdf source
--->

<!--- Adds a watermark using a pdf --->
<cfpdf action="addwatermark" source="samples/comps.pdf"
       destination="pdfs/comps-pdf-watermark.pdf"
       copyFrom="samples/watermark.pdf" overwrite="yes" opacity="10"
       foreground="yes" rotation="45" position="375,-275" />
