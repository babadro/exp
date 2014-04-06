<cfparam name="attributes.filmID" type="numeric">
<cfparam name="attributes.showCost" type="boolean" default="yes">
<cfparam name="attributes.showReleaseDate" type="boolean" default="yes">
<cfparam name="attributes.tableAlign" type="string" default="right">
<cfparam name="attributes.tableWidth" type="string" default="150">
<cfparam name="attributes.caption" type="string" default="Featured Film">
<cfparam name="attributes.DataSource" type="string" default="ows">

<cfquery name="getFilm" datasource="#attributes.dataSource#">SELECT MovieTitle, Summary, AmountBudgeted, DateInTheaters FROM Films WHERE FilmID = #attributes.filmID#</cfquery>

<cfif getFilm.recordCount neq 1>	<cfthrow message="Invalid FilmID Attribute" detail="Film #attributes.filmID# doesn't exist!">	</cfif>

<cfset productCost = ceiling(val(getFilm.AmountBudgeted) / 1000000)>
<cfset releaseDate = dateFormat(getFilm.DateInTheaters, "mmmm d")>

<cfoutput>
	<style type="text/css">
		th.fm { background:RoyalBlue;color:white;text-align:left;
		font-family:sans-serif;font-size:10px} 
		td.fm { background:LightSteelBlue;
		font-family:sans-serif;font-size:12px} 
	</style>
	
	<table width="#attributes.tableWidth#" aligh="#attributes.tableAlign#" border="0" cellSpacing="0">
		<tr><th class="fm">#attributes.caption#</th></tr>
		<tr><td class="fm">
			<b>#getFilm.MovieTitle#</b><br>
			#getFilm.Summary#<br>
		</td></tr>
		<cfif attributes.showCost or attributes.showReleasedate>
			<tr><th class="fm">
					<cfif attributes.showCost>Production Cost $#ProductCost# Million<br></cfif>
					<cfif attributes.showReleasedate>In Theaters #ReleaseDate#<br></cfif>
			</th></tr>
		</cfif>
	</table>
	<br clear="all">
</cfoutput> 
