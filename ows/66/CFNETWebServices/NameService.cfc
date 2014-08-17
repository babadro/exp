<!--- -------------------------------------------------------------
This component contains a remote function that returns a 
query result from an Access database.
------------------------------------------------------------ --->
<cfcomponent>
  <cffunction access="remote" 
  	name="GetNames" 
	output="false" 
	returnType="query" 
	displayName="GetNames" 
	hint="This function accepts a string filter and returns a query.">
    <cfargument name="sFilter" type="string" required="true" />
	  <cfquery name="result" datasource="names">
	    SELECT * 
		FROM [names]
		WHERE name LIKE '#sFilter#%'			
	  </cfquery>	
    <cfreturn result>
  </cffunction>
</cfcomponent>
