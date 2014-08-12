<!--- 
 Filename: films.cfc
 Author: Charlie Arehart
 Purpose: films component, providing search for films in the ows database.
--->

<cfcomponent 
 hint="Provides a simple interface for searching for and getting detailed 
 information about films in the Orange Whip Studios database."
 output="false">

  <cffunction name="listFilms" returnType="query"
 hint="Returns a query object containing film information." output="false">
 
    <cfargument name="actorID" type="numeric" required="No"
    hint="Allows searching for films by actor.">
 
    <cfset var getFilms = "">
    
    <cfquery name="getFilms" datasource="ows">
     SELECT FilmID, MovieTitle FROM Films
     <cfif isDefined("ARGUMENTS.actorID")>
     WHERE AND FilmID IN
	     (SELECT FilmID FROM FilmsActors
    		 WHERE ActorID = #ARGUMENTS.actorID#)
     </cfif>
     ORDER BY MovieTitle
    </cfquery>
 
    <cfreturn getFilms>
  </cffunction>
 
</cfcomponent>