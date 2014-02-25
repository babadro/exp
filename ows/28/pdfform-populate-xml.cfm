<!---
Filename: pdfform-populate-xml.cfm
Author: John C. Bland II (jcbii)
Purpose: Populates the pdf form from inline xml data
--->

<!--- Save XML info to a variable --->
<cfsavecontent variable="pdfxml">
<form1>
  <EmployeeName>John C. Bland II</EmployeeName>
  <EmployeeID>32</EmployeeID>
  <DepartmentManager>Ben Forta</DepartmentManager>
  <Date>08/27/2009</Date>
  <Monday>5</Monday>
  <Monday>10</Monday>
  <Tuesday>7</Tuesday>
  <Tuesday>18</Tuesday>
  <Activity>CF 9</Activity>
</form1>
</cfsavecontent>

<!--- Populate form data from XML and show in browser --->
<cfpdfform name="timesheet" action="populate" xmldata="#pdfxml#"
           source="samples/Adobe Derby Timesheet.pdf" />
<!--- Reads the pdf into result var --->
<cfpdfform result="result" action="read" source="#timesheet#" />
<!--- Dumps the pdf form contents --->
<cfdump var="#result#" />
