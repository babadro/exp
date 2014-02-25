<!----
File name: CreateDOC.cfm
Purpose:   Create a Word 2007 DOC file
Author:    Matt Tatam
---->

<CFSET UUIDTemp = CreateUUID()>
<CFFILE ACTION="Read" 
        FILE="#Application.Word.strBlankTemplateDir#\word\document.xml" 
        VARIABLE="strXMLtext"> 
<CFSET XMLDoc=XMLParse("#strXMLtext#")>
<CFIF structkeyexists(XMLDoc.Document.body.p[1], "r")> 
  <CFIF structkeyexists(XMLDoc.Document.body.p[1].r, "t") >
    <CFSET XMLDoc.Document.body.p[1].r[1].t[1].XMLText = "This is my 1st paragraph"  >
  </CFIF>
</CFIF>
<CFSET  strNewXML = toString(XMLDoc)>
<CFFILE ACTION = "write" 
        FILE="#Application.Word.strBlankTemplateDir#\word\document.xml" 
        OUTPUT="#strNewXML#"> 
<CFZIP FILE="#Application.Word.strOutputDir#\createdocx_#UUIDTemp#.docx"  
       STOREPATH="yes"
       RECURSE="true"
       OVERWRITE="yes"
       SOURCE="#Application.Word.strBlankTemplateDir#"  />