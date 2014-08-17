<!---
 Filename: FilmEntry1a.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Demonstrates use of stored procedures
--->

<!--- Get list of ratings from database --->
<cfquery name="getRatings" datasource="owsSqlServer">
 { CALL FetchRatingsList }
</cfquery>

<html>
<head><title>Film Entry Form</title></head>
<body>
<h2>Film Entry Form</h2>

<!--- Data entry form --->
<cfform action="#cgi.script_name#" method="post" preservedata="Yes">
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
 <cfinput name="amountBudgeted" size="15" required="Yes"
  message="Please enter a valid number for the film's budget."
  validate="float"><br>

 <!--- Drop-down list of ratings --->
 <p><b>Rating:</b><br>
 <cfselect name="ratingID" query="getRatings" value="RatingID" display="Rating"/>
 <!--- Text areas for summary --->
 <p><b>Summary:</b><br>
 <cftextarea name="summary" cols="40" rows="3" wrap="soft"></cftextarea>

 <!--- Submit button for form --->
 <p><cfinput type="submit" name="submit" value="Submit New Film">
</cfform>

</body>
</html>
