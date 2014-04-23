<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
function errorhandler(id,message) {
alert("Error while updating\n Error code: "+id+"\n Message: "+message);
}
</script>
</head>
<body>
<cfform name="form01">
<cfgrid format="html" name="grid01" pagesize=11
stripeRows=true stripeRowColor="gray"
bind="cfc:places.getData({cfgridpage},{cfgridpagesize},
{cfgridsortcolumn},{cfgridsortdirection})"
delete="yes" selectmode="edit"
onchange="cfc:places.editData({cfgridaction},{cfgridrow},{cfgridchanged})">
<cfgridcolumn name="Emp_ID" display=true header="Employee ID"/>
<cfgridcolumn name="FirstName" display=true header="Name"/>
<cfgridcolumn name="Email" display=true header="Email"/>
</cfgrid>


</cfform>


</body>
</html>