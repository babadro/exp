<!--- Author: Charlie Arehart -- carehart.org --->
<!--- Exception handling demo --->

<cfset filename="test.txt">
<!--- Tag-based --->
<cftry>
  <cfset result = FileOpen(expandpath(filename))>
  <p>It worked!</p>

  <cfcatch type="Expression">
    <p>An Expression exception was thrown.</p>
	<cfoutput>#cfcatch.message#</cfoutput>
    <!--- could use cfmail, cfquery, or other tags --->
  </cfcatch>
  <cfcatch type="Security">
    <p>A Security exception was thrown.</p>
	<cfoutput>#cfcatch.message#</cfoutput>
    <!--- could use cfmail, cfquery, or other tags --->
	<!--- note use of optional rethrow below, to pass the error 
	   to the next higher error handler, if any --->
	<cfrethrow>
</cfcatch>  
</cftry>

<cfscript>
  // Script-based
  try {
    result = FileOpen(expandpath(filename));
    WriteOutput("<p>It worked!</p>");
  }
  catch(Expression exceptionVariable) {
    WriteOutput("<p>An Expression exception was thrown.</p> 
      <p>#exceptionVariable.message#</p>");
	// could use mail, query, or other script-based tag equivalents
  }
  catch(Security exceptionVariable) {
    WriteOutput("<p>A Security exception was thrown.</p>
      <p>#exceptionVariable.message#</p>");
	// could use mail, query, or other script-based tag equivalents
	/* note use of optional rethrow below, to pass the error 
	   to the next higher error handler, if any */ 
	rethrow;
  }
</cfscript>