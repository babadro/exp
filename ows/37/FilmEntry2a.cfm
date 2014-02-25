<!--- 
  Filename: FilmEntry2a.cfm
  Author:   Nate Weiss (NMW)
  Purpose:  Demonstrates use of stored procedures
--->


<!--- Is the form being submitted? --->
<CFSET WasFormSubmitted = IsDefined("FORM.RatingID")>

<!--- Insert film into database when form is submitted --->
<CFIF WasFormSubmitted>
  <!--- Execute the stored procedure via ODBC's CALL command --->
  <CFQUERY DATASOURCE="owsSqlServer">
    { CALL InsertFilm ( 
      '#Form.MovieTitle#', 
      '#Form.PitchText#', 
       #Form.AmountBudgeted#, 
       #Form.RatingID#, 
      '#Form.Summary#') }
  </CFQUERY>
  <!--- Hard code insertStatus since we really don't know. --->
  <cfset insertStatus = 1>
</CFIF>

<!--- Get list of ratings from database --->
<CFSTOREDPROC PROCEDURE="FetchRatingsList" DATASOURCE="owsSqlServer">
  <CFPROCRESULT NAME="GetRatings">  
</CFSTOREDPROC>


<HTML>
<HEAD><TITLE>Film Entry Form</TITLE></HEAD>
<BODY>
<H2>Film Entry Form</H2>

<!--- Data entry form --->
<CFFORM 
  ACTION="#CGI.SCRIPT_NAME#" 
  METHOD="POST" 
  PRESERVEDATA="Yes">

  <!--- Text entry field for film title --->
  <P><B>Title for New Film:</B><BR>
  <CFINPUT 
    NAME="MovieTitle" 
    SIZE="50" 
    MAXLENGTH="50"
    REQUIRED="Yes" 
    MESSAGE="Please don't leave the film's title blank."><BR>

  <!--- Text entry field for pitch text --->
  <P><B>Short Description / One-Liner:</B><BR>
  <CFINPUT 
    NAME="PitchText" 
    SIZE="50" 
    MAXLENGTH="100"
    REQUIRED="Yes" 
    MESSAGE="Please don't leave the one-liner blank."><BR>
  
  <!--- Text entry field for expense description --->
  <P><B>New Film Budget:</B><BR>
  <CFINPUT 
    NAME="AmountBudgeted" 
    SIZE="15" 
    REQUIRED="No" 
    MESSAGE="Only numbers may be provided for the film's budget."
    VALIDATE="float"> (leave blank if unknown)<BR>

  <!--- Drop-down list of ratings --->  
  <P><B>Rating:</B><BR>
  <CFSELECT
    NAME="RatingID"  
    QUERY="GetRatings"
    VALUE="RatingID"
    DISPLAY="Rating"/>

  <!--- Text areas for summary --->
  <P><B>Summary:</B><BR>
  <TEXTAREA NAME="Summary" COLS="40" ROWS="3" WRAP="soft"></TEXTAREA>  
    
  <!--- Submit button for form --->
  <P><INPUT TYPE="Submit" VALUE="Submit New Film">
</CFFORM>  


<!--- If we executed the stored procedure --->
<CFIF WasFormSubmitted>
  <!--- Display message based on status code reported by stored procedure --->
  <CFSWITCH EXPRESSION="#InsertStatus#">
    <!--- If the stored procedure returned a "success" status --->
    <CFCASE VALUE="1">
      <CFOUTPUT>
        <P>Film "#Form.MovieTitle#" was inserted.<BR>
      </CFOUTPUT>  
    </CFCASE>
    <!--- If the status code was -1 --->
    <CFCASE VALUE="-1">
      <CFOUTPUT>
        <P>Film "#Form.MovieTitle#" already exists in the database.<BR>
      </CFOUTPUT>  
    </CFCASE>
    <!--- If the status code was -2 --->
    <CFCASE VALUE="-2">
      <P>An invalid rating was provided.<BR>
    </CFCASE>
    <!--- If any other status code was returned --->
    <CFDEFAULTCASE>
      <P>The procedure returned an unknown status code.<BR>
    </CFDEFAULTCASE>
  </CFSWITCH>
</CFIF>
  
</BODY>
</HTML>
