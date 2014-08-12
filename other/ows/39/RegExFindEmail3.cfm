<!---
 Filename: RegExFindEmail3.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates basic use of REFind()
--->

<!--- The text to search --->
<cfset text = "My email address is nate@nateweiss.com. Write to me anytime.">

<!--- Attempt to find a match --->
<cfset matchStruct = reFind("([\w._]+)@([\w_]+(\.[\w_]+)+)", text, 1, True)>

<!--- Display the result --->
<cfif matchStruct.pos[1] gt 0>

 <!--- The first elements of the arrays represent the overall match --->
 <cfset foundString = mid(text, matchStruct.pos[1], matchStruct.len[1])>
 <!--- The subsequent elements represent each of the subexpressions --->
 <cfset userNamePart = mid(text, matchStruct.pos[2], matchStruct.len[2])>
 <cfset domainPart = mid(text, matchStruct.pos[3], matchStruct.len[3])>
 <cfset suffixPart = mid(text, matchStruct.pos[4], matchStruct.len[4])>

 <cfoutput>
 <p>A match was found at position #matchStruct.pos[1]#.<br>
 The actual email address is: <b>#foundString#</b><br>
 The username part of the address is: #userNamePart#<br>
 The domain part of the address is: #domainPart#<br>
 The suffix part of the address is: #suffixPart#<br>
 </p>
 </cfoutput>
<cfelse>
 <p>No matches were found.</p>
</cfif>
