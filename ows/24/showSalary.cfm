<!--- 
 Filename: showSalary.cfm
 Author: Ken Fricklas (KF)
 Purpose: Demonstrate CFC roles
--->
<HTML>
<HEAD>
<TITLE>What were they paid?</TITLE>
</HEAD>

<BODY>
<!--- Make sure they are logged in. Change roles to "User" to see what happens if they don't have sufficient access. --->
<cfloginuser name="Test" password="dummy" roles="Producers">
<!--- Invoke actors component.  getActorSalary method will fail unless 
  they have sufficient access. --->
<cfset cfcActor = new actor(datasource="ows")>
<cfset salaryHistory = cfcActor.getActorSalary(17)>
<h1>Salaries of our stars...</h1>
<cfoutput>
<H2>
#salaryHistory.NameFirst# #salaryHistory.NameLast#</H2>
<cfloop query="salaryHistory">
  #MovieTitle# - #dollarFormat(Salary)#<BR>
</cfloop>
</cfoutput>
</BODY>
</HTML>
