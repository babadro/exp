<!---
Filename: optimize-algos.cfm
Author: John C. Bland II (jcbii)
Purpose: Optimizes a PDF using algorithms
--->

<!--- Optmize the PDF using Nearest_Neighbour algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Nearest_Neighbour"
       source="samples/pdf101.pdf"
       destination="pdfs/pdf101_nearest.pdf"/>

<!--- Optmize the PDF using Bicubic algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Bicubic"
       source="samples/pdf101.pdf"
       destination="pdfs/pdf101_bicubic.pdf"/>

<!--- Optmize the PDF using Bilinear algorithm --->
<cfpdf action="optimize" overwrite="yes" algo="Bilinear"
       source="samples/pdf101.pdf"
       destination="pdfs/pdf101_bilinear.pdf"/>