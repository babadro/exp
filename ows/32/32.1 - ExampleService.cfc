<cfcomponent alias="ows.32.example1.components.exampleService">
   <cffunction name="getData" access="remote" returnType="query">
      <cfset var qData="">

      <cfquery name="qData" datasource="ows">
      select ACTORID, NAMEFIRST, NAMELAST, AGE
      from APP.ACTORS
      </cfquery>

      <cfreturn qData/>
   </cffunction>
</cfcomponent>
