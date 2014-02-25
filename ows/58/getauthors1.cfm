<!--- 
 Filename: getauthors1.cfm
 Purpose: Get the authors data
--->

<cfhttp method="GET"
 url="#getBaseURL()#/authors.txt"
 name="authors" delimiter="," textQualifier="""">

<table border="1">
<tr>
<th align="left">Last Name</th>
<th align="left">First Name</th>
</tr>
<cfoutput query="authors">
<tr>
<td align="left">#authors.lastname#</td>
<td align="left">#authors.firstname#</td>
</tr>
</cfoutput>
</table>
