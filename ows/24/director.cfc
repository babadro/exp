<!--- 
 Filename: director.cfc
 Author: Ken Fricklas (KF)
 Purpose: Demonstrates use of super and property overrides
--->
<cfcomponent displayName="Movie Director" extends="person">
  <cfset THIS.firstName = "Jim">
  <cfset THIS.lastName = "Jarofmush">
  <cffunction name="showPerson" output="true" hint="showPerson in director.cfc">
    <B>A swell director - #super.showPerson()#</B>
  </cffunction>
</cfcomponent>
