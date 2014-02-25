<!---
 Filename: EditableHomePage1.cfm
 Author: Nate Weiss (NMW)
 Purpose: Example of altering text with regular expressions
--->

<!--- Enable application variables --->
<cfapplication name="OrangeWhipIntranet">

<!--- Declare the HomePage variables and give them initial values --->
<cfparam name="application.homePage" default="#structNew()#">
<cfparam name="application.homePage.messageAsPosted" type="string" default="">
<cfparam name="application.homePage.messageToDisplay" type="string" default="">

<!--- If the user is submitting an edited message --->
<cfif isDefined("form.messageText")>

 <!--- First of all, remove all tags from the posted message --->
 <cfset messageWithoutTags = reReplace(form.messageText,
 "<.*?>", <!--- (matches tags) --->
 "", <!--- (replace with empty string) --->
 "ALL")>

 <!--- Save the "before" version of the new message --->
 <cfset application.homePage.messageAsPosted = messageWithoutTags>

 <!---
 (other code will be added here in following examples)
 --->

 <!--- Save the "after" version of the new message --->
 <cfset application.homePage.messageToDisplay = messageWithoutTags>
</cfif>

<!--- This include file takes care of dispaying the actual page --->
<!--- (including the message) or the form for editing the message --->
<cfinclude template="EditableHomePageDisplay.cfm">
