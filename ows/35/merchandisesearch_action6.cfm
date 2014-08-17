<!---
Name:          merchandisesearch_action6.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Takes criteria from and
               searches against multiple
               collections.
Date created:  01/05/2005
--->

<!--- Perform a Verity search --->
<cfsearch collection="#collection#"
          name="GetResults"
          criteria="#FORM.Criteria#">

<!--- Display the query results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<cfoutput>
<h2>
#GetResults.RecordCount# record(s) found for "#FORM.Criteria#".
</h2>
</cfoutput>

<!--- loop through each row outputting the description --->
<ul>
<cfoutput query="getresults">
  <li>#Title#
</cfoutput>
</ul>

</body>
</html>

