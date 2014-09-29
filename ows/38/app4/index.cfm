<!---
Module:         index.cfm
Author:         Raymond Camden
Function:       Film/Expense report
--->

<cfset films = entityLoad("film", {}, "title asc")>

<cfdump var="#films#">

<h1>Film Report</h1>

<table border="1">
    <tr>
	   <th>Film</th><th>Release</th><th>Expenses</th>
	</tr>
	<cfloop index="film" array="#films#">
	<cfoutput>
	<tr>
	   <td>#film.getTitle()#<br/><i>#film.getPitch()#</i></td>
	   <td>#dateFormat(film.getReleaseDate())#</td>
	   <td>
	   <cfset expenses = film.getExpenses()>
	   <cfloop index="expense" array="#expenses#">
	       #expense.getDescription()# (#dollarFormat(expense.getAmount())#)<br/>
	   </cfloop>
	   </td>
	</tr>
    </cfoutput>
	</cfloop>
</table>