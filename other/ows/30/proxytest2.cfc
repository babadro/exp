<cfcomponent>

<cffunction name="sayHello" access="remote" 
            returnType="string" output="false">
  <cfargument name="name" type="string" required="true"
              default="">
  <cfif arguments.name is "paris">
    <cfthrow message="Paris is NOT a valid name!">
  </cfif>
  <cfset sleep(1000)>
  <cfreturn "Hello, #arguments.name#">
</cffunction>

</cfcomponent>