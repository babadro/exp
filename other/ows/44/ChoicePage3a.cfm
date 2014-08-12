<!---
 Filename: ChoicePage3a.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<h2>Film Information</h2>
<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">

 <!--- Attempt database operation --->
 <cftry>
 <!--- Retrieve Films from database --->
 <!--- MovieTitleBad is not a valid column. To fix, change to MovieTitle --->
 <cfquery name="getFilms">
 SELECT FilmID, MovieTitle
 FROM Films
 ORDER BY Films.MovieTitleBad
 </cfquery>

 <!--- If any database errors occur during above query, --->
 <cfcatch type="Database">
 <!--- Let user know that the Films data can't be shown right now --->
 <p><i>Sorry, we can't show a real-time list of Films right now.</i></p>
 </cfcatch>
 </cftry>

 <!--- Attempt database operation --->
 <cftry>
<cfquery name="getRatings">
 SELECT RatingID, Rating
 FROM FilmsRatings
 ORDER BY Rating
 </cfquery>

 <!--- If any database errors occur during above query, --->
 <cfcatch type="Database">
 <!--- Let user know that the Ratings data can't be shown right now --->
 <p><i>Sorry, we can't show a real-time list of Ratings right now.</i></p>
 </cfcatch>
 </cftry>

 <!--- If, after all is said and done, we were able to get Film data --->
 <cfif isDefined("VARIABLES.getFilms")>
 <!--- Display Film names in a drop-down list --->
 <p>Films:
 <cfselect query="getFilms" name="filmID" value="FilmID"
	display="MovieTitle"/>
 <cfinput type="submit" name="go" value="Go">
 </cfif>

 <!--- If, after all is said and done, we were able to get Ratings data --->
 <cfif isDefined("VARIABLES.GetRatings")>
 <!--- Display Ratings in a drop-down list --->
 <p>Ratings:
 <cfselect query="getRatings" name="ratingID" value="RatingID"
	display="Rating"/>
 <cfinput type="submit" name="go" value="Go">
 </cfif>

</cfform>
