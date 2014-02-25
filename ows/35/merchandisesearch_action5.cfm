<!---
Name:          merchandisesearch_action5.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Takes criteria from and
               searches against Merchandise
               Description field in db, and
               then queries a table using those
               results
Date created:  01/05/2005
--->

<cfparam name="FORM.FilmID" default="">
<cfif FORM.FilmID NEQ "">
 <!--- FilmID is specified --->
 <cfset TheCriteria = "CF_CUSTOM1 <MATCHES> #Form.FilmID#">
<cfelse>
 <!--- Use text --->
 <cfset TheCriteria = "#Form.Criteria#">
</cfif>

<!--- Perform a Verity search --->
<cfsearch collection="Merchandise"
          name="GetResults"
          criteria="#TheCriteria#">

<!--- Get --->
<cfquery name="GetPrices" datasource="ows">
 SELECT MerchID, MerchDescription, MerchPrice
 FROM Merchandise
 WHERE MerchID IN (#ValueList(GetResults.Key)#)
</cfquery>


<!--- Display the query results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<cfoutput>
<h2>
#GetPrices.RecordCount# Merchandise record(s) found.
</h2>
</cfoutput>

<ul>
<cfoutput query="GetPrices">
 <li>#MerchDescription# - #DollarFormat(MerchPrice)#</li>
</cfoutput>
</ul>

</body>
</html>

