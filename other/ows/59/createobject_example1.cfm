<cfscript>
/* Construct the URL dynamically */
if (not findNoCase("https", cgi.server_protocol))
  theURL = "http://";
else
  theURL = "https://";
    
/* Add the server and current path */
theURL = theURL & cgi.server_name & ":" & cgi.server_port & cgi.script_name;

/* Now remove this file's name, which is at the end */
theURL = listDeleteAt(theURL, listLen(theURL,"/"), "/");

// Initialize the input parameter
num = "4";

// Instantiate the Web Service
ws = createObject("webservice", "#theURL#/NumericString.cfc?wsdl");

// Call the Web Service's integerToString method
result = ws.integerToString(num);
</cfscript>

<cfoutput>The number #num# as a string is #result#.</cfoutput>