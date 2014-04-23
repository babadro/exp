<cfform>
<cfgrid
format="html"
name="grid01"
pagesize=10
title="Employee database"
bind="cfc:mycfcs.employee.getEmployees({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
onChange="cfc:mycfcs. employee.editEmployees({cfgridaction},{cfgridrow},{cfgridchanged})">
<cfgridcolumn name="Emp_ID" display=false header="ID" />
<cfgridcolumn name="FirstName" display=true header="First Name"/>
<cfgridcolumn name="Email" display=true header="Email"/>
<cfgridcolumn name="Department" display=true header="Department" />
</cfgrid>
</cfform>