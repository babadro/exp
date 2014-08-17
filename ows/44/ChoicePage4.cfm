<!---
 Filename: ChoicePage4.cfm
 Created by: Nate Weiss (NMW)
 Purpose: Provides navigation elements for films and ratings
--->

<h2>Film Information</h2>

<cftry>
  <!--- Retrieve Films from live database --->
  <cfquery name="getFilms">
  SELECT FilmID, MovieTitles
  FROM Films
  ORDER BY Films.MovieTitle
  </cfquery>

  <!--- If any database errors occur during above query, --->
  <cfcatch type="Database">

  <!--- Location of our emergency backup file --->
  <cfset backupFilePath = expandPath("FilmsBackup.xml")>

  <!--- Read contents of the WDDX/XML in from backup file --->
  <cffile action="read" file="#backupFilePath#" variable="wddxPacket">

  <!--- Convert the XML back into original query object --->
  <cfwddx action="WDDX2CFML" input="#wddxPacket#" output="getFilms">

  <!--- Let user know that emergency version is being used --->
  <p><i>NOTE:
  We are not able to connect to our real-time Films database at the moment.
  Instead, we are using data from our archives to display the Films list.
  Please try again later today for an up to date listing.</i></p>
  </cfcatch>
</cftry>

<!--- Attempt database operation --->
<cftry>
  <!--- Retrieve Ratings from database --->
  <cfquery name="getRatings">
  SELECT RatingID, Rating
  FROM FilmsRatings
  ORDER BY Rating
  </cfquery>

  <!--- Silently catch any database errors from above query --->
  <cfcatch type="Database"/>
</cftry>


<!--- Create self-submitting form --->
<cfform action="#CGI.script_name#" method="post">

  <!--- Display Film names in a drop-down list --->
  <p>Films:
  <cfselect query="getFilms" name="filmID" value="FilmID"
	display="MovieTitle"/>
  <cfinput type="submit" name="go" value="Go">
  <!--- If, after all is said and done, we were able to get Ratings data --->
  <cfif isDefined("getRatings")>
    <!--- Display Ratings in a drop-down list --->
    <p>Ratings:
    <cfselect query="getRatings" name="ratingID"
    value="RatingID" display="Rating"/>
    <cfinput type="submit" name="go" value="Go">
  </cfif>

</cfform>
