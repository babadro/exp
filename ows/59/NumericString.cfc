<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
WEB SERVICE: NumericString.cfc 
DESCRIPTION: ColdFusion CFC deployed as a Web Service to return 
a passed-in integer into its String representation.
ARGUMENTS: name="numberNumeric" type="numeric" 
required="false" default="0" 
--->

<!--- Here is a display name for the CFC/WS with a hint. --->
<cfcomponent displayname="NumericString" output="false"
             hint="Converts a number to its String representation">
             
<!--- Here is a only function in the CFC. We know it is deployed as a 
Web Service because its access variable is set to "remote" ---> 
<cffunction name="IntegerToString" returnType="string" output="false"
            access="remote">
  <!--- Here is the argument variable --->
  <cfargument name="numberNumeric" 	type="numeric" required="true">
  <cfset var returnString = "">
  
  <!--- Here is the "logic" of the CFC Web Service --->
	<cfswitch expression="#arguments.numberNumeric#">
		<cfcase value="0"><cfset returnString = "Zero"></cfcase> 
		<cfcase value="1"><cfset returnString = "One"></cfcase> 
		<cfcase value="2"><cfset returnString = "Two"></cfcase> 
		<cfcase value="3"><cfset returnString = "Three"></cfcase>
		<cfcase value="4"><cfset returnString = "Four"></cfcase> 
		<cfcase value="5"><cfset returnString = "Five"></cfcase> 
		<cfcase value="6"><cfset returnString = "Six"></cfcase> 
		<cfcase value="7"><cfset returnString = "Seven"></cfcase> 
		<cfcase value="8"><cfset returnString = "Eight"></cfcase> 
		<cfcase value="9"><cfset returnString = "Nine"></cfcase> 
		<cfdefaultcase>
  		<cfset returnString = "What am I a mathematician?">
		</cfdefaultcase> 
	</cfswitch>
  <!--- Now we return the returnString variable --->
  <cfreturn returnString>
</cffunction>

</cfcomponent>
