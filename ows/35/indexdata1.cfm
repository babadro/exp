<!--- 
Module:         indexdata1.cfm
Author:         Leon Chalnick & Ben Forta
Function:       Refreshes the Merchandise collection by
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
 select merchid, merchname, merchdescription
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
         body="merchdescription">

<!--- Feedback --->
Done!

</body>
</html>

