<cfoutput>#left('idp11', 3)#</cfoutput>
<cfoutput>#listDeleteAt('Andrey Petrovich id23', listlen('Andrey Petrovich id23', ' '), ' ')#</cfoutput>
<cfset sentValue='Andrey Petrovich idp245'>
<cfset lastPartSentValue = listLast(sentValue, ' ')>
<cfoutput>#lastPartSentValue#<br></cfoutput>
<cfoutput>#Find('id', lastPartSentValue)#<br></cfoutput>
<cfset  retailerTable=left(lastPartSentValue, 3)>
<cfoutput>retailer table = #retailerTable#<br></cfoutput>
<cfset newRetailer_id=removeChars(lastPartSentValue, 1, 3)>
<cfoutput>newRetailer_id = #newRetailer_id#<br></cfoutput>



<cfset mystruct = structnew()>
<cfset mystruct = {21 = 42, "51.2" = "1.1"}>
<cfoutput>#mystruct["51.2"]#</cfoutput>
<cfdump var="#mystruct#">
<cfset myvar = 51.2>
<cfset st = structFind(mystruct, myvar)>
<cfoutput>#st#<br></cfoutput>


<cfset BontSizeArray = arrayNew(1)>
<cfloop collection=#APPLICATION.bontSizeRange# item="i">
	<cfset element = i & "/" & APPLICATION.bontSizeRange[i]>
	<cfset ArrayAppend(BontSizeArray, element)>
</cfloop>
<cfset arraySort(BontSizeArray, "textnocase", "asc")>
<cfset BontSizeList = arrayToList(BontSizeArray, ",")>
<cfdump var="#BontSizeArray#">
<cfoutput>#bontSizeList#</cfoutput>

<cffunction name="StructStringToList" description="Convert struct (with key = string and value = string) to list look like 'key1/value1,key2/value2 and so on...'" returntype="String">
	<cfargument name="originStruct" required="true">
		
	<cfset var arr = arrayNew(1)>
	<cfloop collection=#originStruct# item="i">
		<cfset var element = i & "/" & originStruct[i]>
		<cfset ArrayAppend(arr, element)>
	</cfloop>
	<cfset arraySort(arr, "textnocase", "asc")>
	<cfset var resultList = arrayToList(arr, ",")>
	<cfreturn resultList>
</cffunction>

<cfset NewestBontSizeList = StructStringToList(APPLICATION.bontSizeRange)>
<cfoutput><br>NewstBontSizeList = #NewestBontSizeList#<br></cfoutput>

<cfset newEuroSize = 40.5>
<cfset newBontSize = newEuroSize & "/" & structFind(APPLICATION.bontSizeRange, newEuroSize)>
<cfoutput>#newBontSize#<br></cfoutput>
<cfoutput>#structKeyExists(APPLICATION.bontSizeRange, "40.5")#</cfoutput>
<cfoutput>Удаление</cfoutput>