<!---
Name:        movieresults.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Dynamic search example
--->
<cfparam name="url.search" default="">

<cfinvoke component="movies" method="searchMovies" 
          search="#url.search#" returnVariable="results">
          
<table border="1">
    <tr>
        <td>Title</td><td>Summary</td>
    </tr>
    <cfoutput query="results">
    <tr>
        <td>#movietitle#</td>
        <td>#summary#</td>
    </tr>
    </cfoutput>
</table>