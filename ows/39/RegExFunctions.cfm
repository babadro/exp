<!--- 
 Filename: RegExFunctions.cfm
 Author: Nate Weiss (NMW)
 Purpose: Implements a UDF library for working with regular expression
--->


<!--- REFindString() function --->
<cffunction name="reFindString" returntype="string" output="false">
 <!--- Function arguments --->
 <cfargument name="regEx" type="string" required="yes">
 <cfargument name="string" type="string" required="yes">
 <cfargument name="start" type="numeric" required="no" default="1">
 <cfargument name="caseSensitive" type="boolean" required="no" default="no">

 <!--- The value to return (start off with an empty string) --->
 <cfset var result = "">
 <cfset var foundstruct = "">
 
 <!--- Perform the regular expression operation --->
 <cfif ARGUMENTS.caseSensitive>
   <cfset foundStruct = reFind(regEx, string, start, true)>
 <cfelse> 
  <cfset foundStruct = reFindNoCase(regEx, string, start, true)>
 </cfif>
 
 <!--- If a match was found, use the found string as the result --->
 <cfif foundStruct.pos[1] gt 0>
 <cfset result = mid(string, foundStruct.pos[1], foundStruct.len[1])>
 </cfif>
 
 <!--- Return the result --->
 <cfreturn result>
</cffunction>

<!--- AdjustNewlinesToLinefeeds() function --->
<cffunction name="adjustNewlinesToLinefeeds" returntype="string" output="false">
 <!--- argument: string --->
 <cfargument name="string" type="string" required="yes">
 
 <!--- Replace all CRLF sequences with just LF --->
 <cfset var result = reReplace(string, chr(13)&chr(10), chr(10), "ALL")>

 <!--- Replace any remaining CR characters with LF --->
 <cfset result = reReplace(string, chr(13), chr(10), "ALL")>
 
 <!--- Return the result --->
 <cfreturn result>
</cffunction>
