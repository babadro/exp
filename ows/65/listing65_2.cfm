<!---
   Name:        listing65_2.cfm
   Author:      Josh Adams
   Description: Makes a call to the SharePoint Permissions Web Service
                GetPermissionCollection action
   Created:     June 8, 2010
--->

<!---Create the login strucure for the <cfsharepoint> tag.--->
<cfset Variables.loginStruct = StructNew()>

<!---Set the domain of the SharePoint Web Services server.--->
<cfset Variables.loginStruct.domain = "localhost">

<!---
   Set the username and password to pass to the SharePoint Web Services
   in order to authenticate with the SharePoint Web Site in IIS.
--->
<cfset Variables.loginStruct.userName = "Administrator">
<cfset Variables.loginStruct.password = "C0ldFusi0n">

<!---Create the paramaters structure to pass to the Web Service.--->
<cfset Variables.paramsStruct = {objectName="Calendar", objectType="List"}>

<!---
   Invoke the GetPermissionCollection action of the SharePoint Permissions
   Web Service via the <cfsharepoint> tag.
--->
<cfsharepoint action="GetPermissionCollection" name="variables.result"
   wsdl="http://#Variables.loginStruct.domain#/_vti_bin/Permissions.asmx?wsdl"
   params="#Variables.paramsStruct#" login="#Variables.loginStruct#" />

<!---Dump the result: a structure containing the data.--->
<cfdump var="#variables.result#" label="&lt;cfsharepoint&gt; result" />