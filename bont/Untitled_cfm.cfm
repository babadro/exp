<!--- Set two lists, each with the data for a grid column. --->
<cfset cities = "Rome,Athens,Canberra,Brasilia,Paris">
<cfset countries = "Italy,Greece,Australia,Brazil,France">
<cfform name = "cities">
<cfgrid name="GeoGrid" autowidth = "yes" vspace = "4" height = "120"
font="tahoma" rowheaders="no">
<cfgridcolumn name="City" header="City">
<cfgridcolumn name="Country" header="Country">
<!--- Loop through the lists using cfgridrow to poplulate the grid. --->
<cfloop index="i" from="1" to="#ListLen(cities)#">
<cfgridrow data ="#ListGetAt(cities, i)#,#ListGetAt(countries, i)#">
</cfloop>
</cfgrid><br><br>
</cfform>