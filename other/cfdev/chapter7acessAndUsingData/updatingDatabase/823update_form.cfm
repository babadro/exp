<html>
<head>
<title>Update Form</title>
</head>
<body>
<cfquery name="GetRecordtoUpdate" datasource="cfdocexamples">
SELECT * FROM Employee
WHERE Emp_ID = #URL.Emp_ID#
</cfquery>
<cfoutput query="GetRecordtoUpdate">
<table>
<form action="update_action.cfm" method="Post">
<input type="Hidden" name="Emp_ID" value="#Emp_ID#"><br>
<tr>
<td>First Name:</td>
<td><input type="text" name="FirstName" value="#FirstName#"></td>
</tr>
<tr>
<td>Last Name:</td>
<td><input type="text" name="LastName" value="#LastName#"></td>
</tr>
<tr>
<td>Department Number:</td>
<td><input type="text" name="Dept_ID" value="#Dept_ID#"></td>
</tr>
<tr>
<td>Start Date:</td>
<td><input type="text" name="StartDate" value="#StartDate#"></td>
</tr>
<tr>
<td>Salary:</td>
<td><input type="text" name="Salary" value="#Salary#"></td>
</tr>
<tr>
<td>Contractor:</td>
<td><cfif #Contract# IS "Yes">
<input type="checkbox" name="Contract" checked>Yes
<cfelse>
<input type="checkbox" name="Contract">Yes
</cfif></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="Submit" value="Update Information"></td>
</tr>
</form>
</table>
</cfoutput>
</body>
</html>