<!--- 
 Filename: getraysblog3.cfm
 Purpose: Get the index page from coldfusionjedi.com and display it
--->

<cfscript>
//Make the service
httpService = new http();

//Set attributes
httpService.setMethod("get");
httpService.setURL("http://www.coldfusionjedi.com");
httpService.setResolveURL(true);

//Fire the request!
result = httpService.send();

//data is stored in prefix
writeOutput(result.getPrefix().fileContent);
</cfscript>