<!--- Construct the URL dynamically --->
<cfif not findNoCase("https", cgi.server_protocol)>
  <cfset theURL = "http://">
<cfelse>
  <cfset theURL = "https://">
</cfif>
    
<!--- Add the server and current path --->
<cfset theURL = theURL & cgi.server_name & ":" & cgi.server_port & 
       cgi.script_name>

<!--- Now remove this file's name, which is at the end --->
<cfset theURL = listDeleteAt(theURL, listLen(theURL,"/"), "/")>

<!--- Call as a web service --->
<cfinvoke webservice="#theURL#/justawebservice.cfc?wsdl" method="test" 
          returnVariable="result">
<cfoutput>#result#</cfoutput>

<p>

<!--- Call as a CFC --->
<cftry>
  <cfinvoke component="justawebservice" method="test" returnVariable="result">
  <cfoutput><p>#result#</cfoutput>
  <cfcatch>
    Sorry, but I couldn't call the method.
  </cfcatch>
</cftry>
   