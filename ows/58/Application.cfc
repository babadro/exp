<cfcomponent>

  <cfset this.name = "c67">
  
  <cffunction name="onRequest">
    <cfargument name="targetPage" type="string" required="true">
    
    <cfset variables.getbaseURL = this.getbaseURL>
    <cfinclude template="#arguments.targetPage#">  
  </cffunction>

  <!---
    This UDF allows you to figure out a URL based on the current request.
    So for example, if you are at http://foo/moo/index.cfm, it will return
    http://foo/moo. This is used simply to create base URLs for our example docs.
  --->
  <cffunction name="getBaseURL" returnType="string" output="false">
    <cfset var theURL = "">

    <!--- Construct the URL dynamically --->
    <cfif not findNoCase("https", cgi.server_protocol)>
      <cfset theURL = "http://">
    <cfelse>
      <cfset theURL = "https://">
    </cfif>
    
    <!--- Add the server and current path --->
    <cfset theURL = theURL & cgi.server_name & ":" & cgi.server_port & cgi.script_name>

    <!--- Now remove this file's name, which is at the end --->
    <cfset theURL = listDeleteAt(theURL, listLen(theURL,"/"), "/")>
    
    <cfreturn theURL>
  </cffunction>
  
</cfcomponent>