<!--- 
 Filename: PickFeaturedMovie2.cfm
 Author: Nate Weiss (NMW)
 Purpose: Creates the <CF_PickFeaturedMovie> custom tag
--->

<!--- Tag Attributes --->

<!--- Variable name to return selected FilmID as --->
<cfparam name="attributes.returnVariable" type="variableName">

<!--- Use "ows" datasource by default --->
<cfparam name="attributes.dataSource" type="string" default="ows">

<cflock scope="session" type="exclusive" timeout="30">

  <!--- List of movies to show (list starts out empty) --->
  <cfparam name="session.movieList" type="string" default="">

  <!--- If this is the first time we're running this, --->
  <!--- Or we have run out of movies to rotate through --->
  <cfif session.movieList eq "">
    <!--- Get all current FilmIDs from the database --->
    <cfquery name="getFilmIDs" datasource="#attributes.dataSource#">
    SELECT FilmID FROM Films
    ORDER BY MovieTitle
    </cfquery>
    
    <!--- Turn FilmIDs into a simple comma-separated list --->
    <cfset session.movieList = valueList(getFilmIDs.FilmID)>
  </cfif>
  
  <!--- Pick the first movie in the list to show right now --->
  <cfset thisMovieID = listFirst(session.movieList)>
  
  <!--- Re-save the list, as all movies *except* the first --->
  <cfset session.movieList = listRest(session.movieList)>
</cflock>

<!--- Return chosen movie to calling template --->
<cfset "caller.#attributes.returnVariable#" = thisMovieID>
