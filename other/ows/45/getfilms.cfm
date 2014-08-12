<!--- 
 Filename: getfilms.cfm
 Author: Charlie Arehart
 Purpose: Uses the films component to display a list of films
--->

<html>
<head><title>Using FilmDataCFC</title></head>
<body>

<h3>Orange Whip Studios Films</h3>

<cfobject component="films" name="films"> 
<cfif isDefined("url.actorID") and isNumeric(url.actorID)>
	<cfset filmsQuery = films.listFilms(url.actorID)>
<cfelse>
	<cfset filmsQuery = films.listFilms()>
</cfif>

<cfoutput query="filmsQuery">
 <a href="UsingFilmDataCFC1_Detail.cfm?FilmID=#FilmID#">#MovieTitle#</a><br>
</cfoutput> 

</body>
</html>