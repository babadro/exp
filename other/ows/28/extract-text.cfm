<!---
Filename: extract-text.cfm
Author: John C. Bland II (jcbii)
Purpose: Extracts text from a PDF
--->

<!--- Extract the text from the PDF --->
<cfpdf name="textxml" action="extracttext"
       source="samples/cfkit_en.pdf" />
<!--- Traverse the text XML and pull the pages --->
<cfset xml = XmlSearch(textxml, "/DocText/TextPerPage/Page") />
<cfoutput>
  <!--- Loop over the pages and output the content --->
  <cfloop array="#xml#" index="row">
    <strong>Page #row.xmlattributes.pageNumber#</strong>)
    #row#<br /><br />
  </cfloop>
</cfoutput>
