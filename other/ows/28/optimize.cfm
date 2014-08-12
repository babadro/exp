<!---
Filename: optimize.cfm
Author: John C. Bland II (jcbii)
Purpose: Optimizes a PDF
--->

<!--- Optmize the PDF using lossy optimization --->
<cfpdf action="optimize" overwrite="yes"
       nofonts="true" nometadata="true" nolinks="true"
       noattachments="true" nobookmarks="true" nocomments="true"
			 nojavascripts="true" nothumbnails="true"
       source="samples/cfkit_en.pdf" destination="pdfs/cfkit_en_1.pdf"/>
<!--- Encode all non-encoded streams --->
<cfpdf action="write" overwrite="yes" encodeall="true"
       saveoption="linear"
       source="samples/cfkit_en.pdf" destination="pdfs/cfkit_en_2.pdf"/>