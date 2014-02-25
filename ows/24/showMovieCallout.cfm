<!--- 
  <CF_ShowMovieCallout> Custom Tag
  Retrieves and displays the given film
  
  Example of Use:
  <cf_ShowMovieCallout
  FilmID="5">
 --->

 <!--- Tag Attributes --->
 <!--- FilmID Attribute is Required --->
 <cfparam name="ATTRIBUTES.filmID" type="numeric">
 <!--- Whether to reveal cost/release dates (optional) --->
 <cfparam name="ATTRIBUTES.showCost" type="boolean" default="yes">
 <cfparam name="ATTRIBUTES.showReleaseDate" type="boolean" default="Yes">
 <!--- Optional formatting and placement options --->
 <cfparam name="ATTRIBUTES.tableAlign" type="string" default="right">
 <cfparam name="ATTRIBUTES.tableWidth" type="string" default="150">
 <cfparam name="ATTRIBUTES.caption" type="string" default="Featured Film">
 <!--- Use "ows" datasource by default --->
 <cfparam name="ATTRIBUTES.DataSource" type="string" default="ows">

 <!--- Get important info about film from database --->
 <cfquery name="getFilm" datasource="#ATTRIBUTES.dataSource#">
  SELECT 
  MovieTitle, Summary, 
  AmountBudgeted, DateInTheaters
  FROM Films
  WHERE FilmID = #ATTRIBUTES.filmID#
 </cfquery>

 <!--- Display error message if record not fetched --->
 <cfif getFilm.recordCount neq 1>
  <cfthrow message="Invalid FilmID Attribute"
  detail="Film #ATTRIBUTES.filmID# does not exist!">
 </cfif>

 <!--- Format a few queried values in local variables --->
 <cfset productCost = ceiling(val(getFilm.AmountBudgeted) / 1000000)>
 <cfset releaseDate = dateFormat(getFilm.DateInTheaters, "mmmm d")>

 <!--- Now Display The Specified Movie --->
 <cfoutput>
  <!--- Define formatting for film display --->
  <style type="text/css">
  th.fm {background:RoyalBlue;color:white;text-align:left;
  font-family:sans-serif;font-size:10px}
  td.fm {background:LightSteelBlue;
  font-family:sans-serif;font-size:12px}
  </style>

  <!--- Show info about featured movie in HTML Table --->
  <table width="#ATTRIBUTES.tableWidth#" align="#ATTRIBUTES.tableAlign#" 
  border="0" 
  cellSpacing="0">
  
  <tr><th class="fm">#ATTRIBUTES.caption#</th></tr>
  
  <!--- Movie Title, Summary, Rating --->
  <tr><td class="fm">
  <b>#getFilm.MovieTitle#</b><br>
  #getFilm.Summary#<br>
  </td></tr>
  
  <!--- Cost (rounded to millions), release date --->
  <cfif ATTRIBUTES.showCost or ATTRIBUTES.showReleaseDate>
  <tr><th class="fm">
  <!--- Show Cost, if called for --->
  <cfif ATTRIBUTES.showCost>
  Production Cost $#ProductCost# Million<br>
  </cfif>
  <!--- Show release date, if called for --->
  <cfif ATTRIBUTES.showReleaseDate>
  In Theaters #ReleaseDate#<br>
  </cfif>
  </th></tr>
  </cfif>
  </table>
  <br clear="all">
 </cfoutput>

