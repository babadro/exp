<cfset TotalBudget = SESSION.movWiz.miscExpense + SESSION.movWiz.directorSal>

<cfloop list="#SESSION.movWiz.ActorIDs#" index="ThisActor">
	<cfset thisSal = SESSION.movWiz.ActorSals[thisActor]>
	<cfset totalBudget = totalBudget + thisSal>
</cfloop>

<cftransaction>
	<cfquery datasource="ows">
		INSERT INTO Films (
		MovieTitle, PitchText, RatingID, AmountBudgeted)
		VALUES (
		'#SESSION.movWiz.movieTitle#', '#SESSION.movWiz.pitchText#', #SESSION.movwiz.ratingID#, #totalBudget#)
	</cfquery>
	
	<cfquery datasource="ows" name="getNew">
		SELECT Max(FilmID) AS NewID FROM Films
	</cfquery>
</cftransaction>

<cfquery datasource="ows">
	INSERT INTO FilmsDirectors (FilmID, DirectorID, Salary) VALUES (#getNew.newID#, #SESSION.movWiz.directorID#, #SESSION.movwiz.directorSal#)
</cfquery>

<cfloop list="#SESSION.movWiz.actorIDs#" index="thisActor">
	<cfset isStar = iif(thisActor EQ SESSION.movWiz.starActorID, 1, 0)>
	<cfquery datasource="ows">
		INSERT INTO FilmsActors (FilmID, ActorID, Salary, IsStarringRole) VALUES (#getNew.newID#, #thisActor#, #SESSION.movWiz.actorSals[thisActor]#, #isStar#)
	</cfquery>
</cfloop>

<cfset structDelete(SESSION, "movWiz")>

<html>
	<head><title>Movie Added</title></head>
	<body>
		<h2>Movie Added</h2>
		<p>The movie has been added to the database.</p>
		<p><a href="NewMovieWizard2.cfm">Enter Anoter Movie</a></p>
	</body>
</html>