<!---
Name:          merchandisesearch_action4.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Takes criteria from and
               searches against Merchandise
               Description field in db.
Date created:  01/05/2005
--->

<!--- Setup search criteria.
      Can be either merchandise for a specific film
	  or search against merchandise name & desc --->
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

<!--- Display the query results --->
<html>
<head>
 <title>Search Results</title>
</head>

<body>
<cfoutput>
<h2>
#GetResults.RecordCount# Merchandise record(s) found for:
#HTMLEditFormat(TheCriteria)#.
</h2>
</cfoutput>

<!--- Use definition list to disply Verity output 
 score, title and summary from each item found. --->
<dl>
<cfoutput query="GetResults">
 <dt><emp>#NumberFormat(Round(Score * 100))#%</emp>
 <strong>#Title#</strong>
 <dd><small>#Summary#</small></dd>
</cfoutput>
</dl>

</body>
</html>

