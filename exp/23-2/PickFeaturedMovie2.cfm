<cfparam name="attributes.returnVariable" type="variablename">
<cfparam name="attributes.dataSource" type="string" default="ows">

<cflock scope="session" type="exclusive" timeout="30">
	<cfparam name="session.movieList" type="string" default="">
	<cfif session.movieList eq "">
		<cfquery name="getFilmIDs" dataSource="#attributes.dataSource#">SELECT FilmID FROM Films ORDER BY MovieTitle</cfquery>
		<cfset session.movieList = valueList(getFilmIDs.FilmID)>
	</cfif>
	<cfset thisMovieID = listFirst(session.movieList)>
	<cfset session.movieList = listRest(session.movieList)>
</cflock>

<cfset "caller.#attributes.returnVariable#" = thisMovieID>