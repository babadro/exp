<!--- 
 Filename: Execute.cfm
 Edited By: Raymond Camden
--->

<h2>&lt;cfexecute&gt; Demonstration</h2>
<p>
Please stand by, running a program!
</p>
<!--- lots of spaces to 'trick' the browser into displaying --->
<cfoutput>#repeatString(" ",250)#</cfoutput>
<cfflush/>

<!--- Call the system utility, with output placed in the file --->
<cfexecute name="ping" arguments="-c 2 coldfusionjedi.com" 
 timeout="15" variable="result" />
 
<!--- Display the contents of the file --->
<cfoutput>
 #htmlCodeFormat(result)#
</cfoutput>
