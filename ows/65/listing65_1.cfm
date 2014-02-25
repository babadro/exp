<!---
   Name:        listing65_1.cfm
   Author:      Josh Adams
   Description: Makes calls to the SharePoint Users and Groups Web Service
                GetUserCollectionFromWeb action
   Created:     June 8, 2010
--->

<!---Set the domain of the SharePoint Web Services server.--->
<cfset Variables.serverDomain = "localhost">

<!---
   Set the username and password to pass to the SharePoint Web Services
   in order to authenticate with the SharePoint Web Site in IIS.
--->
<cfset Variables.userName = "Administrator">
<cfset Variables.password = "C0ldFusi0n">

<!---
   Invoke the GetUserCollectionFromWeb action of the SharePoint Users and
   Groups Web Service via the <cfinvoke> tag.
--->
<cfinvoke
   webservice="http://#Variables.serverDomain#/_vti_bin/UserGroup.asmx?wsdl"
   method="GetUserCollectionFromWeb" returnvariable="variables.result1"
   username="#Variables.userName#" password="#Variables.password#" />

<!---Dump the result: an object.--->
<cfdump var="#variables.result1#" label="&lt;cfinvoke&gt; result" />

<!---
   Invoke the GetUserCollectionFromWeb action of the SharePoint Users and
   Groups Web Service via the <cfhttp> tag.
--->

<!---Create a SOAP envelope to pass to the Web Service.--->
<cfsavecontent variable="variables.soapEnvelope">
<cfoutput>
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:xsd="http://www.w3.org/2001/XMLSchema"
   xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
   
   <soap:Body>
      <GetUserCollectionFromWeb
         xmlns="http://schemas.microsoft.com/sharepoint/soap/directory/" />
   </soap:Body>
</soap:Envelope>
</cfoutput>
</cfsavecontent>

<!---Use <cfhttp> to post the SOAP envelope to the Web Service.--->
<cfhttp url="http://#Variables.serverDomain#/_vti_bin/UserGroup.asmx"
   method="post" result="variables.result2"
   username="#Variables.userName#" password="#Variables.password#">
   
   <!---<cfhttp> cannot handle GZIP encoding.--->
   <cfhttpparam type="header" name="accept-encoding"
      value="no-compression" />
   
   <!---Provide the header to invoke the GetUserCollectionFromWeb action.--->
   <cfhttpparam type="header" name="SOAPAction"
      value="http://schemas.microsoft.com/sharepoint/soap/directory/GetUserCollectionFromWeb" />
   
   <!---Provide the SOAP envelope.--->
   <cfhttpparam type="xml" value="#Trim(variables.soapEnvelope)#" />
</cfhttp>

<!---Dump the result: a structure with the data in an XML document.--->
<cfdump var="#variables.result2#" label="&lt;cfhttp&gt; result" />

<!---
   Invoke the GetUserCollectionFromWeb action of the SharePoint Users and
   Groups Web Service via the <cfsharepoint> tag.
--->
<cfsharepoint action="GetUserCollectionFromWeb" name="variables.result3"
   username="#Variables.userName#" password="#Variables.password#"
   domain="#Variables.serverDomain#" />

<!---Dump the result: a structure containing the data.--->
<cfdump var="#variables.result3#" label="&lt;cfsharepoint&gt; result" />