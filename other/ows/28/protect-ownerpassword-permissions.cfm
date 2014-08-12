<!---
Filename: protect-ownerpassword-permissions.cfm
Author: John C. Bland II (jcbii)
Purpose: Protects a pdf with an owner password and sets permissions
--->

<!--- Adds owner password and sets permissions --->
<cfpdf action="protect" overwrite="yes" newownerpassword="test"
       source="samples/comps.pdf"
       destination="pdfs/comps-ownerpassword-permissions.pdf"
       permissions="allowdegradedprinting,allowmodifycontents,
			              allowscreenreaders" />