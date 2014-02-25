<!---
Filename: protect-userpassword.cfm
Author: John C. Bland II (jcbii)
Purpose: Protects a pdf with an user password
--->

<!--- Protects the pdf with a user password --->
<cfpdf action="protect" source="samples/comps.pdf"
       destination="pdfs/comps-protected-user.pdf"
       newuserpassword="test" overwrite="yes" />