<cfset filename = expandPath("benfortalarge.jpg")>

<cfimage
	action="read"
	name="myimage"
	source="#filename#">
	
<cfset imageFlip(myimage, "vertical")>
	
<cfimage
	action="writeToBrowser"
	source="#myimage#">