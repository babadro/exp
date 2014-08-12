<!--- 
 Filename: actor.cfc
 Author: Ken Fricklas (KF)
 Purpose: Demonstrates roles
--->
<cfcomponent name="actor" extends="person">
<cffunction name="init" returntype="component">
  <cfargument name="datasource" required="yes" type="string">
  <cfset variables.dsn = arguments.datasource>
  <cfreturn this>
</cffunction>
<cffunction name="getActorSalary" returnType="query" roles="Producers, Executives">
  <cfargument name="actorID" type="numeric" required="true" 
    displayName="Actor ID" hint="The ID of the Actor">
  <cfquery name="salaries" dataSource="#variables.dsn#">
    SELECT Actors.ActorID, Actors.NameFirst, Actors.NameLast, 
      FilmsActors.Salary, Films.MovieTitle
    FROM Films 
    INNER JOIN (Actors INNER JOIN FilmsActors 
     ON Actors.ActorID = FilmsActors.ActorID) 
       ON Films.FilmID = FilmsActors.FilmID
    WHERE Actors.ActorID = #Arguments.actorID#
  </cfquery>
  <cfreturn salaries>
</cffunction>
</cfcomponent>
