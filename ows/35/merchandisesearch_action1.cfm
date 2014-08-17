<!---
Name:          merchandisesearch_action1.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Takes criteria from and
               searches against Merchandise
               Description field in db.
Date created:  01/05/2005
--->

<!--- Execute SQL query to do the searching --->
<cfquery name="GetResults" datasource="ows">
  SELECT MerchID, MerchDescription
  FROM Merchandise
  WHERE (MerchDescription LIKE '%#Form.Criteria#%')
</cfquery>

<!--- Display the query results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<cfoutput>
<h2>
#GetResults.RecordCount# Merchandise record(s) found for 
"#FORM.Criteria#".
</h2>
</cfoutput>

<!--- loop through each row outputting the description --->
<ul>
<cfoutput query="getresults">
  <li>#MerchDescription#
</cfoutput>
</ul>

</body>
</html>

