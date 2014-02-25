<!--- 
 Filename: ShowFilmExpensesOracle.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Demonstrates use of stored procedures
--->

<!--- Execute stored procedure to fetch film information --->
<cfstoredproc procedure="OWSWEB.FetchFilmInfo" datasource="owsOracle">
   <!--- Provide the FilmID parameter --->
  <cfprocparam type="In" cfsqltype="CF_SQL_INTEGER" value="#URL.filmID#">
  <!--- Film information --->  
  <cfprocresult name="getFilm" resultset="1">
  <!--- Expense information --->  
  <cfprocresult name="getExpenses" resultset="2">
  <!--- Actor information --->  
  <cfprocresult name="getActors" resultset="3">
  <!--- Director information --->  
  <cfprocresult name="getDirectors" resultset="4">
  <!--- Director information --->  
  <cfprocresult name="getMerch" resultset="5">
</cfstoredproc>

<!--- Get subtotals from the recordsets returned by stored procedure --->
<cfset expenseSum = arraySum(listToArray(valueList(getExpenses.ExpenseAmount)))>
<cfset actorSum  = arraySum(listToArray(valueList(GetActors.Salary)))>
<cfset directorSum = arraySum(listToArray(valueList(GetDirectors.Salary)))>
<cfset merchSum  = arraySum(listToArray(valueList(GetMerch.TotalSales)))>
<!--- Add up all expenses --->
<cfset totalExpenses = expenseSum + actorSum + directorSum - merchSum>
<!--- Determine how much money is left in the budget --->
<cfset leftInBudget = getFilm.AmountBudgeted - totalExpenses>

<html>
<head><title>Film Expenses</title></head>
<body>
<!--- Company logo and page title --->
<img src="../images/logo_b.gif" width="73" height="73" align="absmiddle">
<font size="+2"><b>Film Expenses</b></font><br clear="all">
 
<cfoutput>
 <!--- Show film title--->
 <p><b>Film:</b> #getFilm.MovieTitle#<br>
 <!--- Film budget, expense total, and amount left in budget --->
 <p><b>Budget:</b> #lsCurrencyFormat(getFilm.AmountBudgeted)#<br>
 <b>Expenses:</b> #lsCurrencyFormat(totalExpenses)#<br>
 <b>Currently:</b> #lsCurrencyFormat(leftInBudget)# 
 <!--- Are we currently over or under budget? --->
 #iif(leftInBudget lt 0, "'over budget'", "'under budget'")#<br>
 <!--- Output information about actors ---> 
 <p><b>Actors:</b>
 <cfloop query="getActors">
  <li>#NameFirst# #NameLast# (Salary: #lsCurrencyFormat(Salary)#)
 </cfloop>
 <!--- Output information about directors --->
 <p><b>Directors:</b>
 <cfloop query="getDirectors">
  <li>#FirstName# #LastName# (Salary: #lsCurrencyFormat(Salary)#)
 </cfloop>
 <!--- Output information about expenses ---> 
 <p><b>Other Expenses:</b>
 <cfloop QUERY="GetExpenses">
  <li>#Description# (#lsCurrencyFormat(ExpenseAmount)#)
 </cfloop>
 <!--- Output information about merchandise ---> 
 <p><b>Income from merchandise:</b>
 <cfloop query="getMerch">
  <li>#MerchName# (Sales: #lsCurrencyFormat(TotalSales)#)
 </cfloop>
</cfoutput>
</body>
</html> 
