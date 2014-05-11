<cfoutput>#left('idp11', 3)#</cfoutput>
<cfoutput>#listDeleteAt('Andrey Petrovich id23', listlen('Andrey Petrovich id23', ' '), ' ')#</cfoutput>
<cfset sentValue='Andrey Petrovich idp245'>
<cfset lastPartSentValue = listLast(sentValue, ' ')>
<cfoutput>#lastPartSentValue#<br></cfoutput>
<cfoutput>#Find('id', lastPartSentValue)#<br></cfoutput>
<cfset  retailerTable=left(lastPartSentValue, 3)>
<cfoutput>retailer table = #retailerTable#<br></cfoutput>
<cfset newRetailer_id=removeChars(lastPartSentValue, 1, 3)>
<cfoutput>newRetailer_id = #newRetailer_id#</cfoutput>
