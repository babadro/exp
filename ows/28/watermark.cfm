<!---
Filename: watermark.cfm
Author: John C. Bland II (jcbii)
Purpose: Adds a watermark from an image source
--->

<!--- Adds a watermark using an image --->
<cfpdf action="addwatermark" overwrite="yes" foreground="yes"
       destination="pdfs/comps-image-watermark.pdf"
       source="samples/comps.pdf" image="samples/watermark.png" />
