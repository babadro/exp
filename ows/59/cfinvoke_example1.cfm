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

<!--- Invoke the web service --->
<cfinvoke webservice="#theURL#/NumericString.cfc?wsdl" 
          method="integerToString" numberNumeric="#randRange(0,9)#"
          returnVariable="result">

<cfoutput>Result of web service call: #result#</cfoutput>

<p>

<!--- now do a simple CFC call --->
<cfinvoke component="NumericString" 
          method="integerToString" numberNumeric="#randRange(0,9)#"
          returnVariable="result">

<cfoutput>Result of component call: #result#</cfoutput>
