<!---
Filename: resume-file-upload.cfm
Author: John C. Bland II (jcbii)
Purpose: Manages resume file uploads
--->

<!--- Check for the form.resume property to manage uploads --->
<cfif StructKeyExists(form, "resume")>
  <!--- Save the uploaded file --->
  <cffile action="upload" nameconflict="overwrite" filefield="resume"
	        accept="application/msword"
	        destination="#expandPath('pdfs/contacts/')#" />
  <!--- Variables holding filename info --->
	<cfset path = cffile.ServerDirectory & "/" />
	<cfset ext = "." & cffile.ClientFileExt />
  <cfset source = path & cffile.ClientFileName & ext />
	<cfset dest = path & form.contact />
	<!--- Rename the uploaded file to a contact-specific name --->
	<cffile action="rename" source="#source#" destination="#dest##ext#" />
	<!--- Convert uploaded file to PDF and save it --->
	<cfdocument format="pdf" overwrite="yes" filename="#dest#.pdf"
	            srcfile="#dest##ext#" />
	<!--- Redirect to manager --->
	<cflocation url="resume-manager.cfm" />
</cfif>

<!--- Show simple text if a file isn't uploaded (direct page load) --->
No file selected. <a href="resume-manager.cfm">&laquo; Back</a>