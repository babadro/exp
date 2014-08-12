<!---
Name:        json1.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: JSON example
--->

<cfset string = "Jeanne,Jacob,Lynn,Noah">
<cfset array = ["Darth","Fetch","Nick","HDTV","Dharma"]>
<cfset struct = {name="Raymond",cool=true,age=34}>

<cfquery name="query" maxrows="4">
	select	filmid, movietitle, summary
	from	films
	order by movietitle asc
</cfquery>
    
<cfset json_string = serializeJSON(string)>
<cfset json_array = serializeJSON(array)>
<cfset json_struct = serializeJSON(struct)>
<cfset json_query = serializeJSON(query)>

<cfif isJSON(json_string)>
    <p>
    Yes, json_string is a JSON string.
    </p>
</cfif>

<cfoutput>
<p>
json_string=#json_string#
</p>
<p>
json_array=#json_array#
</p>
<p>
json_struct=#json_struct#
</p>
<p>
json_query=#json_query#
</p>
</cfoutput>

<cfset rString = deserializeJSON(json_string)>
<cfset rArray = deserializeJSON(json_array)>
<cfset rStruct = deserializeJSON(json_struct)>
<cfset rQuery = deserializeJSON(json_query)>

<cfdump var="#rString#">
<cfdump var="#rArray#">
<cfdump var="#rStruct#">
<cfdump var="#rQuery#"> 