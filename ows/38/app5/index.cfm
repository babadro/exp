<!---
Module:         index.cfm
Author:         Raymond Camden
Function:       Film report
--->

<cfset films = entityLoad("film", {}, "title asc")>

<h1>Film Report</h1>

<table border="1">
    <tr>
       <th>Film</th><th>Release</th><th>Directors</th><th>Actors</th><th>Expenses</th>
    </tr>
    <cfloop index="film" array="#films#">
    <cfoutput>
    <tr>
       <td><a href="edit.cfm?filmid=#film.getId()#">#film.getTitle()#</a><br/>
       <i>#film.getPitch()#</i></td>
       <td>#dateFormat(film.getReleaseDate())#</td>
	   <td>
	   <cfset directors = film.getDirectors()>
	   <cfloop index="director" array="#directors#">
	       #director.getFirstName()# #director.getLastName()#<br/>
	   </cfloop>
	   </td>
       <td>
       <cfset actors = film.getActors()>
       <cfloop index="actor" array="#actors#">
           #actor.getFirstName()# #actor.getLastName()#<br/>
       </cfloop>
       </td>
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