<cftry>
<cfsilent>
<!---####
  File name: watcher.cfm
  Description: Demonstrates joining and terminating threads, as well as exception handling.
  Assumptions: Timeout requests disabled or set higher than URL.timeout value.
  Usage: http://localhost:8500/ows/26/watcher.cfm?timeout=5000&ctr=5
  Author name and e-mail: Sarge (sarge@sargeway.com) www.sargeway.com/blog/
  Date Created: September 11, 2007
  Updated: March 19, 2010
####--->
<cfparam name="URL.timeout" default="10000" type="integer" />
<cfparam name="REQUEST.ctr" default="0" type="integer" />

<!---#### Dynamic name value ####--->
<cfset variables.dynThreadName = createUUID() /> 

<!---#### Create dynamically named threads to prevent deadlocks ####--->
<cfthread name="#dynThreadName#" action="run" priority="high">
  <cftry>
    Current thread loop count: 
    <cfinclude template="runaway.cfm" />

    <!---#### Demonstrate thread and included template share Request scope. ####--->
    <cfset Thread.ctr = Request.ctr>
    <cfoutput>#Thread.ctr#</cfoutput>
    <cfcatch type="any">
      <!---#### Throw thread-specific exception to page-thread for handling. ####
      <cfthrow message="#cfcatch.Message#" detail="#cfcatch.Detail#" />--->
    </cfcatch>
  </cftry>
</cfthread> 

<!---#### Create a pointer to dynamic thread in the CFTHREAD scope to
     handle thread variables. ####--->
<cflock name="#variables.dynThreadName#" type="readonly" throwontimeout="yes" timeout="5">
  <cfset Variables.demoThread = CFTHREAD[variables.dynThreadName] /> 
</cflock>
</cfsilent>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>ColdFusion 9: Runaway threads</title>
</head>

<body><!---#### Display available Request variable and Thread scope metadata. ####--->
<cfoutput><p>REQUEST.ctr = #Request.ctr#<br />
  Thread  spawned at #timeFormat(Variables.demoThread.starttime, "full")#<br />
  Current status: #Variables.demoThread.status# (#Variables.demoThread.elapsedTime#ms)<br />
  Suspending page thread for #URL.timeout/1000# seconds....</p>
</cfoutput>
<cfflush>

<!---#### Suspend page-level thread until timeout is reached. ####--->
<cfthread action="join" name="#Variables.demoThread.name#" timeout="#URL.timeout#" />

<!---#### Kill thread if it runs beyond the timeout. ####--->
<cfif FindNoCase("RUNNING", Variables.demoThread.status)>
  <cfoutput>Thread #Variables.demoThread.name# is still running after #Variables.demoThread.elapsedTime/1000# seconds<br /></cfoutput><cfflush>
  <cflock name="runaway_killer" type="EXCLUSIVE" throwontimeout="yes" timeout="5">
    <cfthread action="terminate" name="#Variables.demoThread.name#" />
    <!---#### Log the killed thread. ####--->
    <cflog application="yes" date="yes" file="threads" time="yes" thread="yes" text="#variables.dynThreadName# terminated!" />
  </cflock>
  <cfoutput>Thread #Variables.demoThread.name# killed at #timeFormat(now(), "full")#<br /></cfoutput>
</cfif>

<!---#### Check value of Request variable. ####--->
<p><cfoutput>REQUEST.ctr = #Request.ctr#</cfoutput><cfflush>
 <!---#### Display available Thread output. ####--->
<cfif len(trim(Variables.demoThread.output))><cfoutput><br />Thread output: #Variables.demoThread.output#</cfoutput></cfif></p>
 <!---#### Dump the Thread scope ####--->
<cfdump label="#Variables.demoThread.name#" var="#Variables.demoThread#">
</body>
</html>

<cfcatch type="any">
  <!---#### Determine if the CFTHREAD scope is populated. ####--->
  <cfif structCount(CFTHREAD)>
  <!---#### Kill spawned thread in event of any page-level exception. ####--->
    <cflock name="runaway_killer" type="EXCLUSIVE"  throwontimeout="yes" timeout="5">
      <cfthread name="#dynThreadName#" action="terminate" /> 
      <!---#### Dump the Thread scope Error data. ####--->
      <cfdump var="#cfthread[variables.dynThreadName].Error#">
      <!---#### Log the killed thread. ####--->
    </cflock>
    <cflog application="yes" date="yes" file="threads" time="yes" thread="yes" text="#variables.dynThreadName# terminated!" />
  </cfif>
  <cfdump var="#cfcatch#">
</cfcatch>
</cftry>
