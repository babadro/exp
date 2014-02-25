<!---
Filename: protect-ownerpassword.cfm
Author: John C. Bland II (jcbii)
Purpose: Protects a pdf with an owner password
--->

<!--- Protects the pdf with an owner password --->
<cfpdf action="protect" source="samples/comps.pdf" overwrite="yes"
       destination="pdfs/comps-protected-owner.pdf"
       newownerpassword="test" permissions="none" />
