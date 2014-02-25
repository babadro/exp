<cfcomponent>

<cffunction name="sayHello" access="remote" 
            returnType="string" output="false">
  <cfargument name="name" type="string" required="true"
              default="Nameless">

  <cfreturn "Hello, #arguments.name#">
</cffunction>


</cfcomponent>