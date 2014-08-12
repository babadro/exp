<!--- 
 Filename: Application.cfc (The "Application Component")
 Created by: Raymond Camden (ray@camdenfamily.com)
 Purpose: Sets "constant" variables and includes consistent header
--->

<cfcomponent output="false">

  <cffunction name="onRequestStart" returnType="boolean" output="true">
    <!--- Any variables set here can be used by all our pages --->
    <cfset request.companyName = "Orange Whip Studios">

    <!--- Display our Site Header at top of every page --->
    <cfinclude template="SiteHeader.cfm">

    <cfreturn true>
  </cffunction>
  
</cfcomponent>
