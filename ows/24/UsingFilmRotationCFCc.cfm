<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- 
 Filename: UsingFilmRotationCFCc.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates storage of CFC instances in shared memory scopes, now with init.
--->

<html>
<head>
 <title>Using FilmRotationCFC</title>
</head>

<body>
<!--- If an instance of the FilmRotatorCFC component hasn't been created --->
<!--- yet, create a fresh instance and store it in the APPLICATION scope --->
<cfset rotInterval = 10>
<cfif not isDefined("APPLICATION.filmRotatorc")>
 <cfset APPLICATION.FilmRotatorc = new FilmRotationCFCc(datasource="ows",rotationInterval="#variables.rotInterval#")>
</cfif>

<!--- Invoke the GetCurrentFilmID() method of the FilmRotator CFC object --->
<cfset featuredFilmID = Application.filmRotatorc.getCurrentFilmID()>

<p>The callout at the right side of this page shows the currently featured film. 
The featured film changes every <cfoutput>#variables.rotInterval#</cfoutput> seconds. 
Just reload the page to see the next film in the sequence. 
The sequence will not change until the ColdFusion server is restarted.</p> 
 
<!--- Show the current film in a callout, via custom tag ---> 
<cf_ShowMovieCallout
 filmID="#featuredFilmID#">

</body>
</html>
