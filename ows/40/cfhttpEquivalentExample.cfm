<cfscript> 
   /* Author: Charlie Arehart -- carehart.org
      Performs the equivalent of CFHTTP against google.com*/

    httpService = createobject("component","http"); 
	
	// see the chapter for other ways to initalize the CFC

    httpService.setUrl("http://www.google.com");
	
	/* set ResolveURL="true", just as with CFHTTP, so that any
	images or other paths returned in the html are set to be
	relative to the server from which the URL's' been requested
	*/
	
	httpService.setResolveURL("true"); 
    result = httpService.send().getPrefix();
	
	// output result just like as with cfhttp.filecontent
	
	writeoutput(result.filecontent); 
</cfscript>
