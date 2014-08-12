<!--- 
 Filename: UsingFilmSearchCFC.cfm
 Author: Nate Weiss (NMW)
 Purpose: Uses the FilmSearchCFC component to display a list of films
--->

<html>
<head><title>Film Search Example</title></head>
<body>

<!--- Invoke the ListFilms() method of the FilmSearchComponent --->
<cfparam name="FORM.keywords" default="ColdFusion">

<cfinvoke component="FilmSearchCFC" method="listFilms" searchString="#FORM.keywords#"
 returnVariable="FilmsQuery">

<!--- Now output the list of films --->
<H2>Current Titles Include:</H2><BR>
<cfoutput query="filmsQuery">
 #FilmsQuery.MovieTitle#<br>
</cfoutput>

</body>
</html>
