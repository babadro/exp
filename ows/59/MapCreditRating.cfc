<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
WEB SERVICE: MapCreditRating.cfc 

DESCRIPTION: ColdFusion CFC deployed as a Web Service to return 
a Credit Rating string for a passed-in "Person" struct.

ARGUMENTS: name="Person" type="struct" required="yes" 
--->
<cfcomponent output="false">

<!--- We define the CFC's single function that retrieves the credit 
 rating for a passed-in "Person" and returns it --->
 <cffunction name="getCreditRating" output="false" returnType="string"
             access="remote"> 
  <!--- The getCreditRating function takes a single argument 
        called "Person" of type struct, which is required ---> 
  <cfargument name="Person" type="struct" required="yes">
  <!--- var scope the result --->
  <cfset var result = "">
  
  <!--- This would be real logic here --->
  <cfset result = len(arguments.person.ssn) * randRange(50,100)>
  
  <!--- Then the CreditRating is returned --->
  <cfreturn result>
</cffunction>

</cfcomponent>
