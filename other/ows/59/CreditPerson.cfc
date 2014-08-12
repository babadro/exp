<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
COMPONENT: CreditPerson.cfc 

DESCRIPTION: ColdFusion CFC deployed as a complex data type for 
use with Web Services. No functions. No arguments. 

--->

<cfcomponent>
  <cfproperty name="FirstName" type="string">
  <cfproperty name="Lastname" type="string">
  <cfproperty name="Address" type="string">
  <cfproperty name="City" type="string">
  <cfproperty name="State" type="string">
  <cfproperty name="ZipCode" type="string">
  <cfproperty name="SSN" type="string">
</cfcomponent>
