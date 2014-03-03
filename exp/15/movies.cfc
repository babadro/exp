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
</cfcomponent>