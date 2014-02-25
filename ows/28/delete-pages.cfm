<!---
Filename: delete-pages.cfm
Author: John C. Bland II (jcbii)
Purpose: Deletes pages from a pdf and saves a new one
--->

<cfpdf action="deletepages" overwrite="yes" source="samples/comps.pdf"
       destination="pdfs/comps-page1.pdf" pages="2-3" />
