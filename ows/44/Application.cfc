<!---
 Filename:   Application.cfc
 Created by:  Raymond Camden (ray@camdenfamily.com)
 Please Note: Executes for every page request!
--->

<cfcomponent output="false">

  <!--- Name the application. --->
  <cfset this.name = "c44">
  <cfset this.sessionManagement=true>
  <cfset this.datasource = "ows">

</cfcomponent>