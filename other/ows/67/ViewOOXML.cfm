<!----
File name: ViewOOXML.cfm
Purpose:   To read then output the TEXT ONLY of a Word OOXML document
Author:    Matt Tatam
---->

<CFZIP ACTION="Read" 
       FILE="C:\Inetpub\wwwroot\ows\76\resources\word\Helloworld.docx"
       ENTRYPATH="word\document.xml" 
       VARIABLE="strXMLtext">	

<CFOUTPUT>#strXMLtext#</CFOUTPUT>
 