<!--- 
 Filename: InitCap.cfm
 Author: Raymond Camden
 Purpose: Caps the first 3 words
--->

<cfif thisTag.executionMode is "start">
    <style>
	p:first-line { text-transform: uppercase; }
	</style>
	<p>
<cfelse>
    </p>
</cfif>
