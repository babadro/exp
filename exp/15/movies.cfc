<cfcomponent hint="OWS movie database access">
	<cfset ds = "ows">
	
	<cffunction name="list" retuurntype="query" hint="List All movies">
		<cfset var movies="">
		<cfquery datasource="#ds#" name="movies">
			SELECT FilmID, MovieTitle, Summary, Rating FROM Films, FilmsRatings
			WHERE Films.RatingID=FilmsRatings.RatingID ORDER BY MovieTitle
		</cfquery>
		<cfreturn movies>
	</cffunction>
	
	<cffunction name="lookupMovie" access="remote" returntype="string" hint="Lookup method for Ajax auto-suggest">
		<cfargument name="search" type="any" required="false" default="">
		<cfset var data = "">
		<cfquery datasource="#ds#" name="data">
			SELECT MovieTitle FROM Films WHERE Ucase(MovieTitle) LIKE Ucase('#ARGUMENTS.search#%') ORDER BY MovieTitle
		</cfquery>
		
		<cfreturn ValueList(data.MovieTitle)>
	</cffunction>
	
	<cffunction name="browse" access="remote" returntype="struct" hint="Browse methos for Ajax grid">
		<cfargument name="page" type="numeric" required="yes">
		<cfargument name="pageSize" type="numeric" required="yes">
		<cfargument name="gridsortcolumn" type="string" default="">
		<cfargument name="gridsortdir" type="string" required="no" default="">
		
		<cfset var movies="">
		
		<cfquery datasource="#ds#" name="movies">
			SELECT FilmID, MovieTitle, Summary, Rating FROM	Films, FilmsRatings WHERE Films.RatingID=FilmsRatings.RatingID
			<cfif ARGUMENTS.gridsortcolumn NEQ "" and ARGUMENTS.gridsortdir NEQ "">
				ORDER BY #ARGUMENTS.gridsortcolumn# #ARGUMENTS.gridsortdir#
			</cfif>
		</cfquery>
		
		<cfreturn QueryConvertForGrid(movies, ARGUMENTS.page, ARGUMENTS.pageSize)>
	</cffunction>
</cfcomponent>