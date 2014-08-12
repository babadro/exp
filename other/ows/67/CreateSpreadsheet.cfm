<!----
File name: CreateSpreadsheet.cfm
Purpose:   Create, populate, update a spreadsheet file
Author:    Matt Tatam
---->

<CFQUERY DATASOURCE="OWS" NAME="qryFilms">
SELECT *
FROM FILMS 
</CFQUERY>

<!--- Create Spreadsheet object for films --->
<CFSCRIPT>
//Create and populate the Films Spreadsheet
   xlssFilms = SpreadsheetNew("Films",true); 
   SpreadsheetAddrows(xlssFilms,qryFilms);
   strFileName=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_7.xlsx";
</CFSCRIPT>
<!-- write the Film worksheet information --->
<CFSPREADSHEET ACTION="write" 
               FILENAME="#strFileName#" 
               NAME="xlssFilms"  
               SHEETNAME="Films"
               OVERWRITE=true>
