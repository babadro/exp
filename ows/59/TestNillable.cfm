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

<cfinvoke webservice="#theURL#/NillableWS.cfc?wsdl" method="test" 
          returnVariable="result">
  <cfinvokeargument name="alpha" value="foo">
  <cfinvokeargument name="beta" omit="yes">
  <cfinvokeargument name="carny" value="moo">
</cfinvoke>

<cfoutput>Result is #result#</cfoutput>