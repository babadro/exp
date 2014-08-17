<cfset feedurl = "http://www.coldfusionjedi.com/rss.cfm">
<cffeed action="read" source="#feedurl#" 
		properties="meta" query="entries">

<cfdump var="#meta#">

<cfoutput query="entries">
<p>
<a href="#rsslink#">#title#</a> 
(#dateFormat(publisheddate)#)<br />
#content#
</p>
</cfoutput>
