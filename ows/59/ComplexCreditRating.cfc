<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
WEB SERVICE: ComplexCreditRating.cfc 

DESCRIPTION: ColdFusion CFC deployed as a Web Service to return 
a Credit Rating "string" for a passed-in "Person", which is a Complex 
Data Type which is defined in the CFC Person.cfc.

ARGUMENTS: name="SSN" type="string" required="yes" 
--->

<cfcomponent output="false">

<!--- We define the CFC's single function that retrieves the credit 
 rating for a passed-in "Person" and returns it --->
<cffunction name="GetCreditRating" returnType="string" output="false" 
            access="remote">
  <!--- The GetCreditRating function takes a single argument 
        called "Person" of type struct, which is required --->
  <cfargument name="person" type="CreditPerson" required="yes">
  <!--- var scope the result --->
  <cfset var result = "">
  
  <!--- This would be real logic here --->
  <cfset result = len(arguments.person.ssn) * randRange(50,100)>

  <!--- Then the CreditRating is returned --->
  <cfreturn result>
</cffunction>

</cfcomponent>
