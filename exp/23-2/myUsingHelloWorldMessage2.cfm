<cfset attribs = structNew()>
<cfset attribs.message = "Fuck you, beach!">
<cfset attribs.topColor = "brown">
<cfset attribs.bottomColor = "red">

<cfmodule template="/ydcustomtags/myHelloWorldMessage2.cfm" attributeCollection="#attribs#">
