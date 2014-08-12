<cfset numberOfSteps = 5>

<cfif not isDefined("session.movWiz")>
	<cfset session.movWiz = structNew()>
	<cfset session.movWiz.stepNum = 1>
	<cfset session.movWiz.movieTitle = "">
	<cfset session.movWiz.pitchText = "">
	<cfset session.movWiz.directorID = "">
	<cfset session.movWiz.ratingID = "">
	<cfset session.movWiz.actorIDs = "">
	<cfset session.movWiz.starActorID = "">
</cfif>

<cfif isDefined("form.MovieTitle")>
	<cfset session.movWiz.movieTitle = form.movieTitle>
	<cfset session.movWiz.pitchText = form.pitchText>
	<cfset session.movWiz.ratingID = form.ratingID>
<cfelseif isDefined("form.directorID")>
	<cfset session.movWiz.directorID = form.directorID>
<cfelseif isDefined("form.actorID")>
	<cfset session.movWiz.actorIDs = form.actorID>
<cfelseif isDefined("form.starActorID")>
	<cfset session.movWiz.starActorID = form.starActorID>
</cfif>

<cfif isDefined("form.goBack")>
	<cfset session.movWiz.stepNum = url.stepNum - 1>
<cfelseif isDefined("form.goNext")>
	<cfset session.movWiz.stepNum = url.stepNum + 1>
<cfelseif isDefined("form.goDone")>
	<cflocation url="NewMovieCommit.cfm">
</cfif>

<html>
<head><title>New Movie Wizard</title></head>
<body>

<cfoutput>
	<b>New Movie Wizard</b><br>
	Step #session.movWiz.stepNum# of #NumberOfSteps#<br>
</cfoutput>

<cfform action="NewMovieWizard.cfm?stepNum=#session.movWiz.stepNum#" method="post">
	<cfswitch expression="#session.movWiz.stepNum#">
		<cfcase value="1">
			<cfquery name="getRatings" dataSource="ows">
				SELECT RatingID, Rating FROM FilmsRatings ORDER BY RatingID
			</cfquery>
			What is the title of the movie?<br>
			<cfinput name="MovieTitle" size="50" value="#SESSION.movWiz.MovieTitle#">
			<p>Type "pitch"</p>
			<cfinput name="pitchText" size="50" value="#SESSION.movWiz.pitchText#">
			<p>Select rating:<br></p>
			<cfloop query="getRatings">
				<cfset isChecked = ratingID EQ SESSION.movWiz.ratingID>
				<cfinput type="radio" name="ratingID" checked="#isChecked#" value="#ratingID#">
				<cfoutput>#rating#<br></cfoutput>
			</cfloop>
		</cfcase>
		<cfcase value="2">
			<cfquery name="getDirectors">
				SELECT DirectorID, FirstName || ' ' || LastName As FullName FROM Directors ORDER BY LastName
			</cfquery>
			Who will be directing the movie?<br>
			<cfselect
			size="#getDirectors.recordCount#"
			query="getDirectors"
			name="directorID"
			display="FullName"
			Value="directorID"
			selected="#session.movWiz.directorID#"/>
					
		</cfcase>
		<cfcase value="3">
			<cfquery name="getActors" dataSource="ows">
				SELECT * FROM Actors ORDER BY NameLast
			</cfquery>
			What Actors will be in the movie?<br>
			<cfloop query="GetActors">
				<cfset isChecked=listFind(session.MovWiz.actorIDs, actorID)>
				<cfinput type="checkbox" name="actorID" value="#actorID#" checked="#isChecked#">
				<cfoutput>#nameFirst# #nameLast#</cfoutput><br>
			</cfloop>
		</cfcase>
		<cfcase value="4">
			<cfif session.movWiz.actorIDs EQ "">
				Please choose actor
			<cfelse>
				<cfquery name="getActors" dataSource="ows">
					SELECT * FROM Actors WHERE ActorID IN (#session.movWiz.ActorIDs#) ORDER BY NameLast
				</cfquery>
				Who is star?<br>
				<cfloop query="getActors">
					<cfset isChecked = SESSION.movWiz.starActorID EQ actorID>
					<cfinput type="radio" name="starActorID" value="#actorID#" checked="#isChecked#">
					<cfoutput>#nameFirst# #nameLast#</cfoutput><br>					
				</cfloop>
			</cfif>
		</cfcase>
		<cfcase value="5">
			Finish!
			<cfoutput>#SESSION.movWiz.RatingID#</cfoutput>
			<cfoutput>#SESSION.movWiz.ratingID#</cfoutput>
		</cfcase>
		
	</cfswitch>
	
	<p>
		<cfif SESSION.movWiz.stepNum GT 1>
			<input type="submit" name="goBack" value="&lt;&lt; Back">
		</cfif>
		<cfif SESSION.movWiz.stepNum LT numberOfSteps>
			<input type="submit" name="gonext" value="Next &gt;&gt;">
		<cfelse>
			<input type="submit" name="goDone" value="Finish">
		</cfif>
	</p>
</cfform>

</body>
</html>