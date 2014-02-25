<!--- Struct to contain metadata --->
<cfset meta = structNew()>
<cfset meta.title = "Orange Whip Studios Films">
<cfset meta.link = "http://localhost/ows">
<cfset meta.description = "Latest Films">
<cfset meta.version = "rss_2.0">

<cfquery name="films" datasource="ows" maxrows="10">
select	filmid, movietitle, pitchtext, dateintheaters
from	films
order by dateintheaters desc
</cfquery>

<!--- create a mapping from films query to rss columns --->
<cfset cmap = structNew()>
<cfset cmap.publisheddate = "dateintheaters">
<cfset cmap.title = "movietitle">
<cfset cmap.content = "pitchtext">

<cffeed action="create" properties="#meta#" query="#films#"
		columnMap="#cmap#" xmlVar="feedXML">
		
<cfcontent type="text/xml" reset="true">
<cfoutput>#feedxml#</cfoutput>
