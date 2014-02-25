<!--- 
AUTHOR: Brendan O'Hara (bohara@etechsolutions.com)
WEB SERVICE: TestSimpleCreditRating.cfm 

DESCRIPTION: Test the CFC.
--->

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

<cfinvoke webservice="#theURL#/SimpleCreditRating.cfc?wsdl" 
          method="getCreditRating" returnvariable="creditRating">
  <cfinvokeargument name="SSN" value="000000001"/>
</cfinvoke>

<cfoutput>The result is: #creditRating#</cfoutput>
