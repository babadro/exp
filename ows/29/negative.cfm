<cfset filename = expandPath("benfortalarge.jpg")>

<cfimage
	action="read"
	name="myimage"
	source="#filename#">
	
<cfset ImageNegative(myimage)>
	
<cfimage
	action="writeToBrowser"
	source="#myimage#">		