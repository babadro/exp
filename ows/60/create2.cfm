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

<cfset queryAddColumn(films, "rsslink", arrayNew(1))>
<cfloop query="films">
	<cfset querySetCell(films, "rsslink", 
	"http://localhost/ows/film.cfm?id=#filmid#",currentRow)>
</cfloop>

<!--- create a mapping from films query to rss columns --->
<cfset cmap = structNew()>
<cfset cmap.publisheddate = "dateintheaters">
<cfset cmap.title = "movietitle">
<cfset cmap.content = "pitchtext">

<cffeed action="create" properties="#meta#" query="#films#"
		columnMap="#cmap#" xmlVar="feedXML">
		
<cfcontent type="text/xml" reset="true">
<cfoutput>#feedxml#</cfoutput>
