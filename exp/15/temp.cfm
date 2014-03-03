<cfquery name = "GetCourses" dataSource = "cfdocexamples">
SELECT Course_ID, Dept_ID, CorNumber,
CorName, CorLevel
FROM CourseList
ORDER by Dept_ID ASC, CorNumber ASC
</cfquery>
<h3>cfgrid Example</h3>
<i>Currently available courses</i>
<!--- cfgrid must be inside a cfform tag. --->
<cfform>
<cfgrid name = "FirstGrid" format="flash"
height="320" width="580"
font="Tahoma" fontsize="12"
query = "GetCourses">
</cfgrid>
</cfform>