<!---
Name:          merchandisesearch_form5.cfm
Author:        Leon Chalnick & Ben Forta
Description:   Presents simple search form for searching
               for merchandise
Date created:  01/05/2005
--->

<!--- Get the movie titles for drop down list --->
<cfquery NAME="GetFilms" datasource="ows">
 SELECT FilmID, MovieTitle
 FROM Films
</cfquery>

<!--- Create a search form --->
<html>
<head>
   <title>Merchandise Search</title>
</head>

<body>

<h2>Please enter keywords to search for.</h2>

<cfform action="merchandisesearch_action5.cfm">
Keywords: <cfinput type="text" name="criteria">
<br>
Movie: <cfselect name="FilmID"
                 query="GetFilms"
                 value="FilmID"
                 display="MovieTitle"
                 queryPosition="below">
        <option />
       </cfselect>
<br>
<cfinput type="submit"
         name="sbmt"
         value="Search">
</cfform>

</body>
</html>
