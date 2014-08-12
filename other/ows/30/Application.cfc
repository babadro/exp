<!--- 
 Filename:   Application.cfc
 Created by:  Raymond Camden (ray@camdenfamily.com)
 Please Note: Executes for every page request!
--->

<cfcomponent output="false">

  <!--- Name the application. --->
  <cfset this.name = "c30">
  <cfset this.sessionManagement=true>
  <cfset this.dataSource="ows">

  <cffunction name="onApplicationStart" returnType="void" 
			  output="false">
  </cffunction>  

</cfcomponent>