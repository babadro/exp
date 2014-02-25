<!---
Filename: createpdf.cfm
Author: John C. Bland II (jcbii)
Purpose: Merges pdf's from a directory
--->

<!--- Merges PDFs using directory --->
<cfpdf action="merge" overwrite="yes" order="name" ascending="yes"
       stoponerror="yes" directory="samples/pdfsToMerge"
       destination="pdfs/titlepagemerge3.pdf" />
