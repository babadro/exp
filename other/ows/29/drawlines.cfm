<!--- Create the image variable --->
<cfset myImage = imageNew("",400,300) />
<!--- Set the drawing color to yellow. --->
<cfset ImageSetDrawingColor(myImage,"yellow") />
<!--- Turn on antialiasing to improve image quality. --->
<cfset ImageSetAntialiasing(myImage,"on") />
<cfset i=10>
<cfloop condition="i LESS THAN OR EQUAL TO 300">
   <cfset i += 10>
   <cfset x1 = 300-i>
   <cfset x2 = 290>
   <cfset y1 = 290>
   <cfset y2 = i>
   <cfset ImageDrawLine(myImage, x1, y1, x2, y2)>

</cfloop>
<!--- Draw the text --->
<cfset stAtrCollection = structNew() />
<cfset stAtrCollection.size = 25 />
<cfset stAtrCollection.style = "bold" />
<cfset ImageDrawText(myImage,"Cool Line Drawing",20,20,stAtrCollection) />
<!--- Display the image in a browser. --->
<cfimage action="writeToBrowser" source="#myImage#" />
