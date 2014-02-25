<!----
File name: ReadSpreadsheet.cfm
Purpose:   Read a spreadsheet file
Author:    Matt Tatam
---->

<!---
Read and populate the spreadsheet object and query from the worksheet films
--->
<CFSCRIPT> 
   strFileName=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_7.xlsx";  
</CFSCRIPT>

<CFSPREADSHEET 
   ACTION="read" 
   SRC="#strFileName#" 
   SHEETNAME="Films"    
   NAME="xlssFilms" />
<CFSPREADSHEET 
   ACTION="read" 
   SRC="#strFileName#" 
   SHEETNAME="Films"   
   QUERY="qryFilmData" />

<CFDUMP VAR="#qryFilmData#" />
<CFDUMP VAR="#xlssFilms#" />