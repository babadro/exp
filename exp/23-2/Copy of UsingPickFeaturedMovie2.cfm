<!--- 
 Filename: UsingPickFeaturedMovie2.cfm
 Author: Nate Weiss (NMW)
 Purpose: Shows how <cf_PickFeaturedMovie2> can be used in a ColdFusion page
--->

<!--- Page Title and Text Message --->
<h2>Movie Display Demonstration</h2>

<!--- Pick rotating Featured Movie to show, via Custom Tag --->
<cf_PickFeaturedMovie2 returnVariable="showThisMovieID">
 
<!--- Display Film info as "callout", via Custom Tag --->
<cf_showMovieCallout filmID="#showThisMovieID#"> 
