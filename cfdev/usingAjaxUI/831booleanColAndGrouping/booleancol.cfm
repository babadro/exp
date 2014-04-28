<cfset emps = querynew("firstname,department, salary,active")>
<cfset queryaddrow(emps,10)>
<cfset querysetcell(emps,"firstname","Debra",1)>
<cfset querysetcell(emps,"department","Accounting",1)>
<cfset querysetcell(emps,"salary","100000",1)>
<cfset querysetcell(emps,"active","Y",1)>
<cfset querysetcell(emps,"firstname","Doherty",2)>
<cfset querysetcell(emps,"department","Finance",2)>
<cfset querysetcell(emps,"salary","120000",2)>
<cfset querysetcell(emps,"active","Yes",2)>
<cfset querysetcell(emps,"firstname","Ben",3)>
<cfset querysetcell(emps,"department","Law",3)>
<cfset querysetcell(emps,"salary","200000",3)>
<cfset querysetcell(emps,"active","true",3)>
<cfset querysetcell(emps,"firstname","Aaron",4)>
<cfset querysetcell(emps,"department","Accounting",4)>
<cfset querysetcell(emps,"salary","200000",4)>
<cfset querysetcell(emps,"active","1",4)>
<cfset querysetcell(emps,"firstname","Josh",5)>
<cfset querysetcell(emps,"department","CF",5)>
<cfset querysetcell(emps,"salary","400000",5)>
<cfset querysetcell(emps,"active",true,5)>
<cfset querysetcell(emps,"firstname","Peterson",6)>
<cfset querysetcell(emps,"department","Accounting",6)>
<cfset querysetcell(emps,"salary","150000",6)>
<cfset querysetcell(emps,"active","0",6)>
<cfset querysetcell(emps,"firstname","Damon",7)>
<cfset querysetcell(emps,"department","Finance",7)>
<cfset querysetcell(emps,"salary","100000",7)>
<cfset querysetcell(emps,"active","N",7)>
<cfset querysetcell(emps,"firstname","Tom",8)>
<cfset querysetcell(emps,"department","CF",8)>
<cfset querysetcell(emps,"salary","100000",8)>
<cfset querysetcell(emps,"active","false",8)>
<cfset querysetcell(emps,"firstname","Adam",9)>
<cfset querysetcell(emps,"department","CF",9)>
<cfset querysetcell(emps,"salary","300000",9)>
<cfset querysetcell(emps,"active",false,9)>
<cfset querysetcell(emps,"firstname","Sean",10)>
<cfset querysetcell(emps,"department","CF",10)>
<cfset querysetcell(emps,"salary","250000",10)>
<cfset querysetcell(emps,"active","No",10)>

<cfset myvar = "10rub,20rub">

<cfform name="form01">
<cfgrid format="html" insert="yes" insertButton="Add Row"
name="grid01"
selectmode="edit"
width=600
collapsible="true"
title="Employees"
autowidth="yes"
query="emps"
sort="yes"
groupField="active">
<cfgridcolumn name="FirstName" header="FirstName"/>
<cfgridcolumn name="Department" header="Department" />
<cfgridcolumn name="Salary" display=true header="Salary" type="numeric" values=#myvar# valuesdisplay=#myvar#/>
<cfgridcolumn name="Active" display=true header="Contract" type="boolean" />
</cfgrid>
</cfform>