<!--- The Text to Search --->
<cfsavecontent variable="text">
Here is text with names and email address.
Ray's email is ray@camdenfamily.com,
Todd's email address is todd@cfsilence.com.
Lastly, Luke Skywalker's email address is luke@newalliance.gov.
</cfsavecontent>

<!--- Find all matches. --->
<cfset matches = reMatch("([\w._]+)@([\w_]+(\.[\w_]+)+)", text)>

<cfoutput>
<p>
There were #arrayLen(matches)# matches.
</p>

<p>
Matches:<br />
</cfoutput>

<cfloop index="match" array="#matches#">
	<cfoutput>#match#<br /></cfoutput>
</cfloop>