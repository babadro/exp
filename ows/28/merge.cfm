<!---
Filename: merge.cfm
Author: John C. Bland II (jcbii)
Purpose: Merges two pdfs
--->

<!--- Merges PDFs usingsource attribute --->
<cfpdf action="merge" overwrite="yes"
       source="samples/title.pdf, samples/page.pdf"
			 destination="pdfs/titlepagemerge.pdf" />
