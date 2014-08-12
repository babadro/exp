<!---
Filename: protect-userpassword-encrypted.cfm
Author: John C. Bland II (jcbii)
Purpose: Protects a pdf with an user password and encryption
--->

<!--- Protects the PDF with a user password and AES encryption --->
<cfpdf action="protect" overwrite="yes" encrypt="aes_128"
       newuserpassword="test" source="samples/comps.pdf"
       destination="pdfs/comps-userpassword-encrypted.pdf" />