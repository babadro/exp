<!---
Filename: merge-params.cfm
Author: John C. Bland II (jcbii)
Purpose: Merges two pdfs using cfpdfparam
--->

<!--- Merges PDFs using cfpdfparam --->
<cfpdf action="merge" overwrite="yes"
       destination="pdfs/titlepagemerge2.pdf">
   <cfpdfparam source="samples/title.pdf" />
   <cfpdfparam source="samples/page.pdf" />
</cfpdf>
