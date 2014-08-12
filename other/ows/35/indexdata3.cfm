<!--- 
Module:         indexdata3.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Uses multiple columns for the 
                body param, and adds a custom,
				field, and then refreshes the
                Merchandise collection with by
                indexing a query result.
Date created:   01/05/2005
--->

<html>
<head>
 <title>Indexing Merchandise Data</title>
</head>
<body>


<!--- Feedback --->
Getting data ...<br>
<cfflush>

<!--- Retrieve all merchandise to be searched --->
<cfquery name="getresults" datasource="ows">
 select merchid, merchname,
        merchdescription, filmid
 from merchandise
</cfquery>

<!--- Feedback --->
Indexing data ...<br>
<cfflush>

<!--- Build 'custom' index on query result above --->
<cfindex action="refresh"
         collection="merchandise"
         key="merchid"
         type="custom"
         title="merchname"
         query="getresults"
         body="merchname,merchdescription"
         custom1="filmid">

<!--- Feedback --->
Done!

</body>
</html>
