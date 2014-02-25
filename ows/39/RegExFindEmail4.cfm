<!--- 
 Filename: RegExFindEmail4.cfm
 Author: Nate Weiss (NMW)
 Purpose: Demonstrates basic use of REFind()
--->

<html>
<head><title>Using a Regular Expression</title></head>
<body>

<!--- The text to search --->
<cfset text = "My email address is nate@nateweiss.com. Write to me anytime. "
 & "You can also use nate@nateweiss.co.uk or Weiss_Nate@nateweiss.com.">

<!--- Start at the beginning of the text --->
<cfset startPos = 1>

<!--- Continue looping indefinitely (until a <CFBREAK> is encountered) --->
<cfloop condition="True">

 <!--- Attempt to find a match --->
 <cfset matchStruct = 
 reFind("([\w._]+)@([\w_]+(\.[\w_]+)+)", text, startPos, True)>

 <!--- Break out of the loop if no match was found ---> 
 <cfif matchStruct.pos[1] eq 0>
  <cfbreak>

 <!--- Otherwise, display the match --->
 <cfelse> 
   <!--- Advance the StartPos so the next iteration finds the next match --->
   <cfset startPos = matchStruct.pos[1] + matchStruct.len[1]>
 
   <!--- The first elements of the arrays represent the overall match --->
   <cfset foundString = mid(text, matchStruct.pos[1], matchStruct.len[1])>
   <!--- The subsequent elements represent each of the subexpressions --->
   <cfset userNamePart = mid(text, matchStruct.pos[2], matchStruct.len[2])>
   <cfset domainPart = mid(text, matchStruct.pos[3], matchStruct.len[3])>
   <cfset suffixPart = mid(text, matchStruct.pos[4], matchStruct.len[4])>
   
   <cfoutput>
   <p>A match was found at position #matchStruct.pos[1]#.<br>
   The actual email address is: <b>#foundString#</B><BR>
   The username part of the address is: #userNamePart#<br>
   The domain part of the address is: #domainPart#<br>
   The suffix part of the address is: #suffixPart#<br>
   </cfoutput>
 </cfif> 

</cfloop>

</body>
</html>
