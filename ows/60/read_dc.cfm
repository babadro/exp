<cfset feedurl="http://www.pheed.com/pheed/example.rss">
<cffeed action="read" source="#feedurl#"
		properties="meta" query="entries">

<cfdump var="#meta#">		
<cfdump var="#entries#">