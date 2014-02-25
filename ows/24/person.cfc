<!--- 
 Filename: Person.cfc
 Author: Ken Fricklas (KF)
 Purpose: Basic Person CFC
--->
<cfcomponent hint="Parent Component - Person">

<cfparam name="THIS.firstName" default="John">
<cfparam name="THIS.lastName" default="Doe">

<cffunction name="showPerson" output="true" hint="showPerson in person.cfc" >
  <B>#THIS.firstName# #THIS.lastName#</B>
</cffunction>

</cfcomponent>
