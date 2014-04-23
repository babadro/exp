<cfcomponent output="false">
<cffunction name="validateCredentials" access="remote" returntype="boolean"
output="false">
<cfargument name="username" type="string"/>
<cfargument name="password" type="string"/>
<cfset var validated = false/>
<!--- Ensure that attempts to authenticate start with new credentials. --->
<cflogout/>
<cflogin>
<cfif arguments.username is "user" and arguments.password is "secret">
<cfloginuser name="#arguments.username#"
password="#arguments.password#" roles="admin"/>
<cfset validated = true/>
</cfif>
</cflogin>
<cfreturn validated/>
</cffunction>
</cfcomponent>