<!---
 Filename: EditableHomePage2.cfm
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
 <cfset form.messageText = reReplace(form.messageText,
 "<[^>]*>", <!--- (matches tags) --->
 "", <!--- (replace with empty string) --->
 "ALL")>

 <!--- Save the "before" version of the new message --->
 <cfset application.homePage.messageAsPosted = form.messageText>

 <!--- Format any lazily-typed phone numbers in (999)999-999 format --->
 <cfset form.MessageText = reReplaceNoCase(form.messageText,
 "([0-9]{3})[-/ ]([0-9]{3})[- ]([0-9]{4})", <!--- (matches phone) --->
 "(\1)\2-\3", <!--- (phone format) --->
 "ALL")>

 <!--- Surround all email addresses with "mailto" links --->
 <cfset form.messageText = reReplaceNoCase(form.messageText,
 "(([\w._]+)@([\w_]+(\.[\w_]+)+))", <!--- (matches email addresses) --->
 "<a href=mailto:\1>\1</a>", <!--- (email address in link) --->
 "ALL")>

 <!--- Save the "after" version of the new message --->
 <cfset application.homePage.messageToDisplay = form.messageText>
</cfif>

<!--- This include file takes care of dispaying the actual page --->
<!--- (including the message) or the form for editing the message --->
<cfinclude template="EditableHomePageDisplay.cfm">
