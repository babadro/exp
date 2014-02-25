<!----
File name: ViewDOC.cfm
Purpose:   View a Word 2007 DOC file
Author:    Matt Tatam
---->

<CFZIP ACTION="Read"
       FILE="#Application.Word.strOutputDir#\createdocx_081A190F-3FF1-4FB0-556973A78A7FCEF8.docx"   
       ENTRYPATH="word\document.xml" 
       VARIABLE="strXMLtext">
<CFSET XMLDoc=XMLParse("#strXMLtext#")>  
<CFSET xmlParagraphElements = XmlSearch(XMLDoc, "//*[local-name()='document']/*[local-name()='body']/*[local-name()='p']")>
<CFSET xmlParagraphElements  = xmlParagraphElements  >
<CFLOOP FROM="1" TO="#ArrayLen(xmlParagraphElements)#" INDEX="intParaCountr">
  <CFSET xmlRowElements = XmlSearch(XMLParse(xmlParagraphElements[intParaCountr]), "//*[local-name()='p']/*[local-name()='r']/*[local-name()='t']")>
  <CFLOOP FROM="1" TO="#ArrayLen(xmlRowElements)#" INDEX="intRowCountr">
    <CFOUTPUT>#xmlRowElements[intRowCountr].XMLText#</CFOUTPUT>
  </CFLOOP>
  <BR>
</CFLOOP> 
