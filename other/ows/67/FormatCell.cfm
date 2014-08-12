<!----
File name: FormatCell.cfm
Purpose:   Format a spreadsheet file cell
Author:    Matt Tatam
---->

<CFPARAM NAME="url.FilmID" DEFAULT="2" />
<!--- Read and populate the spreadsheet object and query from the worksheet films --->
<CFSCRIPT> 
   strFileNameFrom=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_7.xlsx"; 
   strFileNameTo=GetDirectoryFromPath(GetCurrentTemplatePath()) & "Listing67_12.xlsx"; 
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
 
<!--- Prepare the Merchandise sheet  --->
<CFSCRIPT>
   SpreadsheetCreateSheet(xlssFilms, "Merchandise");     
   SpreadsheetSetActiveSheet(xlssFilms, "Merchandise");
   intCurrentRow = 1;
   SpreadsheetAddrow(xlssFilms , "Name, Description,Price, Quantity Sold,Total" );
</CFSCRIPT>
<CFLOOP QUERY="qryFilmMerchandise">
   <CFSCRIPT> 
      intCurrentRow = intCurrentRow + 1;
      SpreadsheetAddrow(xlssFilms , "#replace(MERCHNAME, ","," ","all")#,#replace(MERCHDESCRIPTION, ","," ","all")#,#MERCHPRICE#, #ORDERQTY#" ,intCurrentRow ,1);      
      SpreadsheetSetCellFormula(xlssFilms, "C" & intCurrentRow & "*D" & intCurrentRow & "", intCurrentRow, 5); 
     
   </CFSCRIPT>
</CFLOOP> 

<CFQUERY DATASOURCE = "OWS" NAME="qryMerchandiseOrders">
   SELECT  Contacts.FirstName,  Contacts.LastName ,  sum(MerchandiseOrdersItems.OrderQty *  MerchandiseOrdersItems.ItemPrice) as OrderTotal , MerchandiseOrders.ShipState, MerchandiseOrders.ShipCountry, MerchandiseOrders.ShipZip, MerchandiseOrders.ShipDate
   
   FROM (Contacts INNER JOIN MerchandiseOrders ON Contacts.ContactID = MerchandiseOrders.ContactID) 					
   INNER JOIN (Merchandise 
   INNER JOIN MerchandiseOrdersItems ON Merchandise.MerchID = MerchandiseOrdersItems.ItemID) 
   ON MerchandiseOrders.OrderID = MerchandiseOrdersItems.OrderID 
   GROUP BY Contacts.FirstName, Contacts.LastName, MerchandiseOrders.ShipZip, MerchandiseOrders.ShipState, MerchandiseOrders.ShipCountry, MerchandiseOrders.ShipDate
</CFQUERY> 
 
<!--- Prepare the Merchandise Order sheet  --->
<CFSCRIPT>
   SpreadsheetCreateSheet(xlssFilms, "Merchandise Orders");     
   SpreadsheetSetActiveSheet(xlssFilms, "Merchandise Orders");
   SpreadsheetAddrow(xlssFilms , "First Name, Last Name,  Order Total, State, Country, Zip, Shipping Date" );
   SpreadsheetAddrows(xlssFilms , qryMerchandiseOrders );
   intMerchandiseOrdersCount = qryMerchandiseOrders.RecordCount;
   SpreadsheetSetCellFormula(xlssFilms, "SUM(C2:C" & int(intMerchandiseOrdersCount +1) & ")", int(intMerchandiseOrdersCount +2), 3);

//Formats the Order Total column to numeric
   fmtTotalColumn=StructNew() ;
   fmtTotalColumn.dataFormat = "##,##0.00"; 
   SpreadsheetFormatColumns(xlssFilms,fmtTotalColumn,3);
//Formats the Shipping data column to Date
   fmtDateColumn=StructNew() ;
   fmtDateColumn.dataFormat = "d-mmm-yy" ; 
   SpreadsheetFormatColumns(xlssFilms, fmtDateColumn,7);
//Formats the Order Total column to numeric and has a double top border
   fmtTotalColumn=StructNew() ;
   fmtTotalColumn.dataFormat = "##,##0.00"; 
   fmtTotalColumn.TopBorder="double";
   SpreadsheetFormatCell(xlssFilms,fmtTotalColumn,int(intMerchandiseOrdersCount +2), 3);

</CFSCRIPT> 


 
<!-- write the Film worksheet information --->
<CFSPREADSHEET 
   ACTION="write" 
   FILENAME="#strFileNameTo#" 
   NAME="xlssFilms"  
   OVERWRITE=true> 

