<cfsilent>
<!---####
  File name: threads.cfm
  Description: Demonstrates <cfthread>.
  Assumptions: None
  Usage: http://localhost:8500/ows/26/threads.cfm?numOfThreads=5
  Author name and e-mail: Sarge (sarge@sargeway.com) www.sargeway.com/blog/
  Date Created: September 11, 2007
  Updated: March 19, 2010
####--->
<cfparam name="URL.numOfThreads" default="5" type="integer" />
<cfloop index="i" from="1" to="#URL.numOfThreads#">
  <cfthread name="thread#i#" action="run" loopCtr="#i#"> 
    <!---#### Initialize Thread-local scope variable. ####--->
    <cfset counter = 0 />

    <!---#### Initialize Thread scope variables.  --->
    <cfset THREAD.ctr = 0 />
    <cfset THREAD.message = THREAD.name & " is initialized..." />

    <!---#### Suspend all even numbered threads for 1/2 second. ####--->
    <cfif NOT ATTRIBUTES.loopCtr % 2>
       <cfset THREAD.message = THREAD.name & " is sleeping..." />
	   <cfimage action = "captcha" 
    		height = "100" 
            text = "text string" 
            width = "150" 
            fontSize = "12"><cfflush> 
       <cfthread action="sleep" duration="500" />
    </cfif>
    <!---#### Update thread-level variable as loop counter. ####--->
    <cfloop index="j" from="1" to="3000">
      <cfset counter = j />
    </cfloop>
    <cfset THREAD.ctr = counter />
  </cfthread>
</cfloop>

<!---#### Suspend page-level processing to allow threads to process. ####--->
<cfset sleep(5) />
</cfsilent>
<html>
  <head><title>ColdFusion 9: Thread Generator</title></head>
  <body>
<cfoutput>
  <cfloop index="k" from="1" to="#structCount(cfthread)#">
  	<cfsilent>
<!---#### Create a deep copy of the CFTHREAD scope to handle thread variables. ####--->
      <cfset VARIABLES.demoThread = duplicate(cfthread["thread"&k]) />
	</cfsilent>
    <p>#VARIABLES.demoThread.name#
    <ul id="threadList" type="disc">
      <li>Status: #VARIABLES.demoThread.status#</li>
      <cfif VARIABLES.demoThread.status neq "NOT_STARTED">
        <li>Started: #VARIABLES.demoThread.starttime#</li>
        <li>Message: #VARIABLES.demoThread.message#</li>
        <li>Counter value: #VARIABLES.demoThread.ctr#</li>
      </cfif>
      <li>Total Run Time: #VARIABLES.demoThread.elapsedTime#ms</li>
    </ul><cfflush />
  </cfloop>
</cfoutput>
</body>
</html>
