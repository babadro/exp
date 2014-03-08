<cfset NumberOfSteps = 6>

<cfif not isDefined("SESSION.movWiz")>
	<cfset SESSION.movWiz = structNew()>
	<cfset SESSION.movWiz.stepNum = 1>
	<cfset SESSION.movWiz.movieTitle = "">
	<cfset SESSION.movWiz.pitchText = "">
	<cfset SESSION.movWiz.directorID = "">
	<cfset SESSION.movWiz.directorSal = "">
	<cfset SESSION.movWiz.ratingID = "">
	<cfset SESSION.movWiz.actorIDs = "">
	<cfset SESSION.movWiz.staractorID = "">
	<cfset SESSION.movWiz.miscExpense = "">
	<cfset SESSION.movWiz.actorSals = structNew()>
</cfif>

<cfif isDefined("Form.movieTitle")>
	<cfset SESSION.movWiz.movieTitle = Form.movieTitle>
	<cfset SESSION.movWiz.pitchText = Form.pitchText>
	<cfset SESSION.movWiz.ratingID = Form.ratingID>
<cfelseif isDefined("Form.directorID")>
	<cfset SESSION.movWiz.directorID = Form.directorID>
<cfelseif isDefined("Form.actorID")>
	<cfset SESSION.movWiz.actorIDs = Form.actorID>
<cfelseif isDefined("Form.starActorID")>
	<cfset SESSION.movWiz.staractorID = Form.starActorID>
<cfelseif isDefined("Form.directorSal")>
	<cfset SESSION.movWiz.directorSal = Form.directorSal>
	<cfset SESSION.movWiz.miscExpense = Form.miscExpense>
	<cfloop LIST="#SESSION.movWiz.actorIDs#" index="thisActor">
		<cfset SESSION.movWiz.actorSals[thisActor] = FORM["actorSal#thisActor#"]>
	</cfloop>
</cfif>

<cfif isDefined("FORM.goBack")>
	<cfset SESSION.movWiz.stepNum = URL.stepNum - 1>
<cfelseif isDefined("FORM.goNext")>
	<cfset SESSION.movWiz.stepNum = URL.stepNum + 1>
<cfelseif isDefined("FORM.goDone")>
	<cflocation url="NewMovieCommit2.cfm">
</cfif>

<html>
<head><title>New Movie Wizard</title></head>
<body>

<cfoutput>
	<b>New Movie Wizard</b>
	Step #SESSION.movWiz.stepNum# of #numberOfSteps#<br>
</cfoutput>

<cfform action="NewMovieWizard2.cfm?StepNum=#SESSION.movWiz.StepNum#" method="POST">
	<cfswitch expression="#SESSION.movWiz.stepNum#">
		<cfcase value="1">
			
			<cfquery name="getRatings" datasource="ows">
				SELECT ratingID, Rating FROM FilmsRatings ORDER BY ratingID
			</cfquery>
			
			What is the title of the movie?<br>
			<cfinput name="movieTitle" size="50" required="Yes" message="PLease don't leave the movie title blank." value="#SESSION.movWiz.movieTitle#">
			
			<p>What is the "pitch" for the movie?</p>
			<cfinput name="pitchText" size="50" required="Yes" message="Please provide the pitch text first." value="#SESSION.movWiz.pitchText#">
			
			<p>Please select the rating:</p>
			<cfloop query="getRatings">
				<cfset isChecked = ratingID EQ SESSION.movWiz.ratingID>
				<cfinput type="radio" name="ratingID" checked="#isChecked#" value="#ratingID#"><cfoutput>#rating#<br></cfoutput>
			</cfloop>	
		</cfcase>
		
		<cfcase value="2">
			<cfquery name="getDirectors" datasource="ows">
				SELECT directorID, FirstName || ' ' || LastName AS FullName FROM Directors ORDER BY LastName
			</cfquery>
			
			Who will be directing the movie?<br>
			<cfselect size="#getDirectors.recordCount#" query="getDirectors" name="directorID" display="fullName" value="directorID" required="YES"
			message="You must choose a director first." selected="#SESSION.movWiz.directorID#"/>
		</cfcase>
		
		<cfcase value="3">
			<cfquery name="getActors" datasource="ows">SELECT * FROM Actors ORDER BY NameLast</cfquery>
			
			What actor will be in the movie?<br>
			<cfloop query="getActors">
				<cfset isChecked = listFind(SESSION.movWiz.actorIDs, actorID)>
				<cfinput type="checkbox" name="actorID" value="#actorID#" required="Yes" message="You must choose at least one actor first." checked="#isChecked#">
				<cfoutput>#nameFirst# #nameLast#<br></cfoutput>
			</cfloop>
		</cfcase>
		
		<cfcase value="4">
			<cfif SESSION.movWiz.actorIDs EQ "">
				Please go back to the last step and choose at least one actor or actress to be in the movie.
			<cfelse>
				<cfquery name="getActors" datasource="ows">SELECT * FROM Actors WHERE actorID in (#SESSION.movWiz.actorIDs#) ORDER BY NameLast</cfquery>
				Which one of the actors will get top billing?<br>
				<cfloop query="getActors">
					<cfset isChecked = SESSION.movWiz.StarActorID EQ actorID>
					<cfinput type="radio" name="staractorID" value="#actorID#" required="Yes" message="Please select the starring actor first." checked="#isChecked#">
					<cfoutput>#NameFirst# #NameLast#<br></cfoutput>
				</cfloop>
			</cfif>
		</cfcase>
		
		<cfcase value="5">
			<cfquery name="getActors" datasource="ows">SELECT * FROM Actors WHERE actorID IN (#SESSION.movWiz.actorIDs#) ORDER BY NameLast</cfquery>
			<p>How much will we pay the Director?</p>
			<cfinput type="text" size="10" name="directorSal" required="Yes" validate="float"
			message="Please provide a number for the director's salary." value="#SESSION.movWiz.directorSal#">
			
			<p>How much will we pay the Actors?</p>
			<cfloop query="getActors">
				<cfif not structKeyExists(SESSION.movWiz.actorSals, actorID)><cfset SESSION.movWiz.actorSals[actorID] = ""></cfif>
				<cfinput type="text" size="10" name="actorSal#actorID#" required="Yes" validate="float"
				message="Please provide a number for each actor's salary." value="#SESSION.movWiz.actorSals[actorID]#">
				<cfoutput>For #nameFirst# #nameLast#<br></cfoutput>
			</cfloop>
			
			<p>How much other money will be needed for the budget?</p>
			<cfinput type="text" name="miscExpense" required="Yes" validate="float" message="Please provide a number for additional expenses."
			size="10" value="#SESSION.movWiz.miscExpense#">
		</cfcase>
		
		<cfcase value="6">
			You have successfully finished the New Movie Wizard.<br>
			Click the Finish button to add the movie to the database<br>
			Click back if you need to change anything<br>
		</cfcase>
	</cfswitch>
	
	<cfif SESSION.movWiz.stepNum gt 1>
		<INPUT type="Submit" name="goBack" value="&lt;&lt; Back">
	</cfif>
	<cfif SESSION.movWiz.stepNum LT numberOfSteps>		
		<input type="Submit" name="goNext" value="Next &gt;&gt;">
	<cfelse>
		<input type="submit" name="goDone" value="Finish">
	</cfif>
</cfform>

</body>
</html>