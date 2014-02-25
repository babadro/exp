<cfsilent>
<!---####
  File name: runaway.cfm
  Description: Creates a potentially infinite loop that will hang the current thread.
  Assumptions: None
  Usage: http://localhost:8500/ows/26/runaway.cfm
  Author name and e-mail: Sarge (sarge@sargeway.com) www.sargeway.com/blog/
  Date Created: September 11, 2007
  Updated: March 19, 2010
####--->
	<cfparam name="Request.ctr" default="0" type="integer" />
	<cfscript>
    	while (1==1) {
        	writeOutput(Request.ctr);
			++Request.ctr;
			sleep(10000);
			if (isDefined('URL.break'))
				break;
    	}
    </cfscript>
</cfsilent>