<cfcomponent hint="Search and display films">
	<cffunction name="listFilms" returnType="query" output="false" access="remote" hint="Search for a film, and return a query with the id and title of the matching films">
		<cfargument name="searchString"required="no" default="" hint="movie title to search for. If not provided, returns all films.">
		<cfset var getFilms = "">
		<cfquery name="getFilms" datasource="ows">
			SELECT FilmID, MovieTitle FROM Films
			<cfif ARGUMENTS.searchString neq "">WHERE (MovieTitle LIKE '%#ARGUMENTS.searchString#%' OR Summary LIKE '%#ARGUMENTS.searchString#%')</cfif>
			ORDER BY MovieTitle
		</cfquery>
		<cfreturn getFilms>
	</cffunction>
	
	<cffunction name="printFilms" returnType="void" access="remote" hint="Search for a film, and display the results in an HTML table.">
		<cfargument name="searchString" required="no" default="" hint="Movie title to search for. If not provided, returns all films.">
		<cfset var qFilms = listFilms(arguments.searchString)>
		<table>
			<tr><th>ID</th><th>Title</th></tr>
			<cfoutput query="qFilms"><tr><td>#qFilms.FilmID#</td><td>#qFilms.MovieTitle#</td></tr></cfoutput>			
		</table>
		<cfreturn>
	</cffunction>
</cfcomponent>