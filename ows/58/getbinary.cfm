<!--- 
 Filename: getbinary.cfm
 Purpose: Get an image and save it
--->

<!--- get the base URL using our UDF --->
<cfset theURL = getBaseURL()>

<!--- add in our image --->
<cfset theURL = theURL & "/coldfusion_logo.png">
<cfoutput>
<p>
Getting #theURL#
</p>
</cfoutput>

<cfhttp method="get" url="#theURL#" resolveURL="YES"
 path="#getDirectoryFromPath(getCurrentTemplatePath())#"
 file="coldfusion_logo_copy.png">

<cfdump var="#cfhttp#">
