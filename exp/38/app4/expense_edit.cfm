<!---
Module:         expense_edit.cfm
Author:         Raymond Camden
Function:       Allows for expense editing (use with index2.cfm)
--->

<cfset film = entityLoadByPk("film", url.filmid)>

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
</cfif>
<cfif structKeyExists(url, "delete")>
    <cfset expense = entityLoadByPk("expense", url.delete)>
    <cfset entityDelete(expense)>
    <cfset ormFlush()>
</cfif>

<cfoutput>
<h1>Edit Expenses for Film: #film.getTitle()#</h1>

<cfset expenses = film.getExpenses()>

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
	   <td><a href="expense_edit.cfm?filmid=#url.filmid#&delete=#expense.getId()#">Delete</a></td>
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