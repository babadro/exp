<cfcomponent>
<cfscript>
remote any function getEmployees(page,pageSize,gridsortcolumn="EMP_ID",gridsortdirection="ASC"){
var startRow = (page-1)*pageSize;
var endRow = page*pageSize;
if(!isdefined("arguments.gridsortcolumn") or isdefined("arguments.gridsortcolumn") and trim(arguments.gridsortcolumn) eq "")
gridsortcolumn = "EMP_ID";
if(!isdefined("arguments.gridsortdirection") or isdefined("arguments.gridsortdirection") and arguments.gridsortdirection eq "")
gridsortdirection = "ASC";
var mysql = "SELECT Emp_ID, FirstName, EMail, Department FROM Employees";
if(isdefined("arguments.gridsortcolumn") and arguments.gridsortcolumn neq "")
mysql = mysql & " ORDER BY " & gridsortcolumn;
if(isdefined("arguments.gridsortdirection") and arguments.gridsortdirection neq "")
mysql = mysql & " " & gridsortdirection ;
rs1 = new query(name="team", datasource="cfdocexamples", sql=mysql).execute();
return QueryConvertForGrid(rs1.getResult(), page, pageSize);
}
remote any function editEmployees(gridaction,gridrow,gridchanged){
writelog("edit employee info");
}
</cfscript>
</cfcomponent>