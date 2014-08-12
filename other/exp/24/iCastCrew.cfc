<cfinterface hint="cast or crewmember interface">
   <cffunction name="getResume" access="public" returntype="query" hint="return resume as query">
   </cffunction>
   <cffunction name="showPersonHTML" access="public" returntype="string" hint="show person information as HTML">
      <cfargument name="detail" type="boolean" required="no" default="true" hint="show detailed information">
   </cffunction>
</cfinterface>
