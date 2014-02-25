<!---
Module:         expense_edit.cfm
Author:         Raymond Camden
Function:       Allows for expense editing (use with index2.cfm)
--->

<cfset film = entityLoadByPk("film", url.filmid)>

<!--- Used to remember which tab was selected --->
<cfset tab = "actors">

<!--- Handles add/deletes for expenses --->
<cfif structKeyExists(form, "addexpense")>
    <cfif len(form.description) and isNumeric(form.amount)>
        <cfset expense = entityNew("expense")>
        <cfset expense.setDescription(form.description)>
        <cfset expense.setAmount(form.amount)>
        <cfset expense.setDate(now())>
        <cfset expense.setFilm(film)>
        <cfset entitySave(expense)>
        <cfset film.addExpenses(expense)>
        <cfset entitySave(film)>
    </cfif>
    <cfset tab = "expenses">
</cfif>
<cfif structKeyExists(url, "deleteexpense")>
    <cfset expense = entityLoadByPk("expense", url.deleteexpense)>
    <cfset entityDelete(expense)>
    <cfset ormFlush()>
    <cfset tab = "expenses">
</cfif>

<!--- Handles updates for actors --->
<cfif structKeyExists(form, "selectactors")>
    <!--- value is a multi select control, could be null --->
	<cfparam name="form.actors" default="">

    <!--- first remove the actors --->
	<cfset actors = film.getActors()>
	<cfloop index="x" from="#arrayLen(actors)#" to="1" step="-1">
	   <cfset film.removeActor(actors[x])>
	</cfloop>
	<!--- now add them - form.actors is a list of IDs --->
	<cfloop index="actorid" list="#form.actors#">
	   <cfset actor = entityLoadByPk("actor", actorid)>
	   <cfset film.addActor(actor)>
	</cfloop>
	<cfset ormFlush()>
	<cfset tab = "actors">
</cfif>

<!--- Handles updates for directors --->
<cfif structKeyExists(form, "selectdirectors")>
    <!--- value is a multi select control, could be null --->
    <cfparam name="form.directors" default="">

    <!--- first remove the directors --->
    <cfset directors = film.getDirectors()>
    <cfloop index="x" from="#arrayLen(directors)#" to="1" step="-1">
       <cfset film.removeDirector(directors[x])>
    </cfloop>
    <!--- now add them - form.actors is a list of IDs --->
    <cfloop index="directorid" list="#form.directors#">
       <cfset director = entityLoadByPk("director", directorid)>
       <cfset film.addDirector(director)>
    </cfloop>
    <cfset ormFlush()>
    <cfset tab = "directors">
</cfif>

<cfoutput>
<h1>Edit Film: #film.getTitle()#</h1>
</cfoutput>

<cflayout type="tab">

	<cflayoutarea title="Actors" selected="#tab is 'actors'#">

    <cfset allActors = entityLoad("actor",{},  "lastname asc")>

    <cfoutput>
    <form action="#cgi.script_name#?filmid=#url.filmid#" method="post">
    <select name="actors" multiple size="20">
    <cfloop index="actor" array="#allActors#">
	   <option value="#actor.getActorId()#" <cfif film.hasActor(actor)>selected</cfif>>
       #actor.getLastName()#, #actor.getFirstName()#</option>
	</cfloop>
	</select><br/>
    <input type="submit" name="selectactors" value="Select Actors">
    </form>
    </cfoutput>

	</cflayoutarea>

    <cflayoutarea title="Directors" selected="#tab is 'directors'#">

    <cfset allDirectors = entityLoad("director",{},  "lastname asc")>

    <cfoutput>
    <form action="#cgi.script_name#?filmid=#url.filmid#" method="post">
    <select name="directors" multiple size="20">
    <cfloop index="director" array="#allDirectors#">
       <option value="#director.getDirectorId()#" <cfif film.hasDirector(director)>selected</cfif>>
       #director.getLastName()#, #director.getFirstName()#</option>
    </cfloop>
    </select><br/>
    <input type="submit" name="selectdirectors" value="Select Directors">
    </form>
    </cfoutput>

    </cflayoutarea>

	<cflayoutarea title="Expenses" selected="#tab is 'expenses'#">

	<cfset expenses = film.getExpenses()>

    <cfoutput>
	<table border="1">
	    <tr>
	        <th>Description</th>
			<th>Amount</th>
			<th>Date</th>
			<td>&nbsp;</td>
		</tr>
		<cfloop index="expense" array="#expenses#">
		<tr>
		   <td>#expense.getDescription()#</td>
		   <td>#dollarFormat(expense.getAmount())#</td>
		   <td>#dateFormat(expense.getDate())#</td>
		   <td><a href="edit.cfm?filmid=#url.filmid#&deleteexpense=#expense.getId()#">Delete</a></td>
		</tr>
		</cfloop>
	</table>

	<h2>Add New Expense</h2>

	<form action="#cgi.script_name#?filmid=#url.filmid#" method="post">
	Description: <input type="text" name="description" maxlength="100"><br/>
	Amount: <input type="text" name="amount" maxlength="10" size="10"><br/>
	<input type="submit" name="addexpense" value="Add">
	</form>
	</cfoutput>

	</cflayoutarea>

</cflayout>