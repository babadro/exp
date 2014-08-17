<!--- Struct to contain metadata --->
<cfset meta = structNew()>
<cfset meta.title = structNew()>
<cfset meta.title.value = "Orange Whip Studios Films">
<cfset meta.link = arrayNew(1)>
<cfset meta.link[1] = structNew()>
<cfset meta.link[1].href = "http://localhost/ows">
<cfset meta.description = "Latest Films">
<cfset meta.version = "atom_1.0">

<cfquery name="films" datasource="ows" maxrows="10">
select	filmid, movietitle, pitchtext, dateintheaters
from	films
order by dateintheaters desc
</cfquery>

<cfset queryAddColumn(films, "linkhref", arrayNew(1))>
<cfloop query="films">
	<cfset querySetCell(films, "linkhref", 
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
