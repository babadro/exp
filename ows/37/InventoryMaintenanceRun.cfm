<!---
 Filename: InventoryMaintenanceRun.cfm
 Author:  Nate Weiss (NMW)
 Purpose: Demonstrates use of the <cfstoredproc> tag
--->

<html>
<head><title>Inventory Maintenance</title></head>
<body>
<h2>Inventory Maintenance</h2>

<!--- If the submit button was not just pressed, display form --->
<cfif not isDefined("form.executeNow")>

  <!--- Provide button to start stored procedure --->
  <cfform action="#cgi.script_name#" method="post">
  <cfinput type="submit" name="executeNow"
           value="Perform Inventory Maintenance">
  </cfform>

<!--- If the user just clicked the submit button --->
<cfelse>

  <p>Executing stored procedure...</p>
  <!--- Go ahead and execute the stored procedure --->
  <cfstoredproc procedure="PerformInventoryMaintenance"
                datasource="owsSqlServer">
  <p>Done executing stored procedure!</p>

</cfif>
</body>
</html>
