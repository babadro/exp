<!--- Create a 400x400-pixel image. --->
<cfset myImage=imageNew("",400,400)>

<cfset imageSetDrawingColor(myImage,"yellow")>

<!--- Turn on antialiasing to improve image quality. --->
<cfset imageSetAntialiasing(myImage)/>

<!--- Translate the origin to (100,100). --->
<cfset imageTranslateDrawingAxis(myImage,200,200)/>

<!--- draw a rectangle and keep rotating the axis to make flower --->
<cfset i = 15/>
<cfloop condition="i LESS THAN OR EQUAL TO 360">
	<cfset imageRotateDrawingAxis(myImage,i,10,10)>
	<cfset i += 15/>
	<!--- Draw a rectangle at the offset location. --->
	<cfset imageDrawRect(myImage,0,0,50,75)>
</cfloop>

<!--- Display the image in a browser. --->
<cfimage source="#myImage#" action="writeToBrowser">