<!--- Author: Adam Phillip Churvis -- ProductivityEnhancement.com --->
<!--- Edited by: Charlie Arehart, carehart.org --->
<!--- Indexed For loop  --->

<!--- Tag-based --->
<cfset colorCodes = ["Red,Orange,Yellow"]>
<cfloop index="i" from="1" to="#ArrayLen(colorCodes)#">
   <cfoutput><p>#colorCodes[i]#</p></cfoutput>
</cfloop>

<cfscript>
   // Script-based
   colorCodes = ["Red,Orange,Yellow"];
   for(i=1; i <= ArrayLen(colorCodes); i=i+1) {
     WriteOutput("<p>" & colorCodes[i] & "</p>");
   }
</cfscript>
