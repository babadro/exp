<!--- 
 Filename: HelloWorldMessage.cfm
 Author: Nate Weiss (NMW)
 Purpose: Creates a custom tag that accepts attributes
--->

<!--- Tag Attributes --->
<cfparam name="attributes.message" type="string">

<cfoutput>
<div id="heading" style="font-weight:bold">
Hello, World, from Orange Whip Studios.
</div>
<div id="content" style="background-color: orange">
 #attributes.message#<br>
</div>
</cfoutput>
