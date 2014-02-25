<!---
Filename: thumbnails.cfm
Author: John C. Bland II (jcbii)
Purpose: Creates pdf thumbnails and displays results
--->

<!--- Create the thumbnails --->
<cfpdf action="thumbnail" overwrite="yes"
       source="samples/comps.pdf" destination="images/thumbs" />

<!--- Read the thumbnails directory --->
<cfdirectory name="thumbs" filter="*.jpg" 
			 directory="#ExpandPath('images/thumbs')#" />

<!--- Output the images to the browser --->
<cfoutput query="thumbs">
#currentRow#) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#name#<br />
<img src="images/thumbs/#name#" align="top" />
<br />
<hr />
</cfoutput>
