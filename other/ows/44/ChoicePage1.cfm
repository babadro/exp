<!---
 Filename: ChoicePage1.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<h2>Film Information</h2>

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

<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">
 <!--- Display Film names in a drop-down list --->
 <P>Films:
 <cfselect query="getFilms" name="filmID" value="filmID"
	display="MovieTitle"/>

 <!--- Display Rating names in a drop-down list --->
 <P>Ratings:
 <cfselect query="getRatings" name="ratingID" value="RatingID"
	display="Rating"/>

</cfform>
