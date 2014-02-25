<!----
File name: ModifyDOC.cfm
Purpose:   Modify a Word 2007 DOC file
Author:    Matt Tatam
---->

<CFSET UUIDTemp = CreateUUID()>
<CFFILE ACTION="Read" 
        FILE="#Application.physicalPath#\resources\word\docx\blank\word\document.xml" 
        VARIABLE="strXMLtext">

<!---- read the document.xml file and parse it --->
<CFSET XMLDoc=XMLParse("#strXMLtext#")>
<CFQUERY DATASOURCE = "OWS" NAME="qryFilmRatings">
 Select MOVIETITLE, PITCHTEXT, RATINGID, SUMMARY 
 from films
</CFQUERY> 
<CFSET intAddParagraphCountr = ArrayLen(XMLDoc.Document.body.p)>
<CFLOOP QUERY="qryFilmRatings"   >
  <CFSET intAddParagraphCountr = intAddParagraphCountr+1>
  <CFSET temp = ArrayInsertAt(XMLDoc.Document.body.XMLChildren,
                              intAddParagraphCountr,
                              XMLElemNew(XMLDoc, "w:p"))> 
  <!--- add a new paragraph  and a new row to the inserted paragraph  ---->
  <CFSET temp = ArrayAppend(XMLDoc.Document.body.p[intAddParagraphCountr].XMLChildren, 
                            XMLElemNew(XMLDoc, "w:r"))>
  <CFSET temp = ArrayAppend(XMLDoc.Document.body.p[intAddParagraphCountr].r.XMLChildren,
                            XMLElemNew(XMLDoc, "w:t"))>
  <CFSET  XMLDoc.Document.body.p[intAddParagraphCountr].r.t.XMLText = "#MOVIETITLE#-#PITCHTEXT#  (#RATINGID#)">		
</CFLOOP>
<CFSET strNewXML = toString(XMLDoc)	>
<CFFILE ACTION = "write" 
        FILE="#Application.Word.strBlankTemplateDir#\word\document.xml" 
        OUTPUT="#strNewXML#"> 
<CFZIP FILE="#Application.Word.strOutputDir#\createdocx_#UUIDTemp#.docx"  
       STOREPATH="yes"
       RECURSE="true"
       OVERWRITE="yes"
       SOURCE="#Application.Word.strBlankTemplateDir#"   />

<CFDUMP var="#strNewXML#">