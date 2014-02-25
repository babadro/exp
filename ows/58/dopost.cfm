<!--- 
 Filename: dopost.cfm
 Purpose: Do a Post
--->

<!--- get the base URL using our UDF --->
<cfset theURL = getBaseURL()>

<!--- add in our file --->
<cfset theURL = theURL & "/dopostrequest.cfm">

<cfhttp method="POST" url="#theURL#">
 <cfhttpparam name="form_test" type="FormField" value="This is a form variable.">
 <cfhttpparam name="url_test" type="URL" value="This is a URL variable.">
 <cfhttpparam name="cgi_test" type="CGI" value="This is a CGI variable.">
 <cfhttpparam name="cookie_test" type="Cookie" value="This is a cookie.">
 <cfhttpparam name="filename" type="FILE"
 file="#getDirectoryFromPath(getCurrentTemplatePath())#coldfusion_logo.png">
 <cfhttpparam name="fakeHeader" type="header" value="Some Value">
</cfhttp>

<cfoutput>
#cfhttp.filecontent#
</cfoutput>
