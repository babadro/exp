<!---
   Name:        listing65_4.cfc
   Author:      Josh Adams
   Description: ColdFusion 9 hello world portlet CFC
   Created:     June 18, 2010
--->

<cfcomponent extends="CFIDE.portlets.ColdFusionPortlet">
   <cffunction name="doView" returntype="void" output="true">
      <cfargument name="renderRequest" type="any" required="true">
      <cfargument name="renderResponse" type="any" required="true">
      
      Hello World ColdFusion Portlet - doView method
      <cfdump var="#Arguments#">
   </cffunction>
</cfcomponent>