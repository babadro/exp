<!---
 Filename: FilmEntry2.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Demonstrates use of stored procedures
--->

<!--- Is the form being submitted? --->
<cfset wasFormSubmitted = isDefined("form.ratingID")>

<!--- Insert film into database when form is submitted --->
<cfif wasFormSubmitted>
 <cfstoredproc procedure="InsertFilm" datasource="owsSqlServer" returncode="Yes">
  <!--- Provide form values to the procedure's input parameters --->
  <cfprocparam type="In" maxlength="50" cfsqltype="CF_SQL_VARCHAR"
   value="#form.movieTitle#">
  <cfprocparam type="In" maxlength="100" cfsqltype="CF_SQL_VARCHAR"
   value="#form.pitchText#">
  <cfprocparam type="In" maxlength="100" cfsqltype="CF_SQL_MONEY"
   value="#form.amountBudgeted#"
   null="#yesNoFormat(form.amountBudgeted eq '')#">
  <cfprocparam type="In" maxlength="100" cfsqltype="CF_SQL_INTEGER"
   value="#form.ratingID#">
  <cfprocparam type="In" cfsqltype="CF_SQL_LONGVARCHAR" value="#form.summary#">
  <!--- Capture @NewFilmID output parameter --->
  <!--- Value will be available in CFML variable named #InsertedFilmID# --->
  <cfprocparam type="Out" cfsqltype="CF_SQL_INTEGER" variable="InsertedFilmID">
 </cfstoredproc>

 <!--- Remember the status code returned by the stored procedure --->
 <cfset insertStatus = CFSTOREDPROC.StatusCode>
</cfif>

<!--- Get list of ratings from database --->
<cfstoredproc procedure="FetchRatingsList" datasource="owsSqlServer">
 <cfprocresult name="getRatings">
</cfstoredproc>

<html>
<head><title>Film Entry Form</title></head>
<body>
<h2>Film Entry Form</h2>

<!--- Data entry form --->
<cfform action="#CGI.script_name#" method="post" preserveData="Yes">

 <!--- Text entry field for film title --->
 <p><b>Title for New Film:</b><br>
 <cfinput name="movieTitle" size="50" maxlength="50" required="Yes"
  message="Please don't leave the film's title blank."><br>

 <!--- Text entry field for pitch text --->
 <p><b>Short Description / One-Liner:</b><br>
 <cfinput name="pitchText" size="50" maxlength="100" required="Yes"
  message="Please don't leave the one-liner blank."><br>

 <!--- Text entry field for expense description --->
 <p><b>New Film Budget:</b><br>
 <cfinput name="amountBudgeted" size="15" required="No"
  message="Only numbers may be provided for the film's budget."
  validate="float"> (leave blank if unknown)<br>

 <!--- Drop-down list of ratings --->
 <p><b>Rating:</b><br>
 <cfselect name="ratingID" query="getRatings" value="RatingID" display="Rating"/>

 <!--- Text areas for summary --->
 <p><b>Summary:</b><br>
 <cftextarea name="summary" cols="40" rows="3" wrap="soft"></cftextarea>

<!--- Submit button for form --->
 <p><cfinput type="submit" name="submit" value="Submit New Film">
</cfform>

<!--- If we executed the stored procedure --->
<cfif wasFormSubmitted>
 <!--- Display message based on status code reported by stored procedure --->
 <cfswitch expression="#insertStatus#">
  <!--- If the stored procedure returned a "success" status --->
  <cfcase value="1">
   <cfoutput>
    <p>Film "#form.movieTitle#" was inserted as Film ID #insertedFilmID#.<br>
   </cfoutput>
  </cfcase>
  <!--- If the status code was -1 --->
  <cfcase value="-1">
   <cfoutput>
    <p>Film "#Form.MovieTitle#" already exists in the database.<br>
   </cfoutput>
  </cfcase>
  <!--- If the status code was -2 --->
  <cfcase value="-2">
   <p>An invalid rating was provided.<br>
  </cfcase>
  <!--- If any other status code was returned --->
  <cfdefaultcase>
   <p>The procedure returned an unknown status code.<br>
  </cfdefaultcase>
 </cfswitch>
</cfif>

</body>
</html>
