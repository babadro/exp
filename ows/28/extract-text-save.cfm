<!---
Filename: extract-text-save.cfm
Author: John C. Bland II (jcbii)
Purpose: Extracts text from a PDF and save it to a file
--->
<!--- Extract the text from the PDF --->
<cfpdf name="textxml" action="extracttext"
       source="samples/cfkit_en.pdf" />
<!--- Save the text output to a file --->
<cffile action="write" file="#ExpandPath('data/cfkit_en.xml')#"
        output="#textxml#" />
