<cfcomponent output="false" alias="ows.32.example3.components.Actors" persistent="true" entityname="ACTORS" table="ACTORS">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="ACTORID" type="numeric" default="0"  generator="increment">
	<cfproperty name="NAMEFIRST" type="string" default="">
	<cfproperty name="NAMELAST" type="string" default="">
	<cfproperty name="AGE" type="numeric" default="0">
	<cfproperty name="NAMEFIRSTREAL" type="string" default="">
	<cfproperty name="NAMELASTREAL" type="string" default="">
	<cfproperty name="AGEREAL" type="numeric" default="0">
	<cfproperty name="ISEGOMANIAC" type="numeric" default="0">
	<cfproperty name="ISTOTALBABE" type="numeric" default="0">
	<cfproperty name="GENDER" type="string" default="">

</cfcomponent>