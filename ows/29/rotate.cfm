<cfset filename = expandPath("benfortalarge.jpg")>

<cfimage
	action="read"
	name="myimage"
	source="#filename#">
	
<cfset imageRotate(myimage, "90")>
	
<cfimage
	action="writeToBrowser"
	source="#myimage#">