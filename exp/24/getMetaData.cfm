<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Get MetaData</title>
</head>

<body>
<!--- 
  getMetaData.cfm
  Demonstrate use of getMetaData() function
--->
<!--- instantiate the FilmSearchCFC object into cfcFilmSearch --->
<cfset cfcFilmSearch = new FilmSearchCFC()>
<!--- now get the metadata, into the ourMetaData function --->
<cfset ourMetaData = getMetaData(cfcFilmSearch)>

<cfoutput>
<!--- Show the displayName and size; we could also show the hint, 
  path, etc. --->
<h3>Welcome to the #ourMetaData.Name#!</h3>
Enjoy our #arrayLen(ourMetaData.functions)# functions:
<ul>
<!--- loop through and show each function's name; could also show 
   hint, parameters array, etc. but let's keep it simple. --->
<cfloop index="thisFunction" from="1" to="#arrayLen(ourMetaData.functions)#">
<li>#ourMetaData.functions[thisFunction].Name# - #ourMetaData.functions[thisFunction].Hint#</li>
</cfloop>
</ul>
</cfoutput>
</body>
</html>