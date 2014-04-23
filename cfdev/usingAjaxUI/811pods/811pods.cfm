<html>
<head>
</head>
<body>
<cflayout name="theLayout" type="border" style="height:300;">
<cflayoutarea position="left" size="300" style="float:right;">
<cfpod width="300" name="theNews" title="All the latest news"
headerstyle="background-color:##DDAADD; font-size:large;
font-style:italic; color:black"
bodyStyle="background-color:##FFCCFF; font-family:sans-serif;
font-size:80%">
Contents of a news feed would go here.
</cfpod>
</cflayoutarea>
<cflayoutarea position="center" align="center" >
<cfpod name="theSports" width="500"
title="What's new in your favorite sports"
headerstyle="background-color:##AADDDD; font-size:large;
font-style:italic; color:black"
bodyStyle="background-color:##CCFFFF; font-family:sans-serif;
font-size:90%">
Contents of a sports feed would go here.
</cfpod>
</cflayoutarea>
<cflayoutarea position="right" size="302">
<cfpod width="300" height="20" name="thetime" title="The Weather"
source="podweather.cfm"
headerstyle="background-color:##DDAADD; font-style:italic;
color:black"
bodyStyle="background-color:##FFCCFF; font-family:sans-serif;
font-size:80%" />
<cfpod width="300" name="thestocks" title="What's new in business"
headerstyle="background-color:##DDAADD; font-size:large;
color:black; font-style:italic"
bodyStyle="background-color:##FFCCFF; font-family:sans-serif;
font-size:80%">
Contents of a news feed would go here.
</cfpod>
</cflayoutarea>
</cflayout>
</body>
</html>
