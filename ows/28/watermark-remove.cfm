<!---
Filename: watermark-pdf.cfm
Author: John C. Bland II (jcbii)
Purpose: Removes watermark
--->

<!-- Removes watermark -->
<cfpdf action="removewatermark" overwrite="yes"
       source="pdfs/comps-image-watermark.pdf"
       destination="pdfs/comps-image-watermark-removed.pdf" />