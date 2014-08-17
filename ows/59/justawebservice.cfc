<cfcomponent>

  <cffunction name="test" returntype="string" access="remote">
	  <cfif isSoapRequest()>
	    <cfreturn "Good call!">
    <cfelse>
      <cfthrow message="This method must be called as a web service.">
    </cfif>
	</cffunction>
	
</cfcomponent>