<!---
 Filename: ChoicePage2a.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<h2>Film Information</h2>

<cftry>
 <!--- Retrieve Ratings from database --->
 <cfquery name="getRatings">
 SELECT RatingID, Rating
 FROM FilmsRatings
 ORDER BY Rating
 </cfquery>

 <!--- Retrieve Films from database --->
 <cfquery name="getFilms">
 SELECT FilmID, MovieTitle
 FROM Films
 ORDER BY Films.MovieTitle
 </cfquery>

 <!--- If any database errors occur during above query, --->
 <cfcatch type="Database">
 <!--- Let user know that Films data can't be shown right now --->
 <i>Sorry, we are not able to connect to our real-time database at
the moment, due to carefully scheduled database maintenance.</i><br>

 <!--- Stop processing at this point --->
 <cfabort>
 </cfcatch>
</cftry>

<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">
 <!--- Display Film names in a drop-down list --->
 <P>Films:
 <cfselect query="getFilms" name="filmID" value="FilmID"
	display="MovieTitle"/>

 <!--- Display Rating names in a drop-down list --->
 <P>Ratings:
 <cfselect query="getRatings" name="ratingID" value="RatingID"
	display="Rating"/>

</cfform>
