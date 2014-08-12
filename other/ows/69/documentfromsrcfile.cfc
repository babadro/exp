<!---
   Name:        documentfromsrcfile.cfc
   Author:      Josh Adams
   Description: Document from Srcfile Service, a child service of Document
                Service, of the ColdFusion 9 Exposed Services Layer
   Created:     May 27, 2010
--->

<cfcomponent displayname="DocumentFromSrcfileService"
   hint="Document from Srcfile Service, a subservice of Document Service, of the ColdFusion 9 Exposed Services Layer"
   extends="base" output="false"> <!---Extend base.cfc.--->
   
   <!---Create the generate method to generate the PDF.--->
   <cffunction name="generate" access="remote" output="false"
      displayname="Generate" description="Generate method" hint="Generates the document from the supplied srcfile"
      returnFormat="plain" returntype="string">
      
      <!---Create the arguments the generate method takes.--->
      <cfargument name="serviceusername" displayname="Service User Name"
         hint="User Name for the service" required="true" type="string">
      <cfargument name="servicepassword" displayname="Service Password"
         hint="Password for the service" required="true" type="string">
      <cfargument name="format" displayname="Format"
         hint="Format of the document to generate; corresponds to the format attribute of the <cfdoument> tag"
         required="true" type="string">
      <cfargument name="srcfile" displayname="Source File"
         hint="Absolute path of a file on the server from which to generate the document; corresponds to the srcfile attribute of the <cfdoument> tag"
         required="true" type="string">
      
      <!---
         This dictates the service which must be allowed in ColdFusion
         Administrator to callers of this CFC's methods.
      --->
      <cfset local.parentService = "document">
      
      <!---
         Check that the supplied serviceusername & servicepassword are valid
         for the desired service and if they are, perform the requested work.
      --->
      <cfif isAllowed(arguments.serviceusername, arguments.servicepassword,
         local.parentService) AND isAllowedIP(arguments.serviceusername,
         local.parentService)>
         
         <!---
            Set the temporary file path for the PDF.
         --->
         <cfset local.tempFilePath = GetTempFilePath("temp."
            & LCase(arguments.format))>
         
         <!---
            Generate the PDF.
         --->
         <cfdocument format="#arguments.format#"
            srcfile="#arguments.srcfile#"
            filename="#local.tempFilePath#" />
         
         <!---
            Return the URL to the generated PDF.
         --->
         <cfreturn getHTTPURL(local.tempFilePath)>
      </cfif>
   </cffunction>
</cfcomponent>