<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
WEB SERVICE: SimpleCreditRating.cfc 

DESCRIPTION: ColdFusion CFC deployed as a Web Service to return 
a Credit Rating "string" for a passed-in Social Security number
which is a string represented by the argument "SSN".
--->

<cfcomponent output="false">

<!--- We define the CFC's single function that retrieves the credit 
 rating for a passed-in Social Security number and returns it --->
<cffunction name="getCreditRating" returnType="string" output="false"
            access="remote">
  <!--- The GetCreditRating function takes a single 
        argument SSN of type string, which is required ---> 
  <cfargument name="SSN" type="string" required="yes">
  <!--- var scope the result --->
  <cfset var result = "">
  
  <!--- This is where the logic would normally go. --->
  <cfset result = randRange(500,900)>
  
  <!--- Then the CreditRating is returned --->
  <cfreturn result>
</cffunction>

</cfcomponent>
