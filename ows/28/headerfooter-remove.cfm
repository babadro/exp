<!---
Filename: headerfooter-remove.cfm
Author: John C. Bland II (jcbii)
Purpose: Removes a header and footer from a PDF
--->

<!--- Remove headers and footers --->
<cfpdf action="removeheaderfooter" overwrite="yes"
       source="pdfs/comps-headfoot.pdf"
       destination="pdfs/comps-headfoot-removed.pdf" />