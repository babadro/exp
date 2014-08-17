<!----
File name: CreateWorksheet.cfm
Purpose:   Create a worksheet
Author:    Matt Tatam
---->

<CFPARAM NAME="url.FilmID" DEFAULT="2" />
<!--- Read and populate the spreadsheet object and query from the worksheet films --->
<CFSCRIPT> 
   strFileNameFrom=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_7.xlsx"; 
   strFileNameTo=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_10.xlsx"; 
</CFSCRIPT>


<CFSPREADSHEET 
   ACTION="read" 
   SRC="#strFileNameFrom#" 
   SHEETNAME="Films"   
   QUERY="qryFilmData" >


<CFQUERY DBTYPE="query" NAME="qry_qryFilmData">
   SELECT COL_2 strMOVIETITLE, COL_6 strPITCHTEXT, COL_4 intAMOUNTBUDGETED, 
   COL_8 dtReleased,
   COL_5 intRATING
   FROM qryFilmData 
   WHERE COL_1 = '#url.FilmID#'
</CFQUERY>
<CFQUERY DATASOURCE = "OWS" NAME="qryExpenses">
   Select  sum(EXPENSEAMOUNT) intEXPENSEAMOUNT
   FROM    Expenses 
   WHERE FilmID = #URL.FilmID#
</CFQUERY>

<CFQUERY DATASOURCE = "OWS" NAME="qryFilmDirectors">
   SELECT   Directors.*
   FROM      films
      INNER JOIN FilmsDirectors ON films.FILMID = FilmsDirectors.FILMID 
      INNER JOIN Directors ON Directors.DirectorID = FilmsDirectors.DIRECTORID 
   WHERE Films.filmID = #URL.FilmID#
</CFQUERY>  
<CFQUERY DATASOURCE = "OWS" NAME="qryFilmActors">
   SELECT  DISTINCT  ACTORS.NAMEFIRST, ACTORS.NAMELAST  
   FROM     Films 
      INNER JOIN FilmsActors ON films.FILMID =  Films.FilmID 
      INNER JOIN  ACTORS ON FilmsActors.ACTORID = Actors.ActorID 
   WHERE Films.filmID = #URL.FilmID#
</CFQUERY>




<CFSCRIPT>
   xlssFilms = SpreadsheetNew("Films",true);     
   SpreadsheetAddrow(xlssFilms, "Name:,#replace(qry_qryFilmData.strMOVIETITLE, ","," ","all")#",1,1); 
   SpreadsheetAddrow(xlssFilms, "Summary:,#replace(qry_qryFilmData.strPITCHTEXT, ","," ","all")#",2,1);
//SpreadsheetAddrow views a comma in the data as a new column  
   SpreadsheetAddrow(xlssFilms, "Budget:,#qry_qryFilmData.intAMOUNTBUDGETED#",3,1); 
   SpreadsheetAddrow(xlssFilms, "Expenses:,#qryExpenses.intEXPENSEAMOUNT#",4,1); 
   SpreadsheetAddrow(xlssFilms, "Released:,#qry_qryFilmData.dtReleased#",5,1); 
   SpreadsheetAddrow(xlssFilms, "Rating:,#qry_qryFilmData.intRATING#",6,1); 

   intROWCountDirectorsStart = 7;
   SpreadsheetAddrow(xlssFilms, "Directors:",intROWCountDirectorsStart,1,False);    
   strCSVDirectors = "" ;
</CFSCRIPT>
 
<CFLOOP QUERY="qryFilmDirectors">
   <CFSET strCSVDirectors = "#strCSVDirectors#,#FIRSTNAME# #LASTNAME#" /> 
</CFLOOP>
<CFSCRIPT>
   SpreadsheetAddColumn(xlssFilms, "#strCSVDirectors#",intROWCountDirectorsStart,2,False);
   intROWCountActorsStart = intROWCountDirectorsStart  + qryFilmDirectors.RecordCount + 1  ;
   SpreadsheetAddrow(xlssFilms, "Actors:",intROWCountActorsStart,1,False); 
   strCSVActors = "";
</CFSCRIPT>
 
 
<CFLOOP QUERY="qryFilmActors">
  <CFSET strCSVActors = "#strCSVActors#,#NAMEFIRST# #NAMELAST#" />  
</CFLOOP>
<CFSCRIPT>
   SpreadsheetAddColumn(xlssFilms, "#strCSVActors#",intROWCountActorsStart,2,False);
</CFSCRIPT>


 <!---  New Worksheet "Expenses"  in the Spreadsheet object --->
<CFQUERY DATASOURCE = "OWS" NAME="qryFilmExpenses">
   Select  EXPENSEDATE , DESCRIPTION, EXPENSEAMOUNT 
   FROM    Expenses 
   WHERE FilmID = #URL.FilmID#
</CFQUERY>
<!--- Prepare the Expenses sheet  --->
<CFSCRIPT>
   SpreadsheetCreateSheet(xlssFilms, "Expenses");     
   SpreadsheetSetActiveSheet(xlssFilms, "Expenses");
   SpreadsheetAddrow(xlssFilms , "Date, Description,Amount" );
   SpreadsheetAddrows(xlssFilms , qryFilmExpenses,2,1);
   intExpensesCount = qryFilmExpenses.RecordCount;
   SpreadsheetSetCellFormula(xlssFilms, "SUM(C2:C" & int(intExpensesCount+1) & ")", int(intExpensesCount+2), 3);
</CFSCRIPT>

 <CFQUERY DATASOURCE = "OWS" NAME="qryFilmMerchandise">
   Select      MERCHNAME, MERCHDESCRIPTION,    MERCHPRICE,  ORDERQTY 
   FROM   Merchandise
   LEFT JOIN MerchandiseOrdersItems ON Merchandise.MerchID = MerchandiseOrdersItems.ItemID
   LEFT JOIN MerchandiseOrders  ON MerchandiseOrders.OrderID = MerchandiseOrdersItems.OrderID
   WHERE FilmID = #URL.FilmID#
</CFQUERY>
  
<!-- write the Film worksheet information --->
<CFSPREADSHEET 
   ACTION="write" 
   FILENAME="#strFileNameTo#" 
   NAME="xlssFilms"  
   OVERWRITE=true> 

