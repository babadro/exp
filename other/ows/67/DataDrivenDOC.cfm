<!----
File name: DataDrivenDOC.cfm
Purpose:   Replace the placeholders(#) with dynamic content from a query.
Author:    Matt Tatam
---->

<CFSET intcontactID = 3>
<CFZIP ACTION="unzip" 
       FILE="#Application.Word.strRootDir#\FilmBudgets.docx"   
       DESTINATION="#Application.Word.strTempDir#\filmbudget"
       overwrite="yes" >
<cffile ACTION = "read" 
        FILE="#Application.Word.strTempDir#\filmbudget\word\document.xml"
        VARIABLE="strXMLText"> 
<CFSET intCellCountr = 1>
<CFSET curTotal = 0> 
<CFSET XMLDoc = XMLParse(strXMLText)>
<CFSET XMLPart = Duplicate(XMLDoc.Document.body.tbl.tr[2]) >
<CFOUTPUT QUERY="qryFilms" MAXROWS=10 >
  <CFSET curTotal = curTotal + AmountBudgeted>
  <CFSET intCellCountr = intCellCountr  + 1>
  <CFSET temp = ArrayInsertAt(XMLDoc.Document.body.tbl.XMLChildren, INT(2 +intCellCountr),  XMLPart  ) >
  <CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[1].p[1].r[1].t[1].XMLText = "#MOVIETITLE#" >	
  <CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[2].p[1].r[1].t[1].XMLText = "#PITCHTEXT#" >
  <CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[3].p[1].r[1].t[1].XMLText = "#SUMMARY#">
  <CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[4].p[1].r[1].t[1].XMLText = LScurrencyFormat(AMOUNTBUDGETED)>
  <CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[5].p[1].r[1].t[1].XMLText = "#RATINGID#">	
</CFOUTPUT> 
<CFSET intCellCountr = intCellCountr  + 1>
<CFSET XMLDoc.Document.body.tbl.tr[intCellCountr].tc[4].p[1].r[1].t[1].XMLText = LScurrencyFormat(curTotal)>
  <CFFILE ACTION = "write"   
          FILE="#Application.Word.strTempDir#\filmbudget\word\document.xml" 
          OUTPUT="#toString(XMLDoc)#">
  <CFZIP ACTION="zip"
         STOREPATH="yes"   
         FILE="#Application.Word.strOutputDir#\FILMbUDGET.docx" 
         SOURCE="#Application.Word.strTempDir#\filmbudget">
