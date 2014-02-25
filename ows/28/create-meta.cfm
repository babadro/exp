<!---
Filename: create-meta.cfm
Author: John C. Bland II (jcbii)
Purpose: Creates a pdf, same as createpdf.cfm, and adds meta
--->

<!--- Create a custom in-memory pdf --->
<cfdocument name="cover" format="PDF">
  <h1>PDF created from <i>cfdocument</i></h1>
  <h3><cfoutput>#DateFormat(now(),"mm/dd/yyyy")#</cfoutput></h3>
</cfdocument>

<!--- Write the PDF to disk --->
<cfpdf action="write" source="cover" overwrite="yes"
       destination="pdfs/create-meta.pdf" />

<!--- Create and populate the metadata struct --->
<cfset meta = StructNew() />
<cfset meta.Author = "John C. Bland II" />
<cfset meta.Title = "Adobe Derby" />
<cfset meta.Subject = "Adobe Derby Official Rules" />
<cfset meta.Keywords = "Adobe, Adobe Derby, Rules" />

<!--- Set the PDF info --->
<cfpdf action="setinfo" source="pdfs/create-meta.pdf" info="#meta#" />

<!--- Read the PDF info --->
<cfpdf name="info" action="getinfo" source="pdfs/create-meta.pdf" />

<!--- Dump PDF info to the screen --->
<cfdump var="#info#" />
