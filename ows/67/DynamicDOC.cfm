<!----
File name: DynamicDOC.cfm
Purpose:   Replace the placeholders(#) with dynamic content from a query.
Author:    Matt Tatam
---->

<CFSET intcontactID = 3>
<CFZIP ACTION="unzip" 
       FILE="#Application.Word.strRootDir#\FilmBudgets.docx"   
       DESTINATION="#Application.Word.strTempDir#\filmbudget" overwrite="yes" >
<CFFILE ACTION = "read" 
        FILE="#Application.Word.strTempDir#\filmbudget\word\document.xml"
        VARIABLE="strXMLText"> 
<CFQUERY DATASOURCE = "OWS" NAME="qryContacts">
Select  * 
from contacts where contactID = #intcontactID#
</CFQUERY> 
<CFQUERY DATASOURCE = "OWS" NAME="qryFilms">
Select MOVIETITLE, PITCHTEXT, SUMMARY, AMOUNTBUDGETED , RATINGID
from films
</CFQUERY> 
<CFOUTPUT QUERY="qryContacts"  >
  <CFSET  strXMLText=replaceNoCase(strXMLText,"##FirstName##","#FirstName#","All")>
  <CFSET  strXMLText=replaceNoCase(strXMLText,"##LastName##","#LastName#","All")>
  <CFSET  strXMLText=replaceNoCase(strXMLText,"##Address##","#Address#","All")>
  <CFSET  strXMLText=replaceNoCase(strXMLText,"##city##","#city#","All")>
  <CFSET strXMLText=replaceNoCase(strXMLText,"##zip##","#zip#","All")>
  <CFSET  strXMLText=replaceNoCase(strXMLText,"##country##","#country#","All")>
</CFOUTPUT>

 <CFFILE ACTION = "write"   
         FILE="#Application.Word.strTempDir#\filmbudget\word\document.xml" 
         OUTPUT="#toString(XMLDoc)#">
<CFZIP ACTION="zip"
       STOREPATH="yes"   
       FILE="#Application.Word.strOutputDir#\FILMbUDGET.docx" 
       SOURCE="#Application.Word.strTempDir#\filmbudget"  >
