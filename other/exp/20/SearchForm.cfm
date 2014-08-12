<cfif isDefined("form.searchCriteria")>
	<cfset client.lastSearch = form.searchCriteria>
	<cfset client.lastMaxRows = form.searchMaxRows>
<cfelseif isDefined("client.lastSearch") and isDefined("client.lastMaxRows")>
	<cfset searchCriteria = client.lastSearch>
	<cfset searchMaxRows = client.lastMaxRows>
<cfelse>
	<cfset searchCriteria = "">
	<cfset searchMaxRows = 10>
</cfif>

<html>
<head><title>Search Orange Whip</title></head>
<body>

<h2>Search Orange Whip</h2>
<cfoutput>
	<form action="#cgi.script_name#" method="post">
		<input name="SearchCriteria" value="#searchCriteria#">
		<i>Show up to <input name="SearchMaxRows" value="#searchMaxRows#" size="2">matches</i><br>
		<input type="submit" value="Search"><br>
	</form>
</cfoutput>

<cfif searchCriteria neq "">
	<cfquery name="getMatches">
		SELECT FilmID, MovieTitle, Summary FROM Films WHERE MovieTitle LIKE 
			<cfqueryparam cfsqltype="cf_sql_varchar" value="%#SearchCriteria#%">
		OR Summary Like
			<cfqueryparam cfsqltype="cf_sql_varchar" value="%#SearchCriteria#%">
		ORDER BY MovieTitle
	</cfquery>
	
	<cfoutput>
		<hr>
		<i>#getMatches.RecordCount# record foud for "#SearchCriteria#"</i>
		<br>
	</cfoutput>
	
	<cfoutput query="getMatches" maxrows="#searchMaxRows#">
		<p>
			<b>#MovieTitle#</b><br>
			#Summary#
		</p>
	</cfoutput>
</cfif>


</body>
</html>