<!--- 
 Filename: RegExFindPhone1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates basic use of reFind()
--->

<html>
<head><title>Using a Regular Expression</title></head>
<body>

<!--- The text to search --->
<cfset text = "My phone number is (718)555-1212. Call me anytime.">
<!--- Attempt to find a match --->
<cfset matchPos = reFind("(\([0-9]{3}\))([0-9]{3}-[0-9]{4})", text)>

<!--- Display the result --->
<cfif matchPos gt 0>
 <cfset foundString = mid(text, matchPos, 13)>

 <cfoutput>
 <p>A match was found at position #matchPos#.</p>
 <p>The actual match is: #foundString#</p>
 </cfoutput>
<cfelse> 
 <p>No matches were found.</p>
</cfif> 

</body>
</html>
