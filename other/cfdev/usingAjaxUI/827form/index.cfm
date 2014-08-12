<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
<cfform name="form01">
<cfgrid format="html" name="grid01" pagesize=5 sort=true
bind="cfc:places.getData({cfgridpage},{cfgridpagesize},
{cfgridsortcolumn},{cfgridsortdirection})">
<cfgridcolumn name="Emp_ID" display=true header="eid" />
<cfgridcolumn name="FirstName" display=true header="Name"/>
<cfgridcolumn name="Email" display=true header="Email" />
</cfgrid>
</cfform>
</body>
</html>