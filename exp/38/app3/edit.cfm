<!---
Module:         edit.cfm
Author:         Raymond Camden
Function:       Performs basic editing.
--->

<cfset errors = []>

<cfparam name="url.id" default="0">
<cfif url.id neq 0>
    <cfset director = entityLoadByPk("director", url.id)>
    <cfparam name="form.firstname" default="#director.getFirstName()#">
    <cfparam name="form.lastname" default="#director.getLastName()#">
<cfelse>
    <cfset director = entityNew("director")>
    <cfparam name="form.firstname" default="">
    <cfparam name="form.lastname" default="">
</cfif>

<cfif structKeyExists(form, "submit")>
    <cfif not len(trim(form.firstname))>
        <cfset arrayAppend(errors, "Include a first name.")>
    </cfif>
    <cfif not len(trim(form.lastname))>
        <cfset arrayAppend(errors, "Include a last name.")>
    </cfif>

	<cfif not arrayLen(errors)>
        <cfset director.setFirstName(trim(form.firstname))>
        <cfset director.setLastName(trim(form.lastname))>
        <cfset entitySave(director)>
        <cflocation url="index.cfm" addToken="false">
	</cfif>

</cfif>

<h2>Edit Director</h2>

<cfif arrayLen(errors)>
    <p>
    <b>Please fix these errors:<br/>
	<ul>
	<cfloop index="e" array="#errors#">
    <cfoutput>
    <li>#e#</li>
    </cfoutput>
	</cfloop>
	</ul>
	</b>
	</p>
</cfif>

<cfoutput>
<form action="edit.cfm?id=#url.id#" method="post">
First Name: <input type="text" name="firstname" value="#form.firstname#"><br/>
Last Name: <input type="text" name="lastname" value="#form.lastname#"><br/>
<input type="submit" name="submit" value="Save">
</form>
</cfoutput>