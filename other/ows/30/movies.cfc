<cfcomponent>

  <cffunction name="searchMovies" output="false" 
              returnType="query" access="public">
    <cfargument name="search" type="string" 
                required="true">
    <cfset var q = "">

    <cfquery name="q">
    select filmid, movietitle, summary
    from films
    <cfif len(trim(arguments.search))>
      where ucase(movietitle) like 
            <cfqueryparam cfsqltype="cf_sql_varchar" 
                          value="%#ucase(arguments.search)#%">
    </cfif>
    order by movietitle asc
    </cfquery>

    <cfreturn q>

  </cffunction>

</cfcomponent>