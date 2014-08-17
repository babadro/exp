<!---
Filename: headerfooter-add.cfm
Author: John C. Bland II (jcbii)
Purpose: Adds a header and footer to a PDF
--->

<!--- Create a formatted date for display in header --->
<cfset today = DateFormat(now(), "long") />

<!--- Add a header to page 1 --->
<cfpdf action="addheader" overwrite="yes" text="Comps" pages="1"
       source="samples/comps.pdf"
			 destination="pdfs/comps-headfoot.pdf" />
<!--- Add a header to all pages --->
<cfpdf action="addheader" overwrite="yes" text="last edited #today#"
       align="right" showonprint="false"
       source="pdfs/comps-headfoot.pdf" />
<!--- Add a footer to the bottom left --->
<cfpdf action="addfooter" overwrite="yes" align="left"
       text="Page _PAGENUMBER of _LASTPAGENUMBER"
       source="pdfs/comps-headfoot.pdf" />
<!--- Add an image to footer on the bottom right --->
<cfpdf action="addfooter" overwrite="yes" align="right"
       image="samples/adobe-lq.png"
       source="pdfs/comps-headfoot.pdf" />