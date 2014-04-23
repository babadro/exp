<!--- 
 Filename: FilmSearchCFC.cfc
 Author: Ken Fricklas (KF)
 Purpose: Creates FilmSearchCFC, a simple ColdFusion Component
--->

<!--- The <CFCOMPONENT> block defines the CFC --->
<!--- The filename of this file determines the CFC's name --->
<cfcomponent hint="Search and display films">

  <cffunction name="listFilms" returnType="query" output="false" access="remote" hint="Search for a film, and return a query with the id and title of the matching films.">
    <!--- Optional SearchString argument ---> 
    <cfargument name="searchString" required="no" default="" hint="movie title to search for.  If not provided, returns all films.">

    <!--- var scoped variables --->
    <cfset var getFilms = "">
    <!--- Run the query ---> 
    <cfquery name="getFilms" datasource="ows">
    SELECT FilmID, MovieTitle FROM Films
    <!--- If a search string has been specified --->
    <cfif ARGUMENTS.searchString neq "">
    WHERE (MovieTitle LIKE '%#ARGUMENTS.searchString#%'
    OR Summary LIKE '%#ARGUMENTS.searchString#%')
    </cfif>
    ORDER BY MovieTitle
    </cfquery>
    
    <!--- Return the query results ---> 
    <cfreturn getFilms>
  
  </cffunction>

  <cffunction name="printFilms" returnType="void" access="remote" hint="Search for a film, and display the results in an HTML table.">
    <cfargument name="searchString" required="no" default="" hint="Movie title to search for.  If not provided, returns all films.">
    <!--- call the local function getFilms with the argument searchString --->
    <cfset var qFilms = listFilms(arguments.searchString)>
    <table>
    <tr><th>ID</th><th>Title</th></tr>
    <cfoutput query="qFilms">
    <tr><td>#qFilms.FilmID#</td><td>#qFilms.MovieTitle#</td></tr>
    </cfoutput>
    </table>
    <!--- Return the query results ---> 
    <cfreturn>
  
  </cffunction>


</cfcomponent>
