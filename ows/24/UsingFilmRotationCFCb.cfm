<!--- 
 Filename: UsingFilmRotationCFCc.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates storage of CFC instances in shared memory scopes
--->

<html>
<head>
 <title>Using FilmRotationCFC</title>
</head>

<body>

<!--- If an instance of the FilmRotatorCFC component hasn't been created --->
<!--- yet, create a fresh instance and store it in the SESSION scope --->
<cfif not isDefined("SESSION.myFilmRotator")>
 <cfset SESSION.myFilmRotator = new FilmRotationCFC()>
 
 <!--- Rotate films every ten seconds ---> 
 <cfset SESSION.myFilmRotator.rotationInterval = 10> 
</cfif>

<!--- Display message --->
<cfoutput>
 <p>
 The callout at the right side of this page shows the currently featured film. 
 Featured films rotate every #SESSION.myFilmRotator.rotationInterval# seconds. 
 Just reload the page to see the next film in the sequence. 
 The sequence will not change until the web session ends.</p>
 The next film rotation will occur at: 
 #timeFormat(SESSION.myFilmRotator.currentUntil, "h:mm:ss tt")#
</cfoutput>
 
<!--- Show the current film in a callout, via custom tag ---> 
<cf_ShowMovieCallout filmID="#SESSION.myFilmRotator.getCurrentFilmID()#">

</body>
</html>
