<cfif (not isDefined("Application.movieRotation")) or (dateCompare(Application.movieRotation.currentUntil, now()) eq -1)>
	<cflock scope="Application" type="Exclusive" timeout="10">
		<cfif not isDefined("Application.movieRotation")>
			<cfquery name="GetFilmIDs" dataSource="#Request.dataSource#">
				SELECT FilmID From Films ORDER BY MovieTitle
			</cfquery>
			<cfset st = structNew()>
			<cfset st.movieList = valueList(GetFilmIDs)>
			<cfset st.currentPos =1>
		<cfelse>
			<cfset st = Application.movieRotation>
			<cfif st.currentPos LT listLen(st.movieList)>
				<cfset st.currentPos = st.currentPos + 1>
			<cfelse>
				<cfset currentPos = 1>
			</cfif>
		</cfif>
		
		<cfset st.currentMovie = listGetAt(st.movieList, st.currentPos)>
		<cfset st.currentUntil = dateAdd("s", 5 , now())>
	</cflock>
</cfif>

<cflock scope="Application" type="readonly" timeout="10">
	<cfset thisMovieID = Application.movieRotation.currentMovie>
</cflock>

<cfquery name="GetFilm" dataSource="#Request.dataSource#">
	SELECT MovieTitle, Summary, Rating, AmountBudgeted, DateInTheaters FROM Films f, FilmsRatings r
	WHERE FilmID = <cfqueryparam cfsqltype="cf_sql_integer" value="#thisMovieID#">
	AND f.ratingID = r.RatingID
</cfquery>

<cfoutput>
	<style type="text/css">
		TH.fm { background:RoyalBlue;color:white;text-align:left;
		font-family:sans-serif;font-size:10px} 
		TD.fm { background:LightSteelBlue;
		font-family:sans-serif;font-size:12px} 
	 </style>

	<table width="150" align="right" border="0" cellspacing="0">
		<tr><th class="fm">Featured Film</th></tr>
		<tr>
			<td class="fm">
				<b>#getFilm.MovieTitle#</b><br>
				#getFilm.Summary#<br>
				<p align="right">Raged: #getFilm.Rating#</p>
			</td>
		</tr>
		<tr>
			<th class="fm">
				Production Cost $#round(getFilm.AmountBudgeted / 100000)# Million<br>
				In Theaters #dateFormat(getFilm.DateInTheaters, "mmmm d")#<br>
			</th>
		</tr>
	</table>
	<br clear="all">
</cfoutput>