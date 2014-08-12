<!---
Filename: pdfform-populate.cfm
Author: John C. Bland II (jcbii)
Purpose: Populates a pdf form with custom data
--->

<!--- Populate form data --->
<cfpdfform name="timesheet" action="populate" overwrite="yes"
           source="samples/Adobe Derby Timesheet.pdf">
  <cfpdfsubform name="form1">
    <cfpdfformparam name="employeename" value="John C. Bland II" />
    <cfpdfformparam name="employeeid" value="32" />
    <cfpdfformparam name="departmentmanager" value="Ben Forta" />
    <cfpdfformparam name="date"
                    value="#DateFormat(now(), 'mm/dd/yyyy')#" />
    <cfpdfformparam index="1" name="monday" value="5" />
    <cfpdfformparam index="2" name="monday" value="10" />
    <cfpdfformparam index="1" name="tuesday" value="7" />
    <cfpdfformparam index="2" name="tuesday" value="18" />
    <cfpdfformparam index="1" name="activity" value="CF 9" />
  </cfpdfsubform>
</cfpdfform>
<!--- Save populated pdf to XDP file --->
<cfpdfform action="populate" overwrite="yes" source="#timesheet#"
           destination="pdfs/timesheet-populated.xdp" />
