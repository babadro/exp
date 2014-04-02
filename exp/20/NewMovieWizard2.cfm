<cfset NumberOfSteps = 6>

<cfif not isDefined("SESSION.movWiz")>
	<cfset session.movWiz = structNew>
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

