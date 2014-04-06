<!--- 
 Filename: HelloWorldMessage2.cfm
 Author: Nate Weiss (NMW)
 Purpose: Creates a custom tag that accepts attributes
--->

<!--- Tag Attributes --->
<cfparam name="attributes.message" type="string">
<cfparam name="attributes.topMessage" type="string" 
 default="Hello, World, from Orange Whip Studios.">
<cfparam name="attributes.topColor" type="string" default="yellow">
<cfparam name="attributes.bottomColor" type="string" default="orange">

<!--- Output message in HTML table format --->
<cfoutput>
<div id="heading" style="font-weight:bold;background-color: #attributes.topColor#">
#attributes.topMessage#
<div id="content" style="background-color: #attributes.bottomColor#">
 #attributes.message#
 </div>
</cfoutput> 
