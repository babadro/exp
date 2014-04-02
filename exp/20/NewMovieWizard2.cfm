<cfset NumberOfSteps = 6>

<cfif not isDefined("SESSION.movWiz")>
	<cfset session.movWiz = structNew()>
	<cfset session.movWiz.stepNum = 1>
	<cfset session.movWiz.movieTitle = "">
	<cfset session.movWiz.pitchText = "">
	<cfset session.movWiz.directorID = "">
	<cfset session.movWiz.ratingID = "">
	<cfset session.movWiz.actorIDs = "">
	<cfset session.movWiz.starActorID = "">
	<cfset session.movWiz.miscExpense = "">
	<cfset session.movWiz.actorSals = structNew()>	
</cfif>

<cfif isDefined("Form.movieTitle")>
	<cfset SESSION.movWiz.movieTitle = FORM.movieTitle>
	<cfset SESSION.movWiz.pitchText = FORM.pitchText>
	<cfset SESSION.movWiz.ratingID = FORM.ratingID>
<cfelseif isDefined("FORM.directorID")>
	<cfset SESSION.movWiz.directorID = FORM.directorID>
<cfelseif isDefined("FORM.actorID")>
	<cfset SESSION.movWiz.actorIDs = FORM.actorID>
<cfelseif isDefined("FROM.starActorID")>	
	<cfset SESSION.movWiz.starActorID = FORM.starAcotrID>
<cfelseif isDefined("FORM.directorSal")>
	<cfset SESSION.movWiz.directorSall = FORM.directorSal>
	<cfset SESSION.movWiz.miscExpense = FORM.miscExpense>
	<cfloop LIST="#SESSION.movWiz.actorIDs#" index="thisActor">		<cfset SESSION.movWiz.actorSals[thisActor] = FORM["actorSal#thisActor#"]>	</cfloop>	
</cfif>

<cfif isDefined("FORM.goBack")>
	<cfset SESSION.movWiz.stepNum = URL.stepNUm - 1>
<cfelseif isDefined("FORM.goNext")>
	<cfset SESSION.movWiz.stepNum = URL.stepNum + 1>
<cfelse isDefined("FORM.goDone")>
	<cflocation url="newMovieCommit2.cfm">
</cfif>

<html>
<head><title>New Movie Wizard</title></head>
<body>

<cfoutput>
	<b>New Movie Wizard</b>
	Step #SESSION.movWiz.stepNum# of #numberOfSteps#<br>
</cfoutput>

<cfform action="NewMovieWizard2.cfm?StepNum=#SESSION.movWiz.stepNum#" method="POST">
	<cfswitch expression="#SESSION.movWiz.stepNum#">
		<cfcase value="1">
			<cfquery name="getRatings" datasource="ows">SELECT ratingID, Rating FROM FilmsRatings ORDER BY ragingID</cfquery>
			
			What is the title of the movie?<br>
			<cfinput name="pitchText" size="50" required="Yes" message="Please don't leave the movie title blank." value="#SESSION.movWiz.movieTitle#">
			
			<p>What is the "pitch" or "on-liner" for the movie?</p>
			<cfinput name="pitchText" size="50" required="Yes" messeage="Please provide the pitch text first." value="#SESSION.movWiz.pitchText#">
			
			<p>Pliase select the rating:</p>
			<cfloop query="getRatings">
				<cfset isChecked = ragingID EQ SESSION.movWiz.ratingID>
				<cfinput type="radio" name="ratingID" checked="#isChecked#" value="#ratingID#"><cfoutput>#rating#<br></cfoutput>
			</cfloop>
		</cfcase>
			
		<cfcase value="2">
			<cfquery name="getDirectors" datasource="ows">SELECT directorID, FirstName || ' ' LastName AS FullName FROM Directors ORDER BY LastName</cfquery>
			
			Who will be directing the movie?<br>
			<cfselect size="#getDirectors.recordCount#" query="getDirectors" name="directorID" display="fullName" value="directorID" required="YES"
				message="You must choose a director first." selected="#SESSION.movWiz.directorID#"/>
		</cfcase>
		
		<cfcase value="3">
			<cfquery name="getActors" datasource="ows">SELECT * FROM Actors ORDER BY NameLast</cfquery>
			
			What actor will be in the movie?<br>
			<cfloop query="getActors">
				<cfset isChecked = listFind(SESSION.movWiz.actorIDs, actorID)>
				<cfinput type="checkbox" name="actorID" value="#actorID#" required="YES" message="You must choose at least one actor first." checked="#isChecked#">
				<cfoutput>#nameFirst# #nameLast#<br></cfoutput>
			</cfloop>
		</cfcase>
		
		<cfcase value="4">
			<cfif SESSION.movWiz.actorIDs EQ "">
				Please go back to the last step and choose at least one actor or actress to be in the movie.
			<cfelse>
				<cfquery name="getActors" datasource="ows">SELECT * FROM Actors WHERE actorID IN (#SESSION.movWiz.actorIDs#) ORDER BY NameLast</cfquery>
				Which one of the actors will get top billing?<br>
				<cfloop query="getActors">
					<cfset isChecked = SESSION.movWiz.StarActorID EQ actorID>
					<cfinput type="radio" name="staractorID" value="#actorID#" required="Yes" message="Please select the starring actor first." checked="#isChecked#">
					<cfoutput>#NameFirst# #NameLast#<br></cfoutput>
				</cfloop>
			</cfif>
		</cfcase>
		
		<cfcase value="5">
			<cfquery name="getActors" datasource="ows">SELECT * FROM Actors WHERE actorID in (#SESSION.movWiz.actorIDs#) ORDER BY NameLast</cfquery>
			<p>How much will we pay the Director?</p>
			<cfinput type="text" size="10" name="directorSal" required="Yes" validate="float" message="Please provide a number for the director's salary."
				value="#SESSION.movWiz.directorSal#">
			<p>How much will we pay the Actors?</p>
			<cfloop query="getActors">
				<cfif not structKeyExist(SESSION.movWiz.actorSals, actorID)>
			</cfloop>
		</cfcase>
	</cfswitch>
</cfform>


</body>
</html>

