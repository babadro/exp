<!---
Name:        window2.cfm
Author:      Raymond Camden (ray@camdenfamily.com)
Description: Ajax-loaded window
--->

<p>
This is content on the main page. 
</p>

<cfwindow title="Logon Window" center="true" width="300" 
          height="300" modal="true" initShow="true"
          source="content1.cfm" />
