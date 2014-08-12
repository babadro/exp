<!--- 
 Filename: SimpleFileWrite.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Exhibits how to read, change, and re-write a text file
--->

<!--- Does the file exist? --->
<cfif fileExists(expandPath("./test.txt"))>
  <!--- Read the contents of the text file into a string variable --->
  <cffile action="read" file="#expandPath('./test.txt')#" variable="content">
<cfelse>
  <!--- Set it to a blank string --->
  <cfset content = "">
</cfif>

<!--- Modify the contents of the variable --->
<cfset text = "File Modified using ColdFusion on: ">
<cfset text = text & dateFormat(now(),"mm/dd/yyyy") & " at ">
<cfset text = text & timeFormat(now(),"h:mm:ss tt")>
<cfset revisedContent = content & text>

<!--- Write the contents of the variable back out to disk --->
<cffile action="write" file="#expandPath('./test.txt')#" output="#revisedContent#" 
 addnewline="Yes">
 
<!--- Display the file's revised contents ---> 
<cfoutput>
#expandPath("./test.txt")# was modified, as shown below:
<p/>
#htmlCodeFormat(revisedContent)#
</cfoutput>
